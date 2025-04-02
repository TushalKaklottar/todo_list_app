import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_app/app/core/app_string.dart';
import 'package:todo_list_app/app/core/colors.dart';
import 'package:get/get.dart';
import 'package:todo_list_app/app/core/custom_text.dart';
import 'package:todo_list_app/app/modules/home/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Map<String, dynamic>> items = [
    {
      "title": "Flutter Developer",
      "subtitle": "Building mobile apps",
      "isChecked": false,
    },
    {
      "title": "Android Developer",
      "subtitle": "Native Android apps",
      "isChecked": false,
    },
    {
      "title": "iOS Developer",
      "subtitle": "Swift & Objective-C",
      "isChecked": false,
    },
    {
      "title": "Web Developer",
      "subtitle": "Full-stack development",
      "isChecked": false,
    },
    {
      "title": "Web Developer",
      "subtitle": "Full-stack development",
      "isChecked": false,
    },
    {
      "title": "Web Developer",
      "subtitle": "Full-stack development",
      "isChecked": false,
    },
  ];
  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: Get.height * 0.35,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.appColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppString.myTodoList,
                      style: AppTextStyles.tittleStyle,
                    ),
                    Obx(
                      () => Text(
                        homeController.formattedDate.value,
                        style: AppTextStyles.subTittleStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: Get.height * 0.215,
            left: 0,
            right: 0,
            bottom: 70,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return ListTileCustom(
                          title: items[index]['title'],
                          subtitle: items[index]['subtitle'],
                          isChecked: items[index]['isChecked'],
                          onChanged: (value) {
                            setState(() {
                              items[index]['isChecked'] = value;
                            });
                          },
                          isFirst: index == 0,
                          isLast: index == items.length - 1,
                        );
                      },
                      separatorBuilder:
                          (context, index) => Divider(
                            color: AppColors.appColor2,
                            thickness: 1,
                            height: 1,
                          ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "Completed",
                          style: TextStyle(
                            fontSize: Get.width * 0.05,
                            fontWeight: FontWeight.bold,
                            color: CupertinoColors.black,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 10,
                          right: 10,
                          bottom: 5,
                        ),
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            return ListTileCustom(
                              title: items[index]['title'],
                              subtitle: items[index]['subtitle'],
                              isChecked: items[index]['isChecked'],
                              onChanged: (value) {
                                setState(() {
                                  items[index]['isChecked'] = value;
                                });
                              },
                              isFirst: index == 0,
                              isLast: index == items.length - 1,
                            );
                          },
                          separatorBuilder:
                              (context, index) => Divider(
                                color: Colors.orange.shade100,
                                thickness: 1,
                                height: 1,
                              ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 20,
            right: 20,
            child: CupertinoButton(
              color: AppColors.appColor,
              borderRadius: BorderRadius.circular(30),
              onPressed: () {
                Get.toNamed('/addTask');
              },
              child: Text(
                "Add New Task",
                style: TextStyle(color: AppColors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ListTileCustom extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isChecked;
  final ValueChanged<bool?> onChanged;
  final bool isFirst;
  final bool isLast;

  const ListTileCustom({
    super.key,
    required this.title,
    required this.subtitle,
    required this.isChecked,
    required this.onChanged,
    required this.isFirst,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 1),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: isFirst ? Radius.circular(22) : Radius.zero,
            topRight: isFirst ? Radius.circular(22) : Radius.zero,
            bottomLeft: isLast ? Radius.circular(22) : Radius.zero,
            bottomRight: isLast ? Radius.circular(22) : Radius.zero,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
              ),
              child: Icon(
                CupertinoIcons.person,
                color: AppColors.white,
                size: 16,
              ),
            ),
            SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),
                ],
              ),
            ),
            Transform.scale(
              scale: 0.85,
              child: Checkbox(
                activeColor: Colors.orange,
                value: isChecked,
                onChanged: onChanged,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
