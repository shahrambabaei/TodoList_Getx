import 'dart:math';

class TaskModel {
  String? taskTitle;
  String? subTitle;
  bool? status;
  TaskModel(
      {required this.taskTitle, required this.subTitle, required this.status});

  Map<String, dynamic> toJson() {
    return {"taskTitle": taskTitle, "subTitle": subTitle, "status": status};
  }

  TaskModel.fromJson(Map<String, dynamic> json)
      : taskTitle = json["taskTitle"],
        subTitle = json["subTitle"],
        status = json["status"];
}
