import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lawma_app/data/notifier/auth_loader_notifier.dart';
import 'package:lawma_app/domain/repository/auth_repository.dart';
import 'package:lawma_app/domain/states/auth_loading_state.dart';
import 'package:lawma_app/domain/states/create_driver_state.dart';

import '../../domain/states/state_lga_state.dart';

final signUpProvider =
    StateNotifierProvider<SignUpNotifier, AuthLoadingState>((ref) {
  return SignUpNotifier(ref, signUpRepository: ref.watch(authLoaderProvider),);
});


final createDriverProvider =
    StateNotifierProvider<CreateDriverNotifier, CreateDriverState>((ref) {
  return CreateDriverNotifier(
    ref,
    createDriverRepository: ref.watch(authLoaderProvider),
  );
});

final signInProvider =
    StateNotifierProvider<SignInLoaderNotifier, AuthLoadingState>((ref) {
  return SignInLoaderNotifier(
    ref,
    signInRepository: ref.watch(authLoaderProvider),
  );
});

final lgaProvider = StateNotifierProvider<GetLGANotifier, StateLgaState>((ref) {
  return GetLGANotifier(
    ref,
    signUpRepository: ref.watch(authLoaderProvider),
  );
});


final authLoaderProvider = Provider<BaseAuthRepository>((ref) {
  return AuthRepository();
});
