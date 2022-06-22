import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lawma_app/data/constant/string_const.dart';
import 'package:lawma_app/data/providers/add_user_provider.dart';
import 'package:lawma_app/data/utils/user_type_model.dart';
import 'package:lawma_app/domain/repository/auth_repository.dart';
import 'package:lawma_app/domain/repository/firebase_get_request_repositories.dart';
import 'package:lawma_app/domain/states/auth_loading_state.dart';
import 'package:lawma_app/presentation/routes/route_generator.dart';

import '../../domain/states/state_lga_state.dart';

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

  Future signIn(
      {String? email, String? password, required BuildContext context}) async {
    final userType = Hive.box<String>(StringConst.userTypeBox);
    final userId = Hive.box<String>(StringConst.userIdBox);
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
        final data =
            await _signInRepository.signInWithEmailAndPassword(email, password);
        data.fold((l) => state = AuthLoadingState.error(l.toString()), (r) {
          userId.put(StringConst.userIdKey, r.uid);
          getUserDocument(r.uid).then((value) {
            Map<String, dynamic> data = value.data() as Map<String, dynamic>;
            userType.put(StringConst.userTypeKey, data['userType']);
          });

          state = AuthLoadingState.authenticated(r);
          //Navigator.pushNamed(context, RouteGenerator.bottomAppBarScreen);
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

  Future signUp(
      {String? fullName,
      String? email,
      String? password,
      String? city,
      String? repeatPassword,
      required BuildContext context}) async {
    //final userType = Hive.box<String>(StringConst.userTypeBox);
    //final userId = Hive.box<String>(StringConst.userIdBox);
    if (fullName!.isEmpty ||
        email!.isEmpty ||
        password!.isEmpty ||
        city!.isEmpty) {
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
    } else if (password != repeatPassword) {
      state = const AuthLoadingState.error(
          'Password does not match\nplease check and try again');
      Fluttertoast.showToast(
          msg: "Password does not match\nplease check and try again",
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
        final data = await _signUpRepository.createUserWithEmailAndPassword(
          email,
          password,
        );
        data.fold((l) {
          state = AuthLoadingState.error(l.toString());
          Fluttertoast.showToast(
              msg: l,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 12.0.sp);
        }, (r) {
          Fluttertoast.showToast(
              msg: "Setting up user data",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 12.0.sp);
          ref.watch(addUserProvider.notifier).addUser(
              userId: r.uid, fullName: fullName, city: city, context: context);
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

/////GET LOCAL GOVERNMENTS AROUND LAGOS STATE
class GetLGANotifier extends StateNotifier<StateLgaState> {
  GetLGANotifier(
    this.ref, {
    required BaseAuthRepository signUpRepository,
  })  : _signUpRepository = signUpRepository,
        super(const StateLgaState.initial());

  final Ref ref;
  final BaseAuthRepository _signUpRepository;

  Future<void> getLga() async {
    state = const StateLgaState.loading();
    try {
      final data = await _signUpRepository.getLGA("LA");
      data.fold((l) {
        state = StateLgaState.error(l.toString());
      }, (data) {
        state = StateLgaState.data(data);
      });
    } catch (e) {
      state = StateLgaState.error(e.toString());
    }
  }
}
