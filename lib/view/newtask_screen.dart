import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_getx/constant.dart';
import 'package:todolist_getx/controllers/newtask_controller.dart';
import 'package:todolist_getx/controllers/task_controller.dart';
import 'package:todolist_getx/models/task_model.dart';

class NewTaskWidget extends StatelessWidget {
  const NewTaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            Get.find<TaskController>().isEditing ? "Edit Task" : "New Task"),
        centerTitle: true,
        leading: SizedBox(),
        actions: [
          IconButton(onPressed: () => Get.back(), icon: Icon(Icons.close))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "what are you planning?",
                style: TextStyle(color: Colors.grey.shade400, fontSize: 16),
              ),
              TextField(
                controller: Get.find<NewTaskController>().titleController,
                maxLines: 10,
                cursorColor: MyColor.lightBluColor,
                decoration: InputDecoration(
                    disabledBorder: UnderlineInputBorder(),
                    focusedBorder: UnderlineInputBorder(),
                    enabledBorder: UnderlineInputBorder(),
                    border: InputBorder.none),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: Get.find<NewTaskController>().subtitleController,
                maxLength: 30,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.bookmark_border_outlined),
                    hintText: "Add note",
                    counter: SizedBox()),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                  width: Get.width,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          foregroundColor: Colors.white,
                          backgroundColor: MyColor.lightBluColor),
                      onPressed: () {
                        if (Get.find<TaskController>().isEditing) {
                          var task = Get.find<TaskController>()
                              .tasks[Get.find<TaskController>().index];
                          task.taskTitle = Get.find<NewTaskController>()
                              .titleController
                              .text;
                          task.subTitle = Get.find<NewTaskController>()
                              .subtitleController
                              .text;
                          Get.find<TaskController>()
                              .tasks[Get.find<TaskController>().index] = task;
                          Get.find<NewTaskController>().titleController.text =
                              "";
                          Get.find<NewTaskController>()
                              .subtitleController
                              .text = "";
                        } else {
                          Get.find<TaskController>().tasks.add(TaskModel(
                              taskTitle: Get.find<NewTaskController>()
                                  .titleController
                                  .text,
                              subTitle: Get.find<NewTaskController>()
                                  .subtitleController
                                  .text,
                              status: false));
                          Get.find<NewTaskController>().titleController.text =
                              "";
                          Get.find<NewTaskController>()
                              .subtitleController
                              .text = "";
                        }

                        Get.back();
                      },
                      child: Text(Get.find<TaskController>().isEditing
                          ? "Edit"
                          : "Add")))
            ],
          ),
        ),
      ),
    );
  }
}
