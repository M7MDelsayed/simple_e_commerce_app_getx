import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:project/app/shared/app_bar.dart';
import 'package:project/app/shared/colors.dart';

import '../controllers/details_controller.dart';

class DetailsView extends GetView<DetailsController> {
  const DetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbarGreen,
        title: const Text("Details Screen"),
        actions: const [
          ProductAndPrice(),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(controller.product.imgPath),
            const SizedBox(
              height: 11,
            ),
            Text(
              "\$${controller.product.price.toString()}",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 129, 129),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    "New",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  children: List.generate(
                    5,
                    (index) => const Icon(
                      Icons.star,
                      color: Color.fromARGB(255, 255, 191, 0),
                      size: 26,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 77,
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.edit_location,
                      size: 26,
                      color: Color.fromARGB(168, 3, 65, 27),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      "Flower Shop",
                      style: TextStyle(fontSize: 19),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const SizedBox(
              width: double.infinity,
              child: Text(
                "Details:",
                style: TextStyle(fontSize: 22),
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Obx(() {
              return Text(
                "A flower, sometimes known as a bloom or blossom, is the reproductive structure found in flowering plants (plants of the division Angiospermae). The biological function of a flower is to facilitate reproduction, usually by providing a mechanism for the union of sperm with eggs. Flowers may facilitate outcrossing (fusion of sperm and eggs from different individuals in a population) resulting from cross-pollination or allow selfing (fusion of sperm and egg from the same flower) when self-pollination occurs.",
                style: const TextStyle(fontSize: 18),
                maxLines: controller.showmore.value ? 3 : null,
                overflow: TextOverflow.fade,
              );
            }),
            TextButton(
              onPressed: () {
                controller.showmore.value = !controller.showmore.value;
              },
              child: Obx(() {
                return Text(
                  controller.showmore.value ? "Show more" : "Show less",
                  style: const TextStyle(fontSize: 18),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
