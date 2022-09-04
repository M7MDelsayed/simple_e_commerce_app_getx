import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:project/app/controllers/cart_controller.dart';
import 'package:project/app/models/items.dart';
import 'package:project/app/routes/app_pages.dart';
import 'package:project/app/shared/app_bar.dart';
import 'package:project/app/shared/colors.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbarGreen,
        title: const Text("Home"),
        actions: const [ProductAndPrice()],
      ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const UserAccountsDrawerHeader(
                  accountName: Text(
                    "Mohamed Elsayed",
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  accountEmail: Text(
                    "Mohamed12@Gmail.com",
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  currentAccountPicture: CircleAvatar(
                    radius: 55,
                    backgroundImage: AssetImage("assets/img/me.JPG"),
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/img/flowers.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                ListTile(
                  title: const Text("Home"),
                  leading: const Icon(Icons.home),
                  onTap: () => Get.toNamed(Routes.HOME),
                ),
                ListTile(
                  title: const Text("My Products"),
                  leading: const Icon(Icons.add_shopping_cart),
                  onTap: () {
                    Get.toNamed(Routes.CHECKOUT);
                  },
                ),
                ListTile(
                  title: const Text("About"),
                  leading: const Icon(Icons.help_center),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text("Log out"),
                  leading: const Icon(Icons.exit_to_app),
                  onTap: () {},
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 12),
              child: const Text(
                "Devolped By Mohamed Elsayed",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 22),
        child: Wrap(
          children: items.map((e) {
            return SizedBox(
              width: MediaQuery.of(context).size.width * 0.50,
              height: MediaQuery.of(context).size.height * 0.2,
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.DETAILS, arguments: e);
                },
                child: GridTile(
                  footer: GridTileBar(
                    trailing: GetBuilder<CartController>(
                      builder: (controller) {
                        return IconButton(
                          color: const Color.fromARGB(255, 62, 94, 70),
                          onPressed: () {
                            Get.find<CartController>().add(
                              e,
                            );
                          },
                          icon: const Icon(
                            Icons.add,
                            color: bTNgreen,
                          ),
                        );
                      },
                    ),
                    leading: Text(
                      "\$${e.price}",
                      style: const TextStyle(
                        color: bTNgreen,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    title: const Text(""),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(55),
                    child: Image.asset(e.imgPath),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
