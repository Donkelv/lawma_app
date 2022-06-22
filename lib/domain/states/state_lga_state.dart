import 'package:freezed_annotation/freezed_annotation.dart';

part 'state_lga_state.freezed.dart';

extension StateLgaStateExtension on StateLgaState {
  bool get isLoading => this is _$_StateLgaStateLoading;
  bool get isData => this is _$_StateLgaStateData;
}

@freezed
abstract class StateLgaState with _$StateLgaState {
  const factory StateLgaState.initial() = _StateLgaStateInitial;
  const factory StateLgaState.loading() = _StateLgaStateLoading;
  const factory StateLgaState.error(String string) = _StateLgaStateError;
  const factory StateLgaState.data(dynamic stateLga) = _StateLgaStateData;
}
