import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lawma_app/data/models/driver_list_model.dart';
import 'package:lawma_app/data/models/trans_history_driver.dart';
import 'package:lawma_app/domain/states/charge_card_state.dart';

import '../../domain/repository/paystack_repository.dart';
import '../providers/add_driver_provider.dart';

final sendOtpProvider =
    StateNotifierProvider.autoDispose<SendOtpNotifier, ChargeCardState>((ref) =>
        SendOtpNotifier(ref,
            iPaystackRepository: ref.watch(_iSendOtpProvider)));

final _iSendOtpProvider =
    Provider<IPaystackRepository>((ref) => PaystackRepository());

class SendOtpNotifier extends StateNotifier<ChargeCardState> {
  SendOtpNotifier(this.ref, {required IPaystackRepository iPaystackRepository})
      : _iSendOtpProvider = iPaystackRepository,
        super(const ChargeCardState.initial());

  final IPaystackRepository _iSendOtpProvider;
  Ref ref;
  final _auth = FirebaseAuth.instance;

  Future<void> submitOtp({
    String? reference,
    String? otp,
    DriverListModel? driverListModel,
    String? weight,
    String? address,
    String? description,
    required BuildContext context,
  }) async {
    state = const ChargeCardState.loading();
    try {
      final result = await _iSendOtpProvider.submitOtp(reference!, otp!);
      result.fold((l) {
        Fluttertoast.showToast(
            msg: l.toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 12.0.sp);
        print(l.toString());
        state = ChargeCardState.error(l);
      }, (r) {
        print("Charge card successfull");
        print(r);
        print("success");
        print(
          driverListModel!.userId
        );
        ref.watch(updateDriverProider.notifier).updateDriver(
              context: context,
              userId: driverListModel.userId,
              transHistory: TransHistoryDriverModel(
                date: DateTime.now(),
                //location: location,
                address: address!,
                transId: reference,
                userInfo: UserInfoModel(
                  userId: _auth.currentUser!.uid,
                  userName: "",
                ),
              ),
            );
        // print(address!.address);
        // notifyWoocomerce(
        //   status: r.data!.status.toString(),
        //   address: address,
        //   price: double.parse(
        //     r.data!.amount.toString(),
        //   ),
        //   context: context,
        // );

        state = ChargeCardState.loaded(r);
      });
    } catch (e) {
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 12.0.sp);
      print(e);
      state = ChargeCardState.error(e.toString());
    }
  }

// /////notifiy woocomerce
//   Future<void> notifyWoocomerce({
//     String? status,
//     SelectedAdress? address,
//     double? price,
//     required BuildContext context,
//   }) async {
//     state = ChargeCardState.loading();
//     try {
//       final result = await _iSendOtpProvider.sendOrderToWoocomerce(
//           status: status, address: address, price: price);
//       result.fold((l) {
//         print(l.toString());
//         state = ChargeCardState.error(l);
//       }, (r) {
//         print(r);
//         sendNotification(
//           title: "Order place successfully",
//           content: "Your order has been placed successfully",
//           context: context,
//         );
//         state = ChargeCardState.loading();
//       });
//     } catch (e) {
//       print(e);
//       state = ChargeCardState.error(e.toString());
//     }
//   }

//   ////send notification
//   ///
//   Future<void> sendNotification({
//     String? title,
//     String? content,
//     required BuildContext context,
//   }) async {
//     state = ChargeCardState.loading();
//     try {
//       final result = await _iSendOtpProvider.addNotification(
//         title: title,
//         content: content,
//       );
//       result.fold((l) {
//         print(l.toString());
//         state = ChargeCardState.error(l);
//       }, (r) {
//         //print(r);
//         Navigator.pushNamed(context, SuccessfulOrderScreen.routeName);
//         state = ChargeCardState.loaded(r);
//       });
//     } catch (e) {
//       print(e);
//       state = ChargeCardState.error(e.toString());
//     }
//   }
}
