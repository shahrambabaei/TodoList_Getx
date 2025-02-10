import 'package:get/get.dart';
import 'package:todolist_getx/controllers/newtask_controller.dart';
import 'package:todolist_getx/controllers/task_controller.dart';

class Mybinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TaskController());
    Get.put(NewTaskController());
  }
}
