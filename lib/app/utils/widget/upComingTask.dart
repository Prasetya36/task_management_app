import 'package:flutter/material.dart';
import 'package:task_management_app/app/utils/style/AppColors.dart';

class upComingTask extends StatelessWidget {
  const upComingTask({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text(
          'Up Coming Task',
          style: TextStyle(
            color: AppColors.primaryText,
            fontSize: 25,
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
                  height: 200,
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
                                foregroundImage:
                                    AssetImage('assets/images/avatar.png')),
                          ),
                          const Padding(padding: EdgeInsets.only(right: 3)),
                          const ClipRRect(
                            child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 20,
                                foregroundImage:
                                    AssetImage('assets/images/avatar.png')),
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
                        child: const Center(child: Text('10 / 10 task')),
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
                  height: 150,
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
                                foregroundImage:
                                    AssetImage('assets/images/avatar.png')),
                          ),
                          const Padding(padding: EdgeInsets.only(right: 3)),
                          const ClipRRect(
                            child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 20,
                                foregroundImage:
                                    AssetImage('assets/images/avatar.png')),
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
                        child: const Center(child: Text('10 / 10 task')),
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
      ]),
    );
  }
}
