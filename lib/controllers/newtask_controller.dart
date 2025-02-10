import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewTaskController extends GetxController {
  late TextEditingController titleController;
  late TextEditingController subtitleController;
  @override
  void onInit() {
    titleController = TextEditingController();
    subtitleController = TextEditingController();
    super.onInit();
  }
}
