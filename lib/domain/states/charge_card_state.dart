import 'package:freezed_annotation/freezed_annotation.dart';

part 'charge_card_state.freezed.dart';

extension ChargeCardStateExtension on ChargeCardState {
  bool get isLoading => this is _$_ChargeCardStateLoading;
}

@freezed
class ChargeCardState with _$ChargeCardState {
  const factory ChargeCardState.initial() = _ChargeCardStateInitial;
  const factory ChargeCardState.loading() = _ChargeCardStateLoading;
  const factory ChargeCardState.loaded(
    dynamic loaded,
  ) = _ChargeCardStateLoaded; // SuccessfulChargeCard loaded
  const factory ChargeCardState.error(
    String error,
  ) = _ChargeCardStateError;
}
