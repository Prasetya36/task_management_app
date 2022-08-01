import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:task_management_app/app/utils/style/AppColors.dart';
import 'package:task_management_app/app/utils/widget/MyTask.dart';
import 'package:task_management_app/app/utils/widget/SideBar.dart';
import 'package:task_management_app/app/utils/widget/header.dart';
import 'package:task_management_app/app/utils/widget/peopleYouMayKnow.dart';

import '../../../data/controller/auth_controller.dart';
import '../../../routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  final authC = Get.find<AuthController>();

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
                          ClipRRect(
                            child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 25,
                                foregroundImage: NetworkImage(
                                    authC.auth.currentUser!.photoURL!)),
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
                            height: !context.isPhone ? 215 : 210,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                    'People You May Know',
                                    style: TextStyle(
                                      color: AppColors.primaryText,
                                      fontSize: 23,
                                    ),
                                  ),
                                ),
                                // People You May Know
                                PeopleYouMayKnow(),
                              ],
                            ),
                          ),
                        ),
                        !context.isPhone
                            ? Expanded(
                                child: Row(
                                  children: [
                                    MyTask(),
                                    Expanded(
                                      child: Column(children: [
                                        Row(children: [
                                          const Padding(
                                            padding: EdgeInsets.only(
                                                left: 10, top: 10),
                                            child: Text(
                                              'My Friends',
                                              style: TextStyle(
                                                color: AppColors.primaryText,
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
                                                color: AppColors.primaryText,
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
                                          padding:
                                              const EdgeInsets.only(top: 20),
                                          child: SizedBox(
                                            height: 200,
                                            child:
                                                StreamBuilder<
                                                        DocumentSnapshot<
                                                            Map<String,
                                                                dynamic>>>(
                                                    stream:
                                                        authC.streamFriends(),
                                                    builder:
                                                        (context, snapshot) {
                                                      if (snapshot
                                                              .connectionState ==
                                                          ConnectionState
                                                              .waiting) {
                                                        return const Center(
                                                            child:
                                                                CircularProgressIndicator());
                                                      }

                                                      var myFriends = (snapshot
                                                                      .data!
                                                                      .data()
                                                                  as Map<String,
                                                                      dynamic>)[
                                                              'emailFriends']
                                                          as List;

                                                      return GridView.builder(
                                                        addSemanticIndexes:
                                                            true,
                                                        shrinkWrap: true,
                                                        itemCount:
                                                            myFriends.length,
                                                        gridDelegate:
                                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                          crossAxisCount:
                                                              context.isPhone
                                                                  ? 2
                                                                  : 4,
                                                          crossAxisSpacing: 1,
                                                          mainAxisSpacing: 10,
                                                        ),
                                                        itemBuilder:
                                                            (context, index) {
                                                          return StreamBuilder<
                                                                  DocumentSnapshot<
                                                                      Map<String,
                                                                          dynamic>>>(
                                                              stream: authC
                                                                  .streamUsers(
                                                                      myFriends[
                                                                          index]),
                                                              builder: (context,
                                                                  snapshot2) {
                                                                if (snapshot2
                                                                        .connectionState ==
                                                                    ConnectionState
                                                                        .waiting) {
                                                                  return const Center(
                                                                      child:
                                                                          CircularProgressIndicator());
                                                                }

                                                                var data =
                                                                    snapshot2
                                                                        .data!
                                                                        .data();

                                                                return Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(20),
                                                                        child:
                                                                            Image(
                                                                          image:
                                                                              NetworkImage(data!['photo']),
                                                                          height:
                                                                              80,
                                                                          width:
                                                                              80,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding:
                                                                            const EdgeInsets.only(top: 10),
                                                                        child:
                                                                            Text(
                                                                          (data[
                                                                              'name']),
                                                                          style: const TextStyle(
                                                                              color: AppColors.primaryText,
                                                                              fontSize: 15),
                                                                        ),
                                                                      ),
                                                                    ]);
                                                              });
                                                        },
                                                      );
                                                    }),
                                          ),
                                        )
                                      ]),
                                    )
                                  ],
                                ),
                              )
                            : Expanded(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                    MyTask(),
                                  ])),
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
