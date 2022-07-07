import 'package:flutter/cupertino.dart';
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
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Column(children: [
          Row(children: [
            const Text(
              'My Friends',
              style: TextStyle(
                color: AppColors.primaryText,
                fontSize: 23,
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
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: 8,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, crossAxisSpacing: 5, mainAxisSpacing: 5),
                itemBuilder: (context, index) {
                  return Column(children: const [
                    ClipRRect(
                      child: Image(
                        height: 150,
                        image: AssetImage(
                          'assets/images/avatar.png',
                        ),
                      ),
                    ),
                    Text(
                      'Joshua Sitorus',
                      style: TextStyle(color: AppColors.primaryText),
                    )
                  ]);
                },
              ),
            ),
          )
        ]),
      ),
    );
  }
}
