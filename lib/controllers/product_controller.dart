import 'package:dali_food/models/product.dart';
import 'package:get/state_manager.dart';

class ProductsController extends GetxController {
  var products = <Product>[].obs;
  // var counter = 0.obs;

  // increament() {
  //   counter++;
  // }

  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    await Future.delayed(Duration(seconds: 1));
    var productsResult = [
      Product(
        id: 0,
        resturantName: 'ایتالین',
        foodName: 'پیتزا ماراریتا',
        foodDesc: 'گوشت راسته، قارچ، پنیر فلفل، ژامبون گوشت، ذرت',
        price: 23000,
        offerPrice: 18000,
        peykPrice: 1500,
        img: [
          'assets/images/berger3.png',
          'assets/images/kabab3.jpg',
          'assets/images/pizza1.jpg'
        ],
      ),
      Product(
        id: 1,
        resturantName: 'علی بابا',
        foodName: 'کباب ترش',
        foodDesc: 'گوشت راسته، قارچ، پنیر فلفل، ژامبون گوشت، ذرت',
        price: 23000,
        offerPrice: 18000,
        peykPrice: 1500,
        img: ['assets/images/kabab2.jpg'],
      ),
      Product(
        id: 2,
        resturantName: 'ایتالین',
        foodName: 'پیتزا مارگاریتا',
        foodDesc: 'گوشت راسته، قارچ، پنیر فلفل، ژامبون گوشت، ذرت',
        price: 23000,
        peykPrice: 1500,
        img: ['assets/images/pizza1.jpg'],
      ),
      Product(
        id: 3,
        resturantName: 'ایتالین',
        foodName: 'پیتزا مارگاریتا',
        foodDesc: 'گوشت راسته، قارچ، پنیر فلفل، ژامبون گوشت، ذرت',
        price: 23000,
        offerPrice: 18000,
        peykPrice: 1500,
        img: ['assets/images/berger1.jpg'],
      ),
      Product(
        id: 4,
        resturantName: 'ایتالین',
        foodName: 'پیتزا مارگاریتا',
        foodDesc: 'گوشت راسته، قارچ، پنیر فلفل، ژامبون گوشت، ذرت',
        price: 23000,
        peykPrice: 1500,
        img: ['assets/images/kabab3.jpg'],
      ),
      Product(
        id: 5,
        resturantName: 'ایتالین',
        foodName: 'پیتزا مارگاریتا',
        foodDesc: 'گوشت راسته، قارچ، پنیر فلفل، ژامبون گوشت، ذرت',
        price: 23000,
        offerPrice: 18000,
        peykPrice: 1500,
        img: ['assets/images/kabab1.jpg'],
      ),
    ];

    products.value = productsResult;
  }

  // var counterBuy = 0;
  // increaseBuy() {
  //   counterBuy++;
  //   print('increased !!!!!!!!!!!!!!!');
  //   print(counterBuy);
  //   update();
  // }
}
