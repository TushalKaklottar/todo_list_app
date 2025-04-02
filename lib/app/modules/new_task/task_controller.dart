import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskController extends GetxController {
  var taskTitle = ''.obs;
  var selectedCategory = 0.obs;
  var selectedDate = DateTime.now().obs;
  var selectedTime = TimeOfDay.now().obs;
  var notes = ''.obs;
}
