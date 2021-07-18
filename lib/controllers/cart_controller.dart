import 'package:dali_food/models/drink.dart';
import 'package:dali_food/models/product.dart';
import 'package:get/state_manager.dart';

class CartController extends GetxController {
  var cartItem = <Product>[].obs;
  var drinkItem = <Drink>[].obs;
  int orderCounter = 0;

  addToCart(Product product, Drink drink, int counterBuy) {
    cartItem.add(product);
    drinkItem.add(drink);
    orderCounter = counterBuy;
    print('cartItem.length:::  ${cartItem.length}');
    print('drinkItem.length:::  ${drinkItem.length}');
    print('Order Counter:::  $orderCounter');
  }

  deleteFtomCart(Product product) {
    cartItem.remove(product);
  }
}
