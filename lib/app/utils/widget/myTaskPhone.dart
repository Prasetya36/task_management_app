import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:task_management_app/app/utils/style/AppColors.dart';
import 'package:task_management_app/app/utils/widget/prosesTask.dart';

import '../../data/controller/auth_controller.dart';

class MyTaskPhone extends StatelessWidget {
  final authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      //stream user for get task list
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'My Task',
              style: TextStyle(
                color: AppColors.primaryText,
                fontSize: 23,
              ),
            ),
          ),
          StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
              stream: authC.streamUsers(authC.auth.currentUser!.email!),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                //get task id
                var taskId = (snapshot.data!.data()
                    as Map<String, dynamic>)['task_id'] as List;
                return SizedBox(
                  height: context.isPhone ? 655 : 479,
                  child: ListView.builder(
                    itemCount: taskId.length,
                    clipBehavior: Clip.antiAlias,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return StreamBuilder<
                              DocumentSnapshot<Map<String, dynamic>>>(
                          stream: authC.streamTask(taskId[index]),
                          builder: (context, snapshot2) {
                            if (snapshot2.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }

                            //data task
                            var dataTask = snapshot2.data!.data();
                            //data user photo
                            var dataUserList = (snapshot2.data!.data()
                                as Map<String, dynamic>)['asign_to'] as List;
                            return GestureDetector(
                              onLongPress: () {
                                Get.defaultDialog(
                                    title: dataTask!['tittle'],
                                    titlePadding: const EdgeInsets.only(
                                        top: 20, bottom: 15),
                                    content: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        TextButton.icon(
                                            onPressed: () {
                                              Get.back();
                                              authC.tittleController.text =
                                                  dataTask['tittle'];
                                              authC.descriptionsController
                                                      .text =
                                                  dataTask['description'];
                                              authC.dueDateController.text =
                                                  dataTask['dueDate'];
                                              addEditTask(
                                                  context: context,
                                                  type: 'Updated',
                                                  docId: taskId[index]);
                                            },
                                            icon: const Icon(Ionicons.pencil),
                                            label: const Text('Update')),
                                        TextButton.icon(
                                            onPressed: () {
                                              authC.deleteTask(taskId[index]);
                                            },
                                            icon: const Icon(Ionicons.trash),
                                            label: const Text('Delete'))
                                      ],
                                    ));
                              },
                              child: Container(
                                height: 195,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: AppColors.cardBG,
                                ),
                                margin: const EdgeInsets.all(10),
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            height: 50,
                                            child: Expanded(
                                              child: ListView.builder(
                                                padding: EdgeInsets.zero,
                                                itemCount: dataUserList.length,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                shrinkWrap: true,
                                                physics: const ScrollPhysics(),
                                                itemBuilder: (context, index2) {
                                                  return StreamBuilder<
                                                          DocumentSnapshot<
                                                              Map<String,
                                                                  dynamic>>>(
                                                      stream: authC.streamUsers(
                                                          dataUserList[index2]),
                                                      builder:
                                                          (context, snapshot3) {
                                                        if (snapshot3
                                                                .connectionState ==
                                                            ConnectionState
                                                                .waiting) {
                                                          return const Center(
                                                              child:
                                                                  CircularProgressIndicator());
                                                        }

                                                        //data user foto
                                                        var dataUserImage =
                                                            snapshot3.data!
                                                                .data();
                                                        return ClipRRect(
                                                          child: CircleAvatar(
                                                              backgroundColor:
                                                                  Colors.white,
                                                              radius: 25,
                                                              foregroundImage:
                                                                  NetworkImage(
                                                                      dataUserImage![
                                                                          'photo'])),
                                                        );
                                                      });
                                                },
                                              ),
                                            ),
                                          ),
                                          const Padding(
                                              padding:
                                                  EdgeInsets.only(right: 3)),
                                          const Spacer(),
                                          Container(
                                            height: 25,
                                            width: 80,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: AppColors.primaryBG,
                                            ),
                                            child: Center(
                                                child: Text(
                                                    '${dataTask!['status']} %')),
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      const SizedBox(height: 20),
                                      Container(
                                        height: 25,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: AppColors.primaryBG,
                                        ),
                                        child: Text(
                                            '${dataTask['total_task_finished']} / ${dataTask['total_task']} Task'),
                                      ),
                                      Text(
                                        dataTask['tittle'],
                                        style: const TextStyle(
                                            color: AppColors.primaryText,
                                            fontSize: 20),
                                      ),
                                      Text(
                                        dataTask['description'],
                                        style: const TextStyle(
                                            color: AppColors.primaryText,
                                            fontSize: 15),
                                      ),
                                    ]),
                              ),
                            );
                          });
                    },
                  ),
                );
              }),
        ],
      ),
    );
  }
}
