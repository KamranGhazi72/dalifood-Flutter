class CustomerAddress {
  int id;
  String addressText;

  CustomerAddress({
    required this.id,
    required this.addressText,
  });
}

List<CustomerAddress> addr = [
  CustomerAddress(
    id: 0,
    addressText:
        'مهران - پیامبر - بلوار آیت الله کاشانی - روبرو پاساژ یاران - جنب فست فود آلاوین - ساختمان پاسارگاد - پلاک 55 - طبقه 5 - واحد 9',
  ),
  CustomerAddress(
    id: 1,
    addressText:
        'مهران - پیامبر - بلوار آیت الله کاشانی - روبرو پاساژ یاران - جنب فست فود آلاوین - ساختمان پاسارگاد - پلاک 55 - طبقه 5 - واحد 9',
  ),
];
