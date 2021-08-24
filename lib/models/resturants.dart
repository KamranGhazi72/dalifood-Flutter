class Resturant {
  int id;
  String name;
  String type;
  String? latitude;
  String? longitude;
  String? city;
  String address;
  int sendingPrice;
  String? description;
  bool isInMyFavorite;
  int rate;
  int distance;
  String? imageAddress;

  Resturant({
    required this.id,
    required this.name,
    required this.type,
    this.latitude,
    this.longitude,
    this.city,
    required this.address,
    required this.sendingPrice,
    this.description,
    required this.isInMyFavorite,
    required this.rate,
    required this.distance,
    this.imageAddress,
  });

  factory Resturant.fromJson(Map<String, dynamic> parsedJson) {
    return Resturant(
      id: parsedJson['id'],
      name: parsedJson['name'],
      type: parsedJson['type'],
      latitude: parsedJson['latitude'],
      longitude: parsedJson['longitude'],
      city: parsedJson['city'],
      address: parsedJson['address'],
      sendingPrice: parsedJson['sendingPrice'],
      description: parsedJson['description'],
      isInMyFavorite: parsedJson['isInMyFavorite'],
      rate: parsedJson['rate'],
      distance: parsedJson['distance'],
      imageAddress: parsedJson['imageAddress'],
    );
  }
}
