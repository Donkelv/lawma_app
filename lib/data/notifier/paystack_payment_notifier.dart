import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lawma_app/domain/repository/paystack_repository.dart';
import 'package:lawma_app/domain/states/charge_card_state.dart';

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
        state = ChargeCardState.error(l);
      }, (r) {
        print(r);
        state = ChargeCardState.loaded(r);
      });
    } catch (e) {
      print(e);
      state = ChargeCardState.error(e.toString());
    }
  }
}
