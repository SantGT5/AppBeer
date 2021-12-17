// import 'package:appbeer/pages/intro.dart';
import 'package:appbeer/pages/api_test.dart';
import 'package:appbeer/theme/app_theme.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Material App',
      home: const APITest(),
      theme: appTheme,
    );
  }
}
