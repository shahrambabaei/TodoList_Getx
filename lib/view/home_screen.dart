import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_getx/constant.dart';
import 'package:todolist_getx/controllers/task_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColor.lightBluColor,
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.menu,
                        color: Colors.white,
                      ))
                ],
              ),
            ),
            TopSectionWidget(),
            BottomSectionWidget()
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: MyColor.lightBluColor,
          elevation: 0,
          onPressed: () {
            Get.toNamed("/newTask");
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

class TopSectionWidget extends StatelessWidget {
  const TopSectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 70),
      child: Column(
        children: [
          CircleAvatar(
            radius: 25,
            child: Icon(
              Icons.bookmarks_rounded,
              color: MyColor.lightBluColor,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "All",
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(color: Colors.white),
          ),
          SizedBox(
            height: 10,
          ),
          Obx(() {
            return Text(
              "${Get.find<TaskController>().tasks.length} Tasks",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: Colors.white, fontSize: 16),
            );
          })
        ],
      ),
    );
  }
}

class BottomSectionWidget extends StatefulWidget {
  const BottomSectionWidget({
    super.key,
  });

  @override
  State<BottomSectionWidget> createState() => _BottomSectionWidgetState();
}

class _BottomSectionWidgetState extends State<BottomSectionWidget> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    var controller = Get.find<TaskController>();
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
          height: Get.height * .55,
          width: Get.width,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24), topRight: Radius.circular(24))),
          child: Obx(
            () {
              return ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(controller.tasks[index].taskTitle.toString()),
                      subtitle:
                          Text(controller.tasks[index].subTitle.toString()),
                      trailing: Checkbox(
                          activeColor: MyColor.lightBluColor,
                          value: controller.tasks[index].status,
                          onChanged: (value) {
                            isChecked = !isChecked;
                            setState(() {});
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3)),
                          side: BorderSide(color: Colors.black45, width: 1)),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      height: .5,
                    );
                  },
                  itemCount: controller.tasks.length);
            },
          )),
    );
  }
}
