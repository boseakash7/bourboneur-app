class Package {
  String? id;
  String? name;
  String? price;
  String? packageType;
  String? appleStoreId;
  Package(
      {this.id, this.name, this.price, this.packageType, this.appleStoreId});

  Package.fromJson(json) {
    id = json['id'].toString();
    name = json['name'];
    price = json['price'].toString();
    appleStoreId = json['apple_store_id'].toString();
    packageType = json['package_type'].toString();
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "price": price,
      "apple_store_id": appleStoreId,
      "package_type": packageType
    };
  }
}
