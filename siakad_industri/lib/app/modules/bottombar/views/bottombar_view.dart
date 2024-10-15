import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:siakad_industri/app/modules/home/views/home_view.dart';
import 'package:siakad_industri/app/modules/mapel/views/mapel_view.dart';
import 'package:siakad_industri/app/modules/profile/views/profile_view.dart';

import '../controllers/bottombar_controller.dart';

class BottombarView extends GetView<BottombarController> {
  const BottombarView({Key? key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottombarController>(
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex,
              children: [HomeView(), MapelView(), ProfileView()],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.red,
            onTap: controller.changeIndex,
            currentIndex: controller.tabIndex,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            items: [
              controller.BotBar(
                ikon: Icons.home,
                label: 'Home',
              ),
              controller.BotBar(
                ikon: Icons.calendar_month,
                label: 'Mapel',
              ),
              controller.BotBar(
                ikon: Icons.emoji_people_outlined,
                label: 'Profile',
              ),
            ],
          ),
        );
      },
    );
  }
}
