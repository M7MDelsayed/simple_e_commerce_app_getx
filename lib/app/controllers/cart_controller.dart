import 'package:get/get.dart';
import 'package:project/app/models/items.dart';

class CartController extends GetxController {
  final selectedItemsGetx = <Item>[];

  double get price {
    double price = 0;
    for (final e in selectedItemsGetx) {
      price += e.price.round();
    }
    return price;
  }

  void add(Item product) {
    selectedItemsGetx.add(product);
    update();
  }

  void delete(Item product) {
    selectedItemsGetx.remove(product);
    update();
  }
}
