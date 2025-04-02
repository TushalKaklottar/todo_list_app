import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_app/app/core/app_string.dart';
import 'package:todo_list_app/app/core/custom_text.dart';
import 'package:todo_list_app/app/modules/new_task/task_controller.dart';
import 'package:todo_list_app/app/widget/sizedBox.dart';

class TaskAdd extends StatelessWidget {
  final TaskController taskController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: CustomText(
          text: AppString.addNewTask,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(CupertinoIcons.back),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(Get.width * 0.04),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: AppString.taskTitle,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
              CustomSpacing(height: Get.height * 0.01),
              TextField(
                onChanged: (val) => taskController.taskTitle.value = val,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: AppString.taskTitle,
                  hintStyle: AppTextStyles.hintStyle,
                ),
              ),

              CustomSpacing(height: Get.height * 0.03),

              CustomText(
                text: AppString.category,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
              CustomSpacing(height: Get.height * 0.01),
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(6, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: InkWell(
                        onTap: () {
                          taskController.selectedCategory.value = index;
                        },
                        child: Container(
                          width: Get.height * 0.07,
                          height: Get.height * 0.07,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle, // Circle बनाएगा
                            border: Border.all(
                              color: Colors.black,
                              width: 1,
                            ), // Border देगा
                          ),
                          child: Icon(
                            CupertinoIcons.person,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),

              CustomSpacing(height: Get.height * 0.03),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: AppString.date,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                        CustomSpacing(height: Get.height * 0.005),
                        Obx(
                          () => InkWell(
                            onTap: () async {
                              DateTime? picked = await showDatePicker(
                                context: context,
                                initialDate: taskController.selectedDate.value,
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2100),
                              );
                              if (picked != null) {
                                taskController.selectedDate.value = picked;
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.all(15),
                              margin: EdgeInsets.only(right: 10),
                              width: double.infinity,
                              height: Get.height * 0.073,
                              decoration: BoxDecoration(
                                color: Colors.white, // Background color
                                border: Border.all(
                                  color: Colors.blue,
                                  width: 1, // Border की मोटाई
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      "${taskController.selectedDate.value.toLocal()}"
                                          .split(' ')[0],
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    size: Get.height * 0.0295,
                                    Icons.calendar_month_outlined,
                                    color: Colors.blue,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: AppString.time,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                        CustomSpacing(height: Get.height * 0.005),
                        Obx(
                          () => InkWell(
                            onTap: () async {
                              TimeOfDay? picked = await showTimePicker(
                                context: context,
                                initialTime: taskController.selectedTime.value,
                              );
                              if (picked != null) {
                                taskController.selectedTime.value = picked;
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.all(15),
                              margin: EdgeInsets.only(right: 10),
                              width: double.infinity,
                              height: Get.height * 0.073,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.blue,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      taskController.selectedTime.value.format(
                                        context,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    size: Get.height * 0.0295,
                                    Icons.watch_later_outlined,
                                    color: Colors.blue,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              CustomSpacing(height: Get.height * 0.03),
              CustomText(
                text: AppString.note,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
              TextField(
                onChanged: (val) => taskController.notes.value = val,
                maxLines: 3,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: AppString.taskTitle,
                  hintStyle: AppTextStyles.hintStyle,
                ),
              ),
              CustomSpacing(height: Get.height * 0.05),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                  ),
                  onPressed: () {
                    taskController.taskTitle.value;
                  },
                  child: Text("Save"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
