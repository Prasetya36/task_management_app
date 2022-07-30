// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:task_management_app/app/data/controller/auth_controller.dart';
import 'package:task_management_app/app/utils/style/AppColors.dart';
import 'package:task_management_app/app/utils/widget/MyFriends.dart';
import 'package:task_management_app/app/utils/widget/SideBar.dart';
import 'package:task_management_app/app/utils/widget/header.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/widget/peopleYouMayKnow.dart';
import '../controllers/friends_controller.dart';

class FriendsView extends GetView<FriendsController> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  final authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      child: Column(
                        children: [
                          Row(
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
                                  ]),
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
                          const SizedBox(height: 10),
                          context.isPhone
                              ? TextField(
                                  onChanged: (value) =>
                                      authC.searchFriends(value),
                                  controller: authC.searcFriendsController,
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      contentPadding: const EdgeInsets.only(
                                          left: 40, right: 10),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                            color: Colors.white),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                            color: Colors.blue),
                                      ),
                                      prefixIcon: const Icon(
                                        Icons.search,
                                        color: Colors.black,
                                      ),
                                      hintText: "Search... "),
                                )
                              : const SizedBox(),
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
                  child: Padding(
                    padding: !context.isPhone
                        ? const EdgeInsets.only(left: 20)
                        : const EdgeInsets.only(top: 20),
                    child: Obx(() => authC.hasilPencarian.isEmpty
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: const Text(
                                    'People You May Know',
                                    style: TextStyle(
                                        fontSize: 23,
                                        color: AppColors.primaryText),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 5, bottom: 10, left: 20, right: 20),
                                  child: PeopleYouMayKnow(),
                                ),
                                !context.isPhone
                                    ? MyFriends()
                                    : Expanded(
                                        child: Column(children: [
                                          Row(children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20),
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
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10),
                                              child: const Icon(
                                                Ionicons.chevron_forward,
                                                color: AppColors.primaryText,
                                              ),
                                            )
                                          ]),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 20),
                                            child: SizedBox(
                                              height: 320,
                                              child: StreamBuilder<
                                                  DocumentSnapshot<
                                                      Map<String, dynamic>>>(
                                                stream: authC.streamFriends(),
                                                builder: (context, snapshot) {
                                                  if (snapshot
                                                          .connectionState ==
                                                      ConnectionState.waiting) {
                                                    return const Center(
                                                        child:
                                                            CircularProgressIndicator());
                                                  }

                                                  var myFriends =
                                                      (snapshot.data!.data()
                                                                  as Map<String,
                                                                      dynamic>)[
                                                              'emailFriends']
                                                          as List;

                                                  return GridView.builder(
                                                      shrinkWrap: true,
                                                      itemCount:
                                                          myFriends.length,
                                                      gridDelegate:
                                                          SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount:
                                                            context.isPhone
                                                                ? 2
                                                                : 5,
                                                        mainAxisSpacing: 20,
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
                                                              return Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left: 5,
                                                                        right:
                                                                            5),
                                                                child: Column(
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
                                                                              Get.width * 0.35,
                                                                          width:
                                                                              Get.width * 0.35,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding:
                                                                            const EdgeInsets.only(top: 10),
                                                                        child:
                                                                            Text(
                                                                          data[
                                                                              'name'],
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                AppColors.primaryText,
                                                                            fontSize:
                                                                                15,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ]),
                                                              );
                                                            });
                                                      });
                                                },
                                              ),
                                            ),
                                          )
                                        ]),
                                      ),
                              ])
                        : ListView.builder(
                            padding: const EdgeInsets.all(8),
                            shrinkWrap: true,
                            itemCount: authC.hasilPencarian.length,
                            itemBuilder: (context, index) => ListTile(
                              onTap: () => authC.addFriends(
                                  authC.hasilPencarian[index]['email']),
                              leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image(
                                    image: NetworkImage(
                                        authC.hasilPencarian[index]['photo']),
                                  )),
                              title: Text(authC.hasilPencarian[index]['name']),
                              subtitle:
                                  Text(authC.hasilPencarian[index]['email']),
                              trailing: const Icon(Ionicons.add),
                            ),
                          )),
                  ),
                ),
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}
