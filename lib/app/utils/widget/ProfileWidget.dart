import 'package:flutter/material.dart';
import 'package:task_management_app/app/utils/style/AppColors.dart';
import 'package:get/get.dart';

import '../../data/controller/auth_controller.dart';

class ProfileWidget extends StatelessWidget {
  final authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.isPhone
          ? const EdgeInsets.only(top: 50, bottom: 40, left: 60)
          : const EdgeInsets.only(top: 40, bottom: 20, left: 70),
      child: Expanded(
        child: context.isPhone
            ? Column(
                children: [
                  ClipRRect(
                    child: CircleAvatar(
                      maxRadius: 100,
                      backgroundImage:
                          NetworkImage(authC.auth.currentUser!.photoURL!),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          authC.auth.currentUser!.displayName!,
                          style: const TextStyle(
                            color: AppColors.primaryText,
                            fontSize: 30,
                          ),
                        ),
                        Text(
                          authC.auth.currentUser!.email!,
                          style: const TextStyle(
                            color: AppColors.primaryText,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            : Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Row(
                  children: [
                    ClipRRect(
                      child: CircleAvatar(
                        maxRadius: 110,
                        backgroundImage:
                            NetworkImage(authC.auth.currentUser!.photoURL!),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            authC.auth.currentUser!.displayName!,
                            style: const TextStyle(
                              color: AppColors.primaryText,
                              fontSize: 40,
                            ),
                          ),
                          Text(
                            authC.auth.currentUser!.email!,
                            style: const TextStyle(
                              color: AppColors.primaryText,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
