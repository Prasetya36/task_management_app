import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:task_management_app/app/utils/style/AppColors.dart';
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
                            const Icon(Ionicons.notifications, size: 25),
                            const SizedBox(width: 15),
                            const ClipRRect(
                              child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 25,
                                  foregroundImage:
                                      AssetImage('assets/images/avatar.png')),
                            )
                          ],
                        ),
                      ),
                //content / isi page / screen
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(50),
                    margin: !context.isPhone
                        ? const EdgeInsets.all(15)
                        : const EdgeInsets.all(0),
                    decoration: BoxDecoration(
                        borderRadius: !context.isPhone
                            ? BorderRadius.circular(50)
                            : BorderRadius.circular(30),
                        color: Colors.white),
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
