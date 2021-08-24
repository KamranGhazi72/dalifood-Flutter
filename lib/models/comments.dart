class Comments {
  int? customerId;
  String? name;
  String? family;
  String? text;

  Comments({
    this.customerId,
    this.name,
    this.family,
    this.text,
  });

  factory Comments.fromJson(Map<String, dynamic> parsedJson) {
    return Comments(
      customerId: parsedJson['customerId'],
      name: parsedJson['name'],
      family: parsedJson['family'],
      text: parsedJson['text'],
    );
  }
}
