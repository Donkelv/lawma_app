import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_data_state.freezed.dart';

extension AddDataStateExtension on AddDataState {
  bool get isInitial => this is _$AddDataStateInitial;
  bool get isLoading => this is _$AddDataStateLoading;
  bool get isSuccess => this is _$AddDataStateSuccess;
  bool get isError => this is  _$AddDataStateError;
}

@freezed

class AddDataState with _$AddDataState {
  const factory AddDataState.initial() = _$AddDataStateInitial;
  const factory AddDataState.loading() = _$AddDataStateLoading;
  const factory AddDataState.success(String? data) = _$AddDataStateSuccess;
  const factory AddDataState.error(String? error) = _$AddDataStateError;
}