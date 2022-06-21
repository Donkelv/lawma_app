import 'dart:io';
import 'package:path_provider/path_provider.dart' as path;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'data/constant/string_const.dart';
import 'presentation/routes/route_selector.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding?.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Directory directory = await path.getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  SystemChrome.setPreferredOrientations(
      <DeviceOrientation>[DeviceOrientation.portraitUp]);
  await Hive.openBox<String>(StringConst.userIdBox);
  await Hive.openBox<String>(StringConst.userTypeBox);
  runApp(const RouteSelector());
}
