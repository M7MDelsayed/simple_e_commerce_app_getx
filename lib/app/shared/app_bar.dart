import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/app/controllers/cart_controller.dart';
import 'package:project/app/routes/app_pages.dart';

class ProductAndPrice extends StatelessWidget {
  const ProductAndPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      builder: (controller) {
        return Row(
          children: [
            Stack(
              children: [
                IconButton(
                  onPressed: () => Get.toNamed(Routes.CHECKOUT),
                  icon: const Icon(Icons.add_shopping_cart),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(211, 164, 255, 193),
                  ),
                  child: Text(
                    "${controller.selectedItemsGetx.length}",
                    style: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 12,
              ),
              child: Text(
                "\$${controller.price}",
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        );
      },
    );
  }
}
