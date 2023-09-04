class Fruits {
  String? name;
  String? image;
  int? price;
  String? description;

  Fruits({this.name, this.image, this.price, this.description});

  Fruits.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    price = json['price'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    data['price'] = this.price;
    data['description'] = this.description;
    return data;
  }
}