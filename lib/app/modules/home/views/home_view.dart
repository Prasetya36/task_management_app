import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:task_management_app/app/utils/style/AppColors.dart';
import 'package:task_management_app/app/utils/widget/SideBar.dart';
import 'package:task_management_app/app/utils/widget/header.dart';

import '../../../utils/widget/MyFriends.dart';
import '../../../utils/widget/UpComingTask.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      drawer: const SideBar(),
      backgroundColor: AppColors.primaryBG,
      body: Row(children: [
        !context.isPhone
            ? const Expanded(
                flex: 2,
                child: SideBar(),
              )
            : const SizedBox(),
        Expanded(
          flex: 15,
          child: Column(children: [
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
                                  fontSize: 15, color: AppColors.primaryText),
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
                padding: !context.isPhone
                    ? const EdgeInsets.all(30)
                    : const EdgeInsets.all(10),
                margin: !context.isPhone
                    ? const EdgeInsets.all(15)
                    : const EdgeInsets.all(0),
                decoration: BoxDecoration(
                  borderRadius: !context.isPhone
                      ? BorderRadius.circular(50)
                      : BorderRadius.circular(30),
                  color: Colors.white,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: SizedBox(
                          height: 250,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'My Task',
                                style: TextStyle(
                                  color: AppColors.primaryText,
                                  fontSize: 30,
                                ),
                              ),
                              const SizedBox(height: 10),
                              // My Task
                              SizedBox(
                                height: 200,
                                child: ListView(
                                    clipBehavior: Clip.antiAlias,
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    children: [
                                      Container(
                                        width: 450,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: AppColors.cardBG,
                                        ),
                                        margin: const EdgeInsets.all(10),
                                        padding: const EdgeInsets.all(20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                const ClipRRect(
                                                  child: CircleAvatar(
                                                      backgroundColor:
                                                          Colors.white,
                                                      radius: 20,
                                                      foregroundImage: AssetImage(
                                                          'assets/images/avatar.png')),
                                                ),
                                                const Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 3)),
                                                const ClipRRect(
                                                  child: CircleAvatar(
                                                      backgroundColor:
                                                          Colors.white,
                                                      radius: 20,
                                                      foregroundImage: AssetImage(
                                                          'assets/images/avatar.png')),
                                                ),
                                                const Spacer(),
                                                Container(
                                                  height: 25,
                                                  width: 80,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: AppColors.primaryBG,
                                                  ),
                                                  child: const Center(
                                                      child: Text('100%')),
                                                ),
                                              ],
                                            ),
                                            const Spacer(),
                                            Container(
                                              height: 25,
                                              width: 80,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: AppColors.primaryBG,
                                              ),
                                              child: const Center(
                                                  child: Text('10 / 10 task')),
                                            ),
                                            const Text(
                                              'Pemrogramana Desktop',
                                              style: TextStyle(
                                                  color: AppColors.primaryText,
                                                  fontSize: 20),
                                            ),
                                            const Text(
                                              'Deadline 2 hari lagi',
                                              style: TextStyle(
                                                  color: AppColors.primaryText,
                                                  fontSize: 15),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: 400,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: AppColors.cardBG,
                                        ),
                                        margin: const EdgeInsets.all(10),
                                        padding: const EdgeInsets.all(20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                const ClipRRect(
                                                  child: CircleAvatar(
                                                      backgroundColor:
                                                          Colors.white,
                                                      radius: 20,
                                                      foregroundImage: AssetImage(
                                                          'assets/images/avatar.png')),
                                                ),
                                                const Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 3)),
                                                const ClipRRect(
                                                  child: CircleAvatar(
                                                      backgroundColor:
                                                          Colors.white,
                                                      radius: 20,
                                                      foregroundImage: AssetImage(
                                                          'assets/images/avatar.png')),
                                                ),
                                                const Spacer(),
                                                Container(
                                                  height: 25,
                                                  width: 80,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: AppColors.primaryBG,
                                                  ),
                                                  child: const Center(
                                                      child: Text('100%')),
                                                ),
                                              ],
                                            ),
                                            const Spacer(),
                                            Container(
                                              height: 25,
                                              width: 80,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: AppColors.primaryBG,
                                              ),
                                              child: const Center(
                                                  child: Text('10 / 10 task')),
                                            ),
                                            const Text(
                                              'Pemrogramana Desktop',
                                              style: TextStyle(
                                                  color: AppColors.primaryText,
                                                  fontSize: 20),
                                            ),
                                            const Text(
                                              'Deadline 2 hari lagi',
                                              style: TextStyle(
                                                  color: AppColors.primaryText,
                                                  fontSize: 15),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: 400,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: AppColors.cardBG,
                                        ),
                                        margin: const EdgeInsets.all(10),
                                        padding: const EdgeInsets.all(20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                const ClipRRect(
                                                  child: CircleAvatar(
                                                      backgroundColor:
                                                          Colors.white,
                                                      radius: 20,
                                                      foregroundImage: AssetImage(
                                                          'assets/images/avatar.png')),
                                                ),
                                                const Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 3)),
                                                const ClipRRect(
                                                  child: CircleAvatar(
                                                      backgroundColor:
                                                          Colors.white,
                                                      radius: 20,
                                                      foregroundImage: AssetImage(
                                                          'assets/images/avatar.png')),
                                                ),
                                                const Spacer(),
                                                Container(
                                                  height: 25,
                                                  width: 80,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: AppColors.primaryBG,
                                                  ),
                                                  child: const Center(
                                                      child: Text('100%')),
                                                ),
                                              ],
                                            ),
                                            const Spacer(),
                                            Container(
                                              height: 25,
                                              width: 80,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: AppColors.primaryBG,
                                              ),
                                              child: const Center(
                                                  child: Text('10 / 10 task')),
                                            ),
                                            const Text(
                                              'Pemrogramana Desktop',
                                              style: TextStyle(
                                                  color: AppColors.primaryText,
                                                  fontSize: 20),
                                            ),
                                            const Text(
                                              'Deadline 2 hari lagi',
                                              style: TextStyle(
                                                  color: AppColors.primaryText,
                                                  fontSize: 15),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: 400,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: AppColors.cardBG,
                                        ),
                                        margin: const EdgeInsets.all(10),
                                        padding: const EdgeInsets.all(20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                const ClipRRect(
                                                  child: CircleAvatar(
                                                      backgroundColor:
                                                          Colors.white,
                                                      radius: 20,
                                                      foregroundImage: AssetImage(
                                                          'assets/images/avatar.png')),
                                                ),
                                                const Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 3)),
                                                const ClipRRect(
                                                  child: CircleAvatar(
                                                      backgroundColor:
                                                          Colors.white,
                                                      radius: 20,
                                                      foregroundImage: AssetImage(
                                                          'assets/images/avatar.png')),
                                                ),
                                                const Spacer(),
                                                Container(
                                                  height: 25,
                                                  width: 80,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: AppColors.primaryBG,
                                                  ),
                                                  child: const Center(
                                                      child: Text('100%')),
                                                ),
                                              ],
                                            ),
                                            const Spacer(),
                                            Container(
                                              height: 25,
                                              width: 80,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: AppColors.primaryBG,
                                              ),
                                              child: const Center(
                                                  child: Text('10 / 10 task')),
                                            ),
                                            const Text(
                                              'Pemrogramana Desktop',
                                              style: TextStyle(
                                                  color: AppColors.primaryText,
                                                  fontSize: 20),
                                            ),
                                            const Text(
                                              'Deadline 2 hari lagi',
                                              style: TextStyle(
                                                  color: AppColors.primaryText,
                                                  fontSize: 15),
                                            )
                                          ],
                                        ),
                                      ),
                                    ]),
                              ),
                            ],
                          ),
                        ),
                      ),
                      !context.isPhone
                          ? Padding(
                              padding: const EdgeInsets.only(left: 10, top: 10),
                              child: Row(children: const [
                                upComingTask(),
                                MyFriends(),
                              ]),
                            )
                          : const upComingTask(),
                    ]),
              ),
            ),
          ]),
        ),
      ]),
    );
  }
}
