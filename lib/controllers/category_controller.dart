import 'package:dali_food/models/category.dart';
import 'package:get/state_manager.dart';

class CatController extends GetxController {
  var categories = <Category>[].obs;

  void onInit() {
    super.onInit();
    fetchCategories();
  }

  void fetchCategories() async {
    await Future.delayed(Duration(seconds: 3));
    var categoriesResult = [
      Category(
        id: 0,
        resturantName: 'ایتالین',
        foodName: 'پیتزا مارگاریتا',
        foodDesc: 'گوشت راسته، قارچ، پنیر فلفل، ژامبون گوشت، ذرت',
        price: 23000,
        offerPrice: 18000,
        peykPrice: 1500,
        img: 'assets/images/berger3.png',
      ),
      Category(
        id: 1,
        resturantName: 'علی بابا',
        foodName: 'کباب ترش',
        foodDesc: 'گوشت راسته، قارچ، پنیر فلفل، ژامبون گوشت، ذرت',
        price: 23000,
        offerPrice: 18000,
        peykPrice: 1500,
        img: 'assets/images/kabab2.jpg',
      ),
      Category(
        id: 2,
        resturantName: 'ایتالین',
        foodName: 'پیتزا مارگاریتا',
        foodDesc: 'گوشت راسته، قارچ، پنیر فلفل، ژامبون گوشت، ذرت',
        price: 23000,
        peykPrice: 1500,
        img: 'assets/images/pizza1.jpg',
      ),
      Category(
        id: 3,
        resturantName: 'ایتالین',
        foodName: 'پیتزا مارگاریتا',
        foodDesc: 'گوشت راسته، قارچ، پنیر فلفل، ژامبون گوشت، ذرت',
        price: 23000,
        offerPrice: 18000,
        peykPrice: 1500,
        img: 'assets/images/berger1.jpg',
      ),
      Category(
        id: 4,
        resturantName: 'ایتالین',
        foodName: 'پیتزا مارگاریتا',
        foodDesc: 'گوشت راسته، قارچ، پنیر فلفل، ژامبون گوشت، ذرت',
        price: 23000,
        peykPrice: 1500,
        img: 'assets/images/kabab3.jpg',
      ),
      Category(
        id: 5,
        resturantName: 'ایتالین',
        foodName: 'پیتزا مارگاریتا',
        foodDesc: 'گوشت راسته، قارچ، پنیر فلفل، ژامبون گوشت، ذرت',
        price: 23000,
        offerPrice: 18000,
        peykPrice: 1500,
        img: 'assets/images/kabab1.jpg',
      ),
    ];

    categories.value = categoriesResult;
  }

  var counterBuy = 0.obs;
  void increaseBuy() {
    counterBuy++;
    print('increased !!!!!!!!!!!!!!!');
    print(counterBuy);
    update();
  }
}
