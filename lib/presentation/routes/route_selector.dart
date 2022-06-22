import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

import 'package:lawma_app/data/constant/color_const.dart';
import 'package:lawma_app/data/constant/string_const.dart';
import 'package:lawma_app/data/providers/auth_state_provider.dart';
import 'package:lawma_app/data/utils/theme_const.dart';
import 'package:lawma_app/presentation/routes/authenticated_route_path.dart';
import 'package:lawma_app/presentation/routes/non_authenticated_route_path.dart';
import 'package:lawma_app/presentation/routes/route_generator.dart';
import 'package:lawma_app/presentation/screens/loading_screen.dart';

class RouteSelector extends StatelessWidget {
  const RouteSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
      ),
    );
    return ProviderScope(
      child: Consumer(builder: (context, ref, child) {
        return ref.watch(authStateProvider).when(initial: () {
          debugPrint("initial");
          return const LoadingScreen();
        }, authenticated: (authenticated) {
          debugPrint("authenticated");
          return const AuthenticatedRoutePath();
        }, unauthenticated: () {
          debugPrint("unauthenticated");
          return const NonAuthenticatedRoutePath();
        });
      }),
    );
  }
}
