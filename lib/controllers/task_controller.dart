import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todolist_getx/models/task_model.dart';

class TaskController extends GetxController {
  var isEditing = false;
  var index = 0;
  RxList<TaskModel> tasks = <TaskModel>[].obs;

  @override
  void onInit() {
    final box = GetStorage();
    if (box.read("tasks") != null) {
      var list = box.read("tasks");
      for (var item in list) {
        tasks.add(TaskModel.fromJson(item));
      }
    }
    ever(tasks,(value){
      box.write("tasks", tasks.toJson());

    } );
    super.onInit();
  }
}
