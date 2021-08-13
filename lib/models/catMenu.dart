class CatMenu {
  int id;
  String name;
  String imageAddress;

  CatMenu({
    required this.id,
    required this.name,
    required this.imageAddress,
  });

  factory CatMenu.fromJson(Map<String, dynamic> parsedJson) {
    return CatMenu(
      id: parsedJson['id'],
      name: parsedJson['name'],
      imageAddress: parsedJson['imageAddress'],
    );
  }
}
