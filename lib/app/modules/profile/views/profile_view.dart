import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:task_management_app/app/routes/app_pages.dart';
import 'package:task_management_app/app/utils/style/AppColors.dart';
import 'package:task_management_app/app/utils/widget/MyTask.dart';
import 'package:task_management_app/app/utils/widget/ProfileWidget.dart';
import 'package:task_management_app/app/utils/widget/SideBar.dart';
import 'package:task_management_app/app/utils/widget/header.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      drawer: const SideBar(),
      backgroundColor: AppColors.primaryBG,
      body: Row(
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
                                      fontSize: 15,
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
                                    onPressed: () => Get.toNamed(Routes.LOGIN),
                                    child: const Text("Sign Out"),
                                  ),
                                );
                              },
                              child: Row(
                                children: const [
                                  Text(
                                    "Sign Out",
                                    style:
                                        TextStyle(color: AppColors.primaryText),
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
                            left: 100, right: 100, bottom: 30, top: 10)
                        : const EdgeInsets.all(20),
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
                      children: const [
                        ProfileWidget(),
                        Padding(
                          padding: EdgeInsets.only(left: 10, top: 20),
                          child: Text(
                            'My Task',
                            style: TextStyle(
                              color: AppColors.primaryText,
                              fontSize: 23,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 180,
                          child: MyTask(),
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
    );
  }
}
