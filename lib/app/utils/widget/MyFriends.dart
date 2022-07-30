import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:task_management_app/app/routes/app_pages.dart';
import 'package:task_management_app/app/utils/style/AppColors.dart';

import '../../data/controller/auth_controller.dart';

class MyFriends extends StatelessWidget {
  final authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(children: [
        Row(children: [
          const Padding(
            padding: EdgeInsets.only(left: 10, top: 10),
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
            onTap: () => Get.toNamed(Routes.FRIENDS),
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
        SizedBox(
          height: 200,
          child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
              stream: authC.streamFriends(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                var myFriends = (snapshot.data!.data()
                    as Map<String, dynamic>)['emailFriends'] as List;

                return GridView.builder(
                  shrinkWrap: true,
                  itemCount: myFriends.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: context.isPhone ? 2 : 5,
                    crossAxisSpacing: 1,
                    mainAxisSpacing: 30,
                  ),
                  itemBuilder: (context, index) {
                    return StreamBuilder<
                            DocumentSnapshot<Map<String, dynamic>>>(
                        stream: authC.streamUsers(myFriends[index]),
                        builder: (context, snapshot2) {
                          if (snapshot2.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }

                          var data = snapshot2.data!.data();

                          return Column(children: [
                            CircleAvatar(
                              maxRadius: 80,
                              foregroundImage: NetworkImage(data!['photo']),
                            ),
                            Text(
                              data['name'],
                              style: const TextStyle(
                                  color: AppColors.primaryText, fontSize: 18),
                            ),
                          ]);
                        });
                  },
                );
              }),
        )
      ]),
    );
  }
}
