import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quad_b/features/saler/screens/saler_home/saler_home_screen.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/image_strings.dart';
import '../../controllers/home_controller.dart';
import '../saler_orders/saler_orders_screen.dart';
import '../saler_products/saler_products_screen.dart';
import '../saler_profile/saler_profile_screen.dart';

class SalerHome extends StatelessWidget {
  const SalerHome({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());
    var navScreens = [
      const SalerHomeScreen(),
      const SalerProductsScreen(),
      const SalerOrdersScreen(),
      const SalerProfileScreen()
    ];

    var bottomNavbar = [
      BottomNavigationBarItem(
          icon: Image.asset(myHomeLogo, height: 24), label: "dashboard"),
      BottomNavigationBarItem(
          icon: Image.asset(myProducts, height: 24), label: "products"),
      BottomNavigationBarItem(
          icon: Image.asset(myOrders, height: 24), label: "orders"),
      BottomNavigationBarItem(
          icon: Image.asset(myAccout, height: 24), label: "Profile"),
    ];

    return Scaffold(
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          onTap: (index) {
            controller.navIndex.value = index;
          },
          currentIndex: controller.navIndex.value,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: purpleColor,
          unselectedItemColor: darkGrey,
          items: bottomNavbar,
        ),
      ), // BottomlavigationBar
      body: Obx(
        () => Column(
          children: [
            Expanded(
              child: navScreens.elementAt(controller.navIndex.value),
            ),
          ],
        ),
      ),
    ); // Scaffold
  }
}
