import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lawma_app/domain/states/charge_card_state.dart';

import '../../domain/repository/paystack_repository.dart';

final sendOtpProvider =
    StateNotifierProvider.autoDispose<SendOtpNotifier, ChargeCardState>((ref) =>
        SendOtpNotifier(
            iPaystackRepository: ref.watch(_iSendOtpProvider), ref: ref));

final _iSendOtpProvider =
    Provider<IPaystackRepository>((ref) => PaystackRepository());

class SendOtpNotifier extends StateNotifier<ChargeCardState> {
  SendOtpNotifier(
      {required IPaystackRepository iPaystackRepository, required Ref ref})
      : _iSendOtpProvider = iPaystackRepository,
        super(ChargeCardState.initial());

  final IPaystackRepository _iSendOtpProvider;
  Ref? ref;

  Future<void> submitOtp(
      {String? reference,
      String? otp,
      required BuildContext context,
      }) async {
    state = ChargeCardState.loading();
    try {
      final result = await _iSendOtpProvider.submitOtp(reference!, otp!);
      result.fold((l) {
        print(l.toString());
        state = ChargeCardState.error(l);
      }, (r) {
        // print(address!.address);
        // notifyWoocomerce(
        //   status: r.data!.status.toString(),
        //   address: address,
        //   price: double.parse(
        //     r.data!.amount.toString(),
        //   ),
        //   context: context,
        // );

        state = ChargeCardState.loading();
      });
    } catch (e) {
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
