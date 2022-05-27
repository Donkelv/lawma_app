import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'auth_loading_state.freezed.dart';

extension AuthLoadingStateExtension on AuthLoadingState {
  bool get isInitial => this is _$AuthLoadingStateInitial;
  bool get isLoading => this is _$AuthLoadingStateLoading;
  bool get isAuthenticated => this is _$AuthLoadingStateAuthenticated;
  bool get isError => this is _$AuthLoadingStateError;
}


class AuthLoadingState with _$AuthLoadingState {
 const factory AuthLoadingState.initial() = _$AuthLoadingStateInitial;
 const factory AuthLoadingState.loading() = _$AuthLoadingStateLoading;
 const factory AuthLoadingState.authenticated(User user) = _$AuthLoadingStateAuthenticated;
 const factory AuthLoadingState.error(String error) = _$AuthLoadingStateError;

}