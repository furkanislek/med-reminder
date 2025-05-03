import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mr/controller/menu/bottom_navigator.dart';
import 'package:mr/pages/Home/home.dart';

class Menu extends StatelessWidget {
  Menu({super.key});

  final BottomNavigationController controller = Get.put(
    BottomNavigationController(),
  );

  final List<Widget> pages = [
    HomeScreen(), // İlaç hatırlatıcı özet
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
        appBar: AppBar(
          title: Text(titles[controller.currentIndex.value]),
          centerTitle: true,
          backgroundColor: Colors.teal,
        ),
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
              icon: Icon(Icons.calendar_month),
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
