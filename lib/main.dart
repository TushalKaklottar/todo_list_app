import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/modules/home/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        appBarTheme: AppBarTheme(backgroundColor: Colors.white),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [GetPage(name: '/', page: () => HomeView())],
    );
  }
}
