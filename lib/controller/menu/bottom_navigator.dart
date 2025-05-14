import 'package:get/get.dart';
import 'package:mr/controller/home/home_controller.dart';
import 'package:mr/services/data_service.dart';

class BottomNavigationController extends GetxController {
  final DataService dataService = Get.find<DataService>();
  final HomeController homeController = Get.find<HomeController>();
  var currentIndex = 0.obs;
  Future<void> _refreshMedicines() async {
    await dataService.getMedicinesStream().first;
    homeController.update();
    homeController.calculateNextDose();
  }

  void changeTabIndex(int index) {
    currentIndex.value = index;
    _refreshMedicines();
  }
}
