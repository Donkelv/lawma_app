import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lawma_app/domain/repository/paystack_repository.dart';
import 'package:lawma_app/domain/states/charge_card_state.dart';
import 'package:lawma_app/presentation/widgets/custom_bottom_sheet.dart';

import '../../presentation/widgets/otp_widget.dart';
import '../models/driver_list_model.dart';

final paystackChargeProvider =
    StateNotifierProvider.autoDispose<PaystackChargeNotifier, ChargeCardState>(
  (ref) => PaystackChargeNotifier(
    iPaystackRepository: ref.watch(_iPayStackChargeRepository),
  ),
);

final _iPayStackChargeRepository =
    Provider<IPaystackRepository>((ref) => PaystackRepository());

class PaystackChargeNotifier extends StateNotifier<ChargeCardState> {
  PaystackChargeNotifier({required IPaystackRepository iPaystackRepository})
      : _iPayStackChargeRepository = iPaystackRepository,
        super(ChargeCardState.initial());

  final IPaystackRepository _iPayStackChargeRepository;

  Future<void> chargeCard({
    String? cardNo,
    String? cvv,
    String? expiryMonth,
    String? expiryYear,
    String? amount,
    String? pin,
    String? currency,
    BuildContext? context,
    DriverListModel? driverList,
    String? weight,
    String? address,
    String? description,
  }) async {
    state = ChargeCardState.loading();
    try {
      final result = await _iPayStackChargeRepository.chargeCard(
        
        cardNo!,
        cvv!,
        expiryMonth!,
        expiryYear!,
        amount!,
        pin!,
        currency!,
      );
      result.fold((l) {
        print(l.toString());
        Fluttertoast.showToast(
            msg: l.toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 12.0.sp);
        state = ChargeCardState.error(l);
      }, (r) {
        Fluttertoast.showToast(
            msg: r.data!.displayText!,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 12.0.sp);
       
        Navigator.pop(context!);
        customBottomSheet(context: context, widget: OtpWidget(
          reference:  r.data!.reference!,
          driverList: driverList,
          address: address,
          description: description,
          weight: weight,
        ));
        print(r);
        state = ChargeCardState.loaded(r);
      });
    } catch (e) {
      print("This is an error $e");
      state = ChargeCardState.error(e.toString());
    }
  }
}
