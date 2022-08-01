import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:task_management_app/app/utils/style/AppColors.dart';
import 'package:task_management_app/app/utils/widget/SideBar.dart';
import 'package:task_management_app/app/utils/widget/header.dart';

import '../../../data/controller/auth_controller.dart';
import '../controllers/task_controller.dart';

class TaskView extends GetView<TaskController> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  final authC = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      drawer: const SizedBox(width: 170, child: SideBar()),
      backgroundColor: AppColors.primaryBG,
      body: SafeArea(
        child: Row(
          children: [
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
                        child: Row(
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
                              ],
                            ),
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
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: !context.isPhone
                                ? const EdgeInsets.only(left: 20)
                                : const EdgeInsets.only(left: 20, top: 20),
                            child: const Text(
                              'My Task',
                              style: TextStyle(
                                color: AppColors.primaryText,
                                fontSize: 23,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Expanded(
                            //stream user for get task list
                            child: StreamBuilder<
                                    DocumentSnapshot<Map<String, dynamic>>>(
                                stream: authC.streamUsers(
                                    authC.auth.currentUser!.email!),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  }
                                  //get task id
                                  var taskId = (snapshot.data!.data()
                                          as Map<String, dynamic>)['task_id']
                                      as List;
                                  return ListView.builder(
                                    itemCount: taskId.length,
                                    clipBehavior: Clip.antiAlias,
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return StreamBuilder<
                                              DocumentSnapshot<
                                                  Map<String, dynamic>>>(
                                          stream:
                                              authC.streamTask(taskId[index]),
                                          builder: (context, snapshot2) {
                                            if (snapshot2.connectionState ==
                                                ConnectionState.waiting) {
                                              return const Center(
                                                  child:
                                                      CircularProgressIndicator());
                                            }

                                            //data task
                                            var dataTask =
                                                snapshot2.data!.data();
                                            //data user photo
                                            var dataUserList =
                                                (snapshot2.data!.data() as Map<
                                                        String,
                                                        dynamic>)['asign_to']
                                                    as List;
                                            return GestureDetector(
                                              onLongPress: () {
                                                Get.defaultDialog(
                                                    title: dataTask!['tittle'],
                                                    titlePadding:
                                                        const EdgeInsets.only(
                                                            top: 20,
                                                            bottom: 15),
                                                    content: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        TextButton.icon(
                                                            onPressed: () {
                                                              Get.back();
                                                              controller
                                                                      .tittleController
                                                                      .text =
                                                                  dataTask[
                                                                      'tittle'];
                                                              controller
                                                                      .descriptionsController
                                                                      .text =
                                                                  dataTask[
                                                                      'description'];
                                                              controller
                                                                      .dueDateController
                                                                      .text =
                                                                  dataTask[
                                                                      'dueDate'];
                                                              addEditTask(
                                                                  context:
                                                                      context,
                                                                  type:
                                                                      'Updated',
                                                                  docId: taskId[
                                                                      index]);
                                                            },
                                                            icon: const Icon(
                                                                Ionicons
                                                                    .pencil),
                                                            label: const Text(
                                                                'Update')),
                                                        TextButton.icon(
                                                            onPressed: () {
                                                              controller
                                                                  .deleteTask(
                                                                      taskId[
                                                                          index]);
                                                            },
                                                            icon: const Icon(
                                                                Ionicons.trash),
                                                            label: const Text(
                                                                'Delete'))
                                                      ],
                                                    ));
                                                // addEditTask(
                                                //     context: context,
                                                //     type: 'Update',
                                                //     docId:
                                                //         '2022-08-01T11:49:53.686660');
                                              },
                                              child: Container(
                                                height: 180,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: AppColors.cardBG,
                                                ),
                                                margin:
                                                    const EdgeInsets.all(10),
                                                padding:
                                                    const EdgeInsets.all(20),
                                                child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          SizedBox(
                                                            height: 50,
                                                            child: Expanded(
                                                              child: ListView
                                                                  .builder(
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                itemCount:
                                                                    dataUserList
                                                                        .length,
                                                                scrollDirection:
                                                                    Axis.horizontal,
                                                                shrinkWrap:
                                                                    true,
                                                                physics:
                                                                    const ScrollPhysics(),
                                                                itemBuilder:
                                                                    (context,
                                                                        index2) {
                                                                  return StreamBuilder<
                                                                          DocumentSnapshot<
                                                                              Map<String,
                                                                                  dynamic>>>(
                                                                      stream: authC.streamUsers(
                                                                          dataUserList[
                                                                              index2]),
                                                                      builder:
                                                                          (context,
                                                                              snapshot3) {
                                                                        if (snapshot3.connectionState ==
                                                                            ConnectionState.waiting) {
                                                                          return const Center(
                                                                              child: CircularProgressIndicator());
                                                                        }

                                                                        //data user foto
                                                                        var dataUserImage = snapshot3
                                                                            .data!
                                                                            .data();
                                                                        return ClipRRect(
                                                                          child: CircleAvatar(
                                                                              backgroundColor: Colors.white,
                                                                              radius: 25,
                                                                              foregroundImage: NetworkImage(dataUserImage!['photo'])),
                                                                        );
                                                                      });
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                          const Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      right:
                                                                          3)),
                                                          const Spacer(),
                                                          Container(
                                                            height: 25,
                                                            width: 80,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20),
                                                              color: AppColors
                                                                  .primaryBG,
                                                            ),
                                                            child: Center(
                                                                child: Text(
                                                                    '${dataTask!['status']} %')),
                                                          ),
                                                        ],
                                                      ),
                                                      const Spacer(),
                                                      const SizedBox(
                                                          height: 20),
                                                      Container(
                                                        height: 25,
                                                        width: 80,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                          color: AppColors
                                                              .primaryBG,
                                                        ),
                                                        child: Text(
                                                            '${dataTask['total_task_finished']} / ${dataTask['total_task']} Task'),
                                                      ),
                                                      Text(
                                                        dataTask['tittle'],
                                                        style: const TextStyle(
                                                            color: AppColors
                                                                .primaryText,
                                                            fontSize: 20),
                                                      ),
                                                      Text(
                                                        dataTask['description'],
                                                        style: const TextStyle(
                                                            color: AppColors
                                                                .primaryText,
                                                            fontSize: 15),
                                                      ),
                                                    ]),
                                              ),
                                            );
                                          });
                                    },
                                  );
                                }),
                          ),
                        ]),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
      floatingActionButton: Align(
        alignment: const Alignment(0.95, 0.95),
        child: FloatingActionButton.extended(
          onPressed: () {
            addEditTask(context: context, type: 'Add', docId: '');
          },
          label: const Text("Add Task"),
          icon: const Icon(Ionicons.add),
        ),
      ),
    );
  }

  addEditTask({BuildContext? context, String? type, String? docId}) {
    Get.bottomSheet(SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(top: 20, left: 25, right: 25),
        margin: context!.isPhone
            ? const EdgeInsets.only()
            : const EdgeInsets.only(left: 120, right: 120),
        height: 500,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            color: Colors.white),
        child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                Text(
                  '$type Task',
                  style: const TextStyle(
                      color: AppColors.primaryText,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: 'Tittle',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8))),
                  controller: controller.tittleController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Cannot be empty';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 5),
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  decoration: InputDecoration(
                      hintText: 'Description',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8))),
                  controller: controller.descriptionsController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Cannot be empty';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 5),
                DateTimePicker(
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                    decoration: InputDecoration(
                        hintText: 'Due Date',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8))),
                    controller: controller.dueDateController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Cannot be empty';
                      }
                      return null;
                    }),
                const SizedBox(height: 15),
                ConstrainedBox(
                    constraints:
                        BoxConstraints.tightFor(width: Get.width, height: 40),
                    child: ElevatedButton(
                        onPressed: () {
                          controller.saveUpdateTask(
                            controller.tittleController.text,
                            controller.descriptionsController.text,
                            controller.dueDateController.text,
                            docId!,
                            type!,
                          );
                        },
                        child: Text(type!)))
              ],
            )),
      ),
    ));
  }
}
