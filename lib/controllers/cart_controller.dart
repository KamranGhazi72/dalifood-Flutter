import 'package:dali_food/models/product.dart';
import 'package:get/state_manager.dart';

class CartController extends GetxController {
  var cartItem = <Product>[].obs;

  addToCart(Product product) {
    cartItem.add(product);
    print(cartItem.length);
  }

  deleteFtomCart(Product product) {
    cartItem.remove(product);
  }
}
