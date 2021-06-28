class Category {
  int id;
  String name;
  String desc;
  String address;
  double peykPrice;
  String img;

  Category({
    required this.id,
    required this.name,
    required this.desc,
    required this.address,
    required this.peykPrice,
    required this.img,
  });
}

List<Category> categories = [
  Category(
    id: 0,
    name: 'رستوان ریحون',
    desc:
        'جوجه کباب بدون استخوان، فیله ماهی، میگو کبابی، کباب ترش، کباب چنجه ،کوبیده، قرمه سبزی، کباب برگ',
    address: 'خیابان آزادی - روبرو بانک ملت',
    peykPrice: 1500,
    img: 'assets/images/food2.jpg',
  ),
  Category(
    id: 1,
    name: 'اکبر جوجه',
    desc:
        'جوجه کباب ، فسنجون، کباب برگ، آش هالاو، دنده کباب، کباب سالمون، بال مرغ عسلی، کباب گوشت و سبزیجات',
    address: 'خیابان آزادی - روبرو بانک ملت',
    peykPrice: 2000,
    img: 'assets/images/food4.jpg',
  ),
  Category(
    id: 3,
    name: 'فست فود جگوار',
    desc: 'چیزبرگر، پیتزا پپرونی، استیک',
    address: 'خیابان دوم پامنار - روبرو پارک جواهری',
    peykPrice: 4500,
    img: 'assets/images/food1.jpg',
  ),
  Category(
    id: 4,
    name: 'ایتالین',
    desc:
        'اسپاگتی، روماندو، استیک گوشت، پیتزا مارگاریتا، اسنک‌های ونیزی، ریزیتو اسکامپی، بیستکا الا فیورنتینا، پارمیگینا ملانزین',
    address: 'ولنجک - میدان رخش - جنب پارک',
    peykPrice: 3500,
    img: 'assets/images/berger1.jpg',
  ),
  Category(
    id: 2,
    name: 'علی بابا',
    desc:
        'جوجه، برگ، شیشلیک، سلطانی، چلوکباب کوبیده، جوجه کباب بدون استخوان، فیله ماهی، میگو کبابی، کباب ترش، کباب چنجه',
    address: 'خیابان دوم پامنار - روبرو پارک جواهری',
    peykPrice: 5000,
    img: 'assets/images/berger3.png',
  ),
];
