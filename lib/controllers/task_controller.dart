import 'package:get/get.dart';
import 'package:todolist_getx/models/task_model.dart';

class TaskController extends GetxController {
  var isEditing=false;
  var index=0;
  RxList<TaskModel> tasks = <TaskModel>[].obs;
  
}
