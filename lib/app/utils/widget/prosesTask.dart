import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../data/controller/auth_controller.dart';
import '../style/AppColors.dart';

addEditTask({BuildContext? context, String? type, String? docId}) {
  final authC = Get.find<AuthController>();
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
          key: authC.formKey,
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
                controller: authC.tittleController,
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
                controller: authC.descriptionsController,
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
                  controller: authC.dueDateController,
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
                        authC.saveUpdateTask(
                          authC.tittleController.text,
                          authC.descriptionsController.text,
                          authC.dueDateController.text,
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
