import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nobuzz_app_plus/core/inject.dart';
import 'package:nobuzz_app_plus/presentation/ui/app/app_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);

  Inject.init();

  runApp(const AppWidget());
}
