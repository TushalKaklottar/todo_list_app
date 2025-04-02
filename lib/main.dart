import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/modules/home/home_view.dart';
import 'app/modules/new_task/task_add.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(brightness: Brightness.light),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => HomeView()),
        GetPage(name: '/addTask', page: () => TaskAdd()),
      ],
    );
  }
}
