class Package {
  String? id;  
  String? name;  
  String? price;
  String? packageType;

  Package(
      {this.id,
      this.name,
      this.price,
      this.packageType});

  Package.fromJson(json) {
    id = json['id'].toString();
    name = json['name'];
    price = json['price'].toString();    
    packageType = json['package_type'].toString();    
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "price": price,
      "package_type": packageType
    };
  }
}
