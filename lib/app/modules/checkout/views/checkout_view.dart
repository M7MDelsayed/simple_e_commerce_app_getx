import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:project/app/controllers/cart_controller.dart';
import 'package:project/app/shared/app_bar.dart';
import 'package:project/app/shared/colors.dart';

import '../controllers/checkout_controller.dart';

class CheckoutView extends GetView<CheckoutController> {
  const CheckoutView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterButtons: [
        Center(
          child: ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(bTNpink),
              padding: MaterialStateProperty.all(
                const EdgeInsets.all(12),
              ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            child: GetBuilder<CartController>(
              builder: (controller) {
                return Text(
                  "pay \$ ${controller.price}",
                  style: const TextStyle(fontSize: 19),
                );
              },
            ),
          ),
        )
      ],
      appBar: AppBar(
        backgroundColor: appbarGreen,
        title: const Text("CheckOut Screen"),
        actions: const [
          ProductAndPrice(),
        ],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
            height: 600,
            child: GetBuilder<CartController>(
              builder: (controller) {
                return ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: controller.selectedItemsGetx.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        subtitle: Text(
                            "price : \$${controller.selectedItemsGetx[index].price}"),
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(
                              controller.selectedItemsGetx[index].imgPath),
                        ),
                        title: Text(controller.selectedItemsGetx[index].name),
                        trailing: IconButton(
                          onPressed: () {
                            Get.find<CartController>()
                                .delete(controller.selectedItemsGetx[index]);
                          },
                          icon: const Icon(
                            Icons.remove,
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            )),
      ),
    );
  }
}
