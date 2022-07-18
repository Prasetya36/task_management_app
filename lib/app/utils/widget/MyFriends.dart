import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:task_management_app/app/routes/app_pages.dart';
import 'package:task_management_app/app/utils/style/AppColors.dart';

class MyFriends extends StatelessWidget {
  const MyFriends({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(children: [
        Row(children: [
          const Padding(
            padding: EdgeInsets.only(left: 10),
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
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: SizedBox(
            height: 200,
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: 8,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: context.isPhone ? 2 : 3,
                crossAxisSpacing: 20,
                mainAxisSpacing: 30,
              ),
              itemBuilder: (context, index) {
                return Column(children: const [
                  CircleAvatar(
                    maxRadius: 70,
                    foregroundImage: AssetImage('assets/images/avatar.png'),
                  ),
                  Text(
                    'Jhosua Sitorus',
                    style:
                        TextStyle(color: AppColors.primaryText, fontSize: 18),
                  ),
                ]);
              },
            ),
          ),
        )
      ]),
    );
  }
}
