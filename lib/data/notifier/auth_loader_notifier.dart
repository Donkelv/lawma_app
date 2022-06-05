import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lawma_app/domain/repository/auth_repository.dart';
import 'package:lawma_app/domain/states/auth_loading_state.dart';

////SIGN IN LOADER NOTIFIER
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
    if (email!.isEmpty || password!.isEmpty) {
      state = const AuthLoadingState.error('Please fill all the fields');
      Fluttertoast.showToast(
          msg: "Please fill all the fields",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 12.0.sp);
      return;
    } else {
      state = const AuthLoadingState.loading();
      try {
        final data = await _signInRepository.signInWithEmailAndPassword(
            email, password);
        data.fold((l) => state = AuthLoadingState.error(l.toString()), (r) {
          state = AuthLoadingState.authenticated(r);
        });
      } catch (e) {

        state = AuthLoadingState.error(e.toString());
        Fluttertoast.showToast(
            msg: "$e",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 12.0.sp);
      }
    }
  }
}

////SIGN UP LOADER NOTIFIER
class SignUpNotifier extends StateNotifier<AuthLoadingState> {
  SignUpNotifier(
    this.ref, {
    required BaseAuthRepository signUpRepository,
  })  : _signUpRepository = signUpRepository,
        super(
          const AuthLoadingState.initial(),
        );

  final Ref ref;
  final BaseAuthRepository _signUpRepository;

  Future signUp({String? email, String? password}) async {
    state = const AuthLoadingState.loading();
    try {
      final data = await _signUpRepository.createUserWithEmailAndPassword(
          email!, password!);
      data.fold((l) => state = AuthLoadingState.error(l.toString()), (r) {
        state = AuthLoadingState.authenticated(r);
      });
    } catch (e) {
      state = AuthLoadingState.error(e.toString());
    }
  }
}
