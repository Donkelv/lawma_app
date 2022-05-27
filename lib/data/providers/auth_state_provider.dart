
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lawma_app/data/notifier/auth_state_notifier.dart';
import 'package:lawma_app/domain/states/auth_state.dart';

final authStateProvider =
    StateNotifierProvider<AuthStateNotifier, AuthState>((ref) {
  return AuthStateNotifier(ref);
});
