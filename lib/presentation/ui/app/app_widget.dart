import 'package:flutter/material.dart';
import 'package:nobuzz_app_plus/presentation/ui/app/pages/home_page.dart';
import 'package:nobuzz_app_plus/presentation/ui/utils/consts_utils.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ConstsUtils.titleApp,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        primaryColor: const Color(0xff352163)
      ),
      home: const HomePage(),
    );
  }
}