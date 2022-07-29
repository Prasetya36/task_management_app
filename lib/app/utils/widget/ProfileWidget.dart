import 'package:flutter/material.dart';
import 'package:task_management_app/app/utils/style/AppColors.dart';
import 'package:get/get.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, bottom: 20, left: 70),
      child: Expanded(
        child: !context.isPhone
            ? Row(
                children: [
                  const ClipRRect(
                    child: CircleAvatar(
                      maxRadius: 130,
                      backgroundImage: AssetImage('assets/images/avatar.png'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Jhosua Sitorus',
                          style: TextStyle(
                            color: AppColors.primaryText,
                            fontSize: 40,
                          ),
                        ),
                        Text(
                          'Sitorus@gmail.com',
                          style: TextStyle(
                            color: AppColors.primaryText,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : Column(
                children: [
                  const ClipRRect(
                    child: CircleAvatar(
                      maxRadius: 100,
                      backgroundImage: AssetImage('assets/images/avatar.png'),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 70, right: 70, bottom: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Jhosua Sitorus',
                          style: TextStyle(
                            color: AppColors.primaryText,
                            fontSize: 30,
                          ),
                        ),
                        Text(
                          'Sitorus@gmail.com',
                          style: TextStyle(
                            color: AppColors.primaryText,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
