import 'package:get/get.dart';
import 'package:project/app/models/items.dart';

class DetailsController extends GetxController {
  final Item product = Get.arguments;
  final showmore = true.obs;
}
