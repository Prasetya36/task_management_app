import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management_app/app/utils/style/AppColors.dart';

class upComingTask extends StatelessWidget {
  const upComingTask({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: context.isPhone
            ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                  height: 415,
                  child: ListView(
                      clipBehavior: Clip.antiAlias,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      children: [
                        Container(
                          height: 175,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors.cardBG,
                          ),
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const ClipRRect(
                                    child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 20,
                                        foregroundImage: AssetImage(
                                            'assets/images/avatar.png')),
                                  ),
                                  const Padding(
                                      padding: EdgeInsets.only(right: 3)),
                                  const ClipRRect(
                                    child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 20,
                                        foregroundImage: AssetImage(
                                            'assets/images/avatar.png')),
                                  ),
                                  const Spacer(),
                                  Container(
                                    height: 25,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: AppColors.primaryBG,
                                    ),
                                    child: const Center(child: Text('100%')),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Container(
                                height: 25,
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: AppColors.primaryBG,
                                ),
                                child:
                                    const Center(child: Text('10 / 10 task')),
                              ),
                              const Text(
                                'Pemrogramana Desktop',
                                style: TextStyle(
                                    color: AppColors.primaryText, fontSize: 20),
                              ),
                              const Text(
                                'Deadline 2 hari lagi',
                                style: TextStyle(
                                    color: AppColors.primaryText, fontSize: 15),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 175,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors.cardBG,
                          ),
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const ClipRRect(
                                    child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 20,
                                        foregroundImage: AssetImage(
                                            'assets/images/avatar.png')),
                                  ),
                                  const Padding(
                                      padding: EdgeInsets.only(right: 3)),
                                  const ClipRRect(
                                    child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 20,
                                        foregroundImage: AssetImage(
                                            'assets/images/avatar.png')),
                                  ),
                                  const Spacer(),
                                  Container(
                                    height: 25,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: AppColors.primaryBG,
                                    ),
                                    child: const Center(child: Text('100%')),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Container(
                                height: 25,
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: AppColors.primaryBG,
                                ),
                                child:
                                    const Center(child: Text('10 / 10 task')),
                              ),
                              const Text(
                                'Pemrogramana Desktop',
                                style: TextStyle(
                                    color: AppColors.primaryText, fontSize: 20),
                              ),
                              const Text(
                                'Deadline 2 hari lagi',
                                style: TextStyle(
                                    color: AppColors.primaryText, fontSize: 15),
                              )
                            ],
                          ),
                        ),
                      ]),
                ),
              ])
            : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                  height: 200,
                  child: ListView(
                      clipBehavior: Clip.antiAlias,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      children: [
                        Container(
                          height: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors.cardBG,
                          ),
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const ClipRRect(
                                    child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 20,
                                        foregroundImage: AssetImage(
                                            'assets/images/avatar.png')),
                                  ),
                                  const Padding(
                                      padding: EdgeInsets.only(right: 3)),
                                  const ClipRRect(
                                    child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 20,
                                        foregroundImage: AssetImage(
                                            'assets/images/avatar.png')),
                                  ),
                                  const Spacer(),
                                  Container(
                                    height: 25,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: AppColors.primaryBG,
                                    ),
                                    child: const Center(child: Text('100%')),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Container(
                                height: 25,
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: AppColors.primaryBG,
                                ),
                                child:
                                    const Center(child: Text('10 / 10 task')),
                              ),
                              const Text(
                                'Pemrogramana Desktop',
                                style: TextStyle(
                                    color: AppColors.primaryText, fontSize: 20),
                              ),
                              const Text(
                                'Deadline 2 hari lagi',
                                style: TextStyle(
                                    color: AppColors.primaryText, fontSize: 15),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors.cardBG,
                          ),
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const ClipRRect(
                                    child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 20,
                                        foregroundImage: AssetImage(
                                            'assets/images/avatar.png')),
                                  ),
                                  const Padding(
                                      padding: EdgeInsets.only(right: 3)),
                                  const ClipRRect(
                                    child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 20,
                                        foregroundImage: AssetImage(
                                            'assets/images/avatar.png')),
                                  ),
                                  const Spacer(),
                                  Container(
                                    height: 25,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: AppColors.primaryBG,
                                    ),
                                    child: const Center(child: Text('100%')),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Container(
                                height: 25,
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: AppColors.primaryBG,
                                ),
                                child:
                                    const Center(child: Text('10 / 10 task')),
                              ),
                              const Text(
                                'Pemrogramana Desktop',
                                style: TextStyle(
                                    color: AppColors.primaryText, fontSize: 20),
                              ),
                              const Text(
                                'Deadline 2 hari lagi',
                                style: TextStyle(
                                    color: AppColors.primaryText, fontSize: 15),
                              )
                            ],
                          ),
                        ),
                      ]),
                ),
              ]));
  }
}
