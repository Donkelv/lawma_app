import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'presentation/routes/route_selector.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      <DeviceOrientation>[DeviceOrientation.portraitUp]);
  runApp(const RouteSelector());
}
