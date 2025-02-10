import 'package:get/get.dart';
import 'package:todolist_getx/models/task_model.dart';

class TaskController extends GetxController {
  RxList<TaskModel> tasks = <TaskModel>[].obs;
  
}
