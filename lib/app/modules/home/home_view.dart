import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_app/app/core/colors.dart';
import 'package:get/get.dart';
import 'package:todo_list_app/app/modules/home/home_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());
    return CupertinoPageScaffold(
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                height: Get.height * 0.28,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 20),
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
                      "My Todo List",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),
                    Obx(
                      () => Text(
                        homeController.formattedDate.value,
                        style: TextStyle(
                          fontSize: 16,
                          color: CupertinoColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: Get.height * 0.22,
            left: 0,
            right: 0,
            bottom: 70,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(Get.width * 0.04),
                      decoration: BoxDecoration(
                        color: AppColors.blushOrange,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: CupertinoColors.systemGrey2.withOpacity(0.5),
                            blurRadius: 4,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Do the dishes qwdyuffugfkhkjhkjhgehgewhjhkhejgkhe",
                          ),
                          Text("Do the dishes"),
                          Text("Do the dishes"),
                          Text(
                            "Do the dishes qwdyuffugfkhkjhkjhgehgewhjhkhejgkhe",
                          ),
                          Text("Do the dishes"),
                          Text("Do the dishes"),
                        ],
                      ),
                    ),
                    SizedBox(height: Get.height * 0.03),
                    Text(
                      "Completed",
                      style: TextStyle(
                        fontSize: Get.width * 0.05,
                        fontWeight: FontWeight.bold,
                        color: CupertinoColors.black,
                      ),
                    ),
                    SizedBox(height: Get.height * 0.02),
                    Container(
                      padding: EdgeInsets.all(Get.width * 0.04),
                      decoration: BoxDecoration(
                        color: AppColors.blushOrange,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: CupertinoColors.systemGrey2.withOpacity(0.5),
                            blurRadius: 10,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Column(
                        // bhai tum samjte hyu nahi ho
                        // koi alag widget ya kuch bhi mat banao
                        // sirt ae container ke child 3 item vali custom list code add karo
                        // jo custom honi chahye
                        // list ke item me icon ,tittle , subtittle aur check box add karo aur do item ke bich divider
                      ),
                    ),
                  ],
                ),
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
              onPressed: () {},
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
