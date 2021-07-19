import 'package:dali_food/models/drink.dart';
import 'package:dali_food/models/product.dart';
import 'package:get/state_manager.dart';

class CartController extends GetxController {
  var cartItem = <Product>[].obs;
  var drinkItem = <Drink>[].obs;
  int orderCounter = 0;

  double get productTotalPrice => cartItem.fold(
      0, (sum, item) => (sum + item.price + item.peykPrice) * orderCounter);
  double get drinkTotalPrice =>
      drinkItem.fold(0, (sum, item) => sum + item.price);

  double get totalPrice => productTotalPrice + drinkTotalPrice;

  addToCart(Product product, Drink drink, int counterBuy) {
    cartItem.add(product);
    drinkItem.add(drink);
    orderCounter = counterBuy;
    print('cartItem.length:::  ${cartItem.length}');
    print('drinkItem.length:::  ${drinkItem.length}');
    print('Order Counter:::  $orderCounter');
  }

  deleteAllFromCart() {
    cartItem.clear();
    drinkItem.clear();
  }

  deleteFoodFtomCart(Product product) {
    cartItem.remove(product);
    update();
  }

  deleteDrinkFtomCart(Drink drink) {
    drinkItem.remove(drink);
    update();
  }
}
