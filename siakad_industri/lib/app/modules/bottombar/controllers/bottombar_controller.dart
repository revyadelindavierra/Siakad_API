import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:siakad_industri/app/modules/TahunAjaran/controllers/tahun_ajaran_controller.dart';
import 'package:siakad_industri/app/modules/home/controllers/home_controller.dart';
import 'package:siakad_industri/app/modules/mapel/controllers/mapel_controller.dart';

class BottombarController extends GetxController {
  var tabIndex = 0;

  void changeIndex(int index) {
    tabIndex = index;

    if (index == 0 && !Get.isRegistered<HomeController>()) {
      Get.put(HomeController());
    } else if (index == 1 && !Get.isRegistered<MapelController>()) {
      Get.put(MapelController());
    } else if (index == 2 && !Get.isRegistered<TahunAjaranController>()) {
      Get.put(TahunAjaranController());
    }


    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (index == 1) {
        if (Get.isRegistered<MapelController>()) {
          Get.find<MapelController>().getMapel();
        }
      } else if (index == 2) {
        if (Get.isRegistered<TahunAjaranController>()) {
          Get.find<TahunAjaranController>().getTahunAjaran();
        }
      }
      update();
    });
  } 

  BotBar({IconData? ikon, String? label}) {
    return BottomNavigationBarItem(
      icon: Icon(ikon),
      label: label,
    );
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
