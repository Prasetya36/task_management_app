import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:task_management_app/app/data/controller/auth_controller.dart';
import 'package:task_management_app/app/utils/style/AppColors.dart';
import 'package:task_management_app/app/utils/widget/ProfileWidget.dart';
import 'package:task_management_app/app/utils/widget/SideBar.dart';
import 'package:task_management_app/app/utils/widget/header.dart';
import 'package:task_management_app/app/utils/widget/peopleYouMayKnow.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  final authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      drawer: const SizedBox(width: 170, child: SideBar()),
      backgroundColor: AppColors.primaryBG,
      body: SafeArea(
        child: Row(
          children: [
            !context.isPhone
                ? const Expanded(
                    flex: 2,
                    child: SideBar(),
                  )
                : const SizedBox(),
            Expanded(
              flex: 15,
              child: Column(
                children: [
                  !context.isPhone
                      ? const header()
                      : Container(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  _drawerKey.currentState!.openDrawer();
                                },
                                icon: const Icon(
                                  Icons.menu,
                                  color: AppColors.primaryText,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Task Management",
                                    style: TextStyle(fontSize: 21),
                                  ),
                                  Text(
                                    "Manage Task Easy With Friend",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: AppColors.primaryText),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  Get.defaultDialog(
                                    title: "Sign Out",
                                    content: const Text(
                                        "Are You Sure Want to Sign Out?"),
                                    cancel: ElevatedButton(
                                      onPressed: () => Get.back(),
                                      child: const Text("Cancel"),
                                    ),
                                    confirm: ElevatedButton(
                                      onPressed: () => authC.logout(),
                                      child: const Text("Sign Out"),
                                    ),
                                  );
                                },
                                child: Row(
                                  children: const [
                                    Text(
                                      "Sign Out",
                                      style: TextStyle(
                                          color: AppColors.primaryText),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                  ],
                                ),
                              ),
                              const Icon(
                                Ionicons.log_out_outline,
                                color: AppColors.primaryText,
                                size: 30,
                              ),
                            ],
                          ),
                        ),
                  //content / isi page / screen
                  Expanded(
                    child: Container(
                      padding: !context.isPhone
                          ? const EdgeInsets.only(
                              left: 10, right: 100, bottom: 30)
                          : const EdgeInsets.only(
                              left: 20, right: 20, bottom: 30),
                      margin: !context.isPhone
                          ? const EdgeInsets.all(15)
                          : const EdgeInsets.all(0),
                      decoration: BoxDecoration(
                          borderRadius: !context.isPhone
                              ? BorderRadius.circular(50)
                              : BorderRadius.circular(30),
                          color: Colors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ProfileWidget(),
                          Padding(
                            padding: !context.isPhone
                                ? const EdgeInsets.only(left: 70)
                                : const EdgeInsets.only(
                                    left: 15, top: 50, bottom: 20),
                            child: const Text(
                              'People You May Know',
                              style: TextStyle(
                                color: AppColors.primaryText,
                                fontSize: 23,
                              ),
                            ),
                          ),
                          Padding(
                            padding: !context.isPhone
                                ? const EdgeInsets.only(left: 70)
                                : const EdgeInsets.only(left: 10),
                            child: SizedBox(
                              height: 180,
                              child: SizedBox(
                                child: PeopleYouMayKnow(),
                                width: Get.width,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
