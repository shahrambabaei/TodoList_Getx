import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_getx/constant.dart';

class NewTaskWidget extends StatelessWidget {
  const NewTaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Task"),
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
                      onPressed: () {},
                      child: Text("Add")))
            ],
          ),
        ),
      ),
    );
  }
}
