import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lawma_app/domain/repository/auth_repository.dart';
import 'package:lawma_app/domain/states/auth_loading_state.dart';

class SignInLoaderNotifier extends StateNotifier<AuthLoadingState> {
  SignInLoaderNotifier(
    this.ref, {
    required BaseAuthRepository signInRepository,
  })  : _signInRepository = signInRepository,
        super(
          const AuthLoadingState.initial(),
        );
  final Ref ref;
  final BaseAuthRepository _signInRepository;

  Future signIn({String? email, String? password}) async {
    state = const AuthLoadingState.loading();
    try {
      final data =
          await _signInRepository.signInWithEmailAndPassword(email!, password!);
      data.fold(
        (l) => state = AuthLoadingState.error(l.toString()),
        (r) => state =  AuthLoadingState.authenticated(r),
      );
    } catch (e) {
      state = AuthLoadingState.error(e.toString());
    }
  }
}




