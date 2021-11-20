import 'package:appbeer/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:appbeer/pages/registrar.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Material App',
      home: Registrar(),
      theme: appTheme,
    );
  }
}
