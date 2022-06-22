import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_driver_state.freezed.dart';

extension CreateDriverStateExtension on CreateDriverState {
  bool get isLoading => this is _$CreateDriverStateLoading;
}

@freezed
class CreateDriverState with _$CreateDriverState {
  const factory CreateDriverState.initial() = _$CreateDriverStateInitial;
  const factory CreateDriverState.laoding() = _$CreateDriverStateLoading;
  const factory CreateDriverState.data(User user) = _$CreateDriverStateData;
  const factory CreateDriverState.error(String error) =
      _$CreateDriverStateError;
}
