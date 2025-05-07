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
    HomeScreen(), // İlaç hatırlatıcı özet
    AddPillScreen(), // İlaç hatırlatıcı özet
    BlogsScreen(), // İlaç hatırlatıcı özet
    ProfileScreen(), // İlaç hatırlatıcı özet
    //Diğer sayfaları da yaz
  ];

  final List<String> titles = [
    'İlaçlarım',
    'Planlarım',
    'Yeni Plan',
    'İstatistikler',
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
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(
              icon: Icon(Icons.medication_outlined),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.my_library_books),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
