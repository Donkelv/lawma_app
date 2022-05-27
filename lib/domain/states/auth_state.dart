import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';




part 'auth_state.freezed.dart';

extension AuthStateExtension on AuthState {
  bool get isInitial => this is _$AuthStateInitial;
  bool get isAuthenticated => this is _$AuthStateAuthenticated;
  bool get isUnauthenticated => this is _$AuthStateUnauthenticated;
}

@freezed 

class AuthState with _$AuthState {
 

  const factory AuthState.initial() = _$AuthStateInitial;

  const factory AuthState.authenticated(User user) = _$AuthStateAuthenticated;

  const factory AuthState.unauthenticated() = _$AuthStateUnauthenticated;
}