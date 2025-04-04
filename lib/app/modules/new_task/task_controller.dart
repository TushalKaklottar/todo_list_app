import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskController extends GetxController {
  var taskTitle = ''.obs;
  var selectedCategory = 0.obs;
  var selectedDate = DateTime.now().obs;
  var selectedTime = TimeOfDay.now().obs;
  var notes = ''.obs;

  final List<IconData> categoryIcons = [
    CupertinoIcons.person,
    CupertinoIcons.book,
    CupertinoIcons.alarm,
    CupertinoIcons.camera,
    CupertinoIcons.chat_bubble,
    CupertinoIcons.heart,
  ];

  final List<Color> categoryColor = [
    Colors.grey,
    Colors.orange,
    Colors.purple,
    Colors.green,
    Colors.blue,
    Colors.red,
  ];

  final List<Color> categoryIconColor = [
    Colors.grey.shade200,
    Colors.orange.shade50,
    Colors.purple.shade50,
    Colors.green.shade50,
    Colors.blue.shade50,
    Colors.red.shade50,
  ];
}
