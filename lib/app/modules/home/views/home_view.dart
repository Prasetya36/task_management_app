import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:task_management_app/app/utils/style/AppColors.dart';
import 'package:task_management_app/app/utils/widget/SideBar.dart';
import 'package:task_management_app/app/utils/widget/header.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/widget/MyFriends.dart';
import '../../../utils/widget/MyTask.dart';
import '../../../utils/widget/UpComingTask.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _drawerKey,
      drawer: const SizedBox(width: 170, child: SideBar()),
      backgroundColor: AppColors.primaryBG,
      body: SafeArea(
        child: Row(children: [
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
                                "Manage Task Easy With Friends",
                                style: TextStyle(
                                    fontSize: 14, color: AppColors.primaryText),
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
                          padding: !context.isPhone
                              ? const EdgeInsets.only(left: 20)
                              : const EdgeInsets.only(left: 10, top: 20),
                          child: SizedBox(
                            height: !context.isPhone ? 245 : 250,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                    'My Task',
                                    style: TextStyle(
                                      color: AppColors.primaryText,
                                      fontSize: 23,
                                    ),
                                  ),
                                ),
                                // My Task
                                MyTask(),
                              ],
                            ),
                          ),
                        ),
                        !context.isPhone
                            ? Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Row(children: [
                                  upComingTask(),
                                  !context.isPhone
                                      ? Expanded(
                                          child: Column(children: [
                                            Row(children: [
                                              const Padding(
                                                padding: EdgeInsets.only(
                                                    left: 10, top: 10),
                                                child: Text(
                                                  'My Friends',
                                                  style: TextStyle(
                                                    color:
                                                        AppColors.primaryText,
                                                    fontSize: 23,
                                                  ),
                                                ),
                                              ),
                                              const Spacer(),
                                              GestureDetector(
                                                onTap: () =>
                                                    Get.toNamed(Routes.FRIENDS),
                                                child: const Text(
                                                  'more',
                                                  style: TextStyle(
                                                    color:
                                                        AppColors.primaryText,
                                                    fontSize: 20,
                                                  ),
                                                ),
                                              ),
                                              const Icon(
                                                Ionicons.chevron_forward,
                                                color: AppColors.primaryText,
                                              )
                                            ]),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 20),
                                              child: SizedBox(
                                                height: 200,
                                                child: GridView.builder(
                                                  shrinkWrap: true,
                                                  itemCount: 10,
                                                  gridDelegate:
                                                      SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount:
                                                        context.isPhone ? 2 : 3,
                                                    crossAxisSpacing: 1,
                                                    mainAxisSpacing: 30,
                                                  ),
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Column(
                                                        children: const [
                                                          CircleAvatar(
                                                            maxRadius: 75,
                                                            foregroundImage:
                                                                AssetImage(
                                                                    'assets/images/avatar.png'),
                                                          ),
                                                          Text(
                                                            'Jhosua Sitorus',
                                                            style: TextStyle(
                                                                color: AppColors
                                                                    .primaryText,
                                                                fontSize: 18),
                                                          ),
                                                        ]);
                                                  },
                                                ),
                                              ),
                                            )
                                          ]),
                                        )
                                      : MyFriends(),
                                ]),
                              )
                            : Expanded(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(left: 20),
                                        child: Text(
                                          'Up Coming Task',
                                          style: TextStyle(
                                            color: AppColors.primaryText,
                                            fontSize: 23,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      SizedBox(
                                        height: 350,
                                        child: ListView(
                                            clipBehavior: Clip.antiAlias,
                                            scrollDirection: Axis.vertical,
                                            shrinkWrap: true,
                                            children: [
                                              Container(
                                                height: 150,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: AppColors.cardBG,
                                                ),
                                                margin:
                                                    const EdgeInsets.all(10),
                                                padding:
                                                    const EdgeInsets.all(20),
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
                                                              foregroundImage:
                                                                  AssetImage(
                                                                      'assets/images/avatar.png')),
                                                        ),
                                                        const Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    right: 3)),
                                                        const ClipRRect(
                                                          child: CircleAvatar(
                                                              backgroundColor:
                                                                  Colors.white,
                                                              radius: 20,
                                                              foregroundImage:
                                                                  AssetImage(
                                                                      'assets/images/avatar.png')),
                                                        ),
                                                        const Spacer(),
                                                        Container(
                                                          height: 25,
                                                          width: 80,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                            color: AppColors
                                                                .primaryBG,
                                                          ),
                                                          child: const Center(
                                                              child:
                                                                  Text('100%')),
                                                        ),
                                                      ],
                                                    ),
                                                    const Spacer(),
                                                    Container(
                                                      height: 25,
                                                      width: 80,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        color:
                                                            AppColors.primaryBG,
                                                      ),
                                                      child: const Center(
                                                          child: Text(
                                                              '10 / 10 task')),
                                                    ),
                                                    const Text(
                                                      'Pemrogramana Desktop',
                                                      style: TextStyle(
                                                          color: AppColors
                                                              .primaryText,
                                                          fontSize: 20),
                                                    ),
                                                    const Text(
                                                      'Deadline 2 hari lagi',
                                                      style: TextStyle(
                                                          color: AppColors
                                                              .primaryText,
                                                          fontSize: 15),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                height: 150,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: AppColors.cardBG,
                                                ),
                                                margin:
                                                    const EdgeInsets.all(10),
                                                padding:
                                                    const EdgeInsets.all(20),
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
                                                              foregroundImage:
                                                                  AssetImage(
                                                                      'assets/images/avatar.png')),
                                                        ),
                                                        const Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    right: 3)),
                                                        const ClipRRect(
                                                          child: CircleAvatar(
                                                              backgroundColor:
                                                                  Colors.white,
                                                              radius: 20,
                                                              foregroundImage:
                                                                  AssetImage(
                                                                      'assets/images/avatar.png')),
                                                        ),
                                                        const Spacer(),
                                                        Container(
                                                          height: 25,
                                                          width: 80,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                            color: AppColors
                                                                .primaryBG,
                                                          ),
                                                          child: const Center(
                                                              child:
                                                                  Text('100%')),
                                                        ),
                                                      ],
                                                    ),
                                                    const Spacer(),
                                                    Container(
                                                      height: 25,
                                                      width: 80,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        color:
                                                            AppColors.primaryBG,
                                                      ),
                                                      child: const Center(
                                                          child: Text(
                                                              '10 / 10 task')),
                                                    ),
                                                    const Text(
                                                      'Pemrogramana Desktop',
                                                      style: TextStyle(
                                                          color: AppColors
                                                              .primaryText,
                                                          fontSize: 20),
                                                    ),
                                                    const Text(
                                                      'Deadline 2 hari lagi',
                                                      style: TextStyle(
                                                          color: AppColors
                                                              .primaryText,
                                                          fontSize: 15),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                height: 150,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: AppColors.cardBG,
                                                ),
                                                margin:
                                                    const EdgeInsets.all(10),
                                                padding:
                                                    const EdgeInsets.all(20),
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
                                                              foregroundImage:
                                                                  AssetImage(
                                                                      'assets/images/avatar.png')),
                                                        ),
                                                        const Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    right: 3)),
                                                        const ClipRRect(
                                                          child: CircleAvatar(
                                                              backgroundColor:
                                                                  Colors.white,
                                                              radius: 20,
                                                              foregroundImage:
                                                                  AssetImage(
                                                                      'assets/images/avatar.png')),
                                                        ),
                                                        const Spacer(),
                                                        Container(
                                                          height: 25,
                                                          width: 80,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                            color: AppColors
                                                                .primaryBG,
                                                          ),
                                                          child: const Center(
                                                              child:
                                                                  Text('100%')),
                                                        ),
                                                      ],
                                                    ),
                                                    const Spacer(),
                                                    Container(
                                                      height: 25,
                                                      width: 80,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        color:
                                                            AppColors.primaryBG,
                                                      ),
                                                      child: const Center(
                                                          child: Text(
                                                              '10 / 10 task')),
                                                    ),
                                                    const Text(
                                                      'Pemrogramana Desktop',
                                                      style: TextStyle(
                                                          color: AppColors
                                                              .primaryText,
                                                          fontSize: 20),
                                                    ),
                                                    const Text(
                                                      'Deadline 2 hari lagi',
                                                      style: TextStyle(
                                                          color: AppColors
                                                              .primaryText,
                                                          fontSize: 15),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ]),
                                      ),
                                    ]),
                              ),
                      ]),
                ),
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}
