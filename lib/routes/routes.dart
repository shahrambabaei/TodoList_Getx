import 'package:get/get.dart';
import 'package:todolist_getx/view/home_screen.dart';
import 'package:todolist_getx/view/newtask_screen.dart';

class Routes {
  static List<GetPage> get getPages => [
        GetPage(name: "/", page: () => HomeScreen()),
        GetPage(
          name: "/newTask",
          page: () => NewTaskWidget(),
        )
      ];
}
