import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:task_management_app/app/data/controller/auth_controller.dart';
import 'package:task_management_app/app/utils/style/AppColors.dart';
import 'package:task_management_app/app/utils/widget/MyFriends.dart';
import 'package:task_management_app/app/utils/widget/SideBar.dart';
import 'package:task_management_app/app/utils/widget/header.dart';

import '../../../routes/app_pages.dart';
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
                        : const EdgeInsets.only(left: 20, top: 20),
                    child: Obx(() => authC.hasilPencarian.isEmpty
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                const Text(
                                  'People You Know',
                                  style: TextStyle(
                                      fontSize: 23,
                                      color: AppColors.primaryText),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 5, bottom: 10),
                                  child: SizedBox(
                                    height: 180,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      clipBehavior: Clip.antiAlias,
                                      itemCount: 10,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                              top: 20, bottom: 20, right: 20),
                                          child: Stack(children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              child: const Image(
                                                image: AssetImage(
                                                  'assets/images/avatar.png',
                                                ),
                                              ),
                                            ),
                                            const Positioned(
                                                bottom: 5,
                                                left: 30,
                                                child: Text(
                                                  'Jhosua Sitorus',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                )),
                                            Positioned(
                                              bottom: 0,
                                              right: 0,
                                              child: SizedBox(
                                                height: 36,
                                                width: 36,
                                                child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    padding: EdgeInsets.zero,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100),
                                                    ),
                                                  ),
                                                  onPressed: () {},
                                                  child: const Icon(
                                                    Ionicons.add_circle_outline,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ]),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                !context.isPhone
                                    ? const MyFriends()
                                    : Expanded(
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
                                              height: 325,
                                              child: GridView.builder(
                                                shrinkWrap: true,
                                                itemCount: 12,
                                                gridDelegate:
                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount:
                                                      context.isPhone ? 3 : 3,
                                                  mainAxisSpacing: 25,
                                                ),
                                                itemBuilder: (context, index) {
                                                  return Column(
                                                      children: const [
                                                        CircleAvatar(
                                                          maxRadius: 49,
                                                          foregroundImage:
                                                              AssetImage(
                                                                  'assets/images/avatar.png'),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 1.5),
                                                          child: Text(
                                                            'Jhosua Sitorus',
                                                            style: TextStyle(
                                                                color: AppColors
                                                                    .primaryText,
                                                                fontSize: 15),
                                                          ),
                                                        ),
                                                      ]);
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
