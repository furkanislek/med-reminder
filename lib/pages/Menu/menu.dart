import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mr/controller/menu/bottom_navigator.dart';
import 'package:mr/pages/AddPill/add_pill.dart';
import 'package:mr/pages/Blogs/blogs.dart';
import 'package:mr/pages/Home/home.dart';
import 'package:mr/pages/Profile/profile.dart';

class Menu extends StatelessWidget {
  Menu({super.key});

  final BottomNavigationController controller = Get.put(
    BottomNavigationController(),
  );

  final List<Widget> pages = [
    HomeScreen(),
    AddPillScreen(),
    BlogsScreen(),
    ProfileScreen(),
  ];

  final List<String> titles = [
    'myMedicines.title'.tr,
    'addMedicine.title'.tr,
    'blogs.title'.tr,
    'profile.title'.tr,
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: pages[controller.currentIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          unselectedItemColor: Colors.black54,
          selectedItemColor: Colors.black,
          onTap: controller.changeTabIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: titles[0]),
            BottomNavigationBarItem(
              icon: Icon(Icons.medication_outlined),
              label: titles[1],
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.my_library_books),
              label: titles[2],
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined),
              label: titles[3],
            ),
          ],
        ),
      ),
    );
  }
}
