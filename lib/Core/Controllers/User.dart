class User {
  String? id;  
  String? name;  
  String? email;
  String? status;
  String? packageType;
  String? packagePrice;
  String? subscriptionType;
  User(
      {this.id,
      this.name,
      this.email,
      this.status,
      this.packageType,
      this.packagePrice,
      this.subscriptionType});

  User.fromJson(json) {
    id = json['id'].toString();
    name = json['name'];
    email = json['email'];    
    status = json['status'];
    packageType = json['package_type'];
    packagePrice = json['package_price'];
    subscriptionType = json['subscription_type'];   
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "status": status,
      "package_type": packageType,
      "package_price": packagePrice,
      "subscription_type": subscriptionType,     
    };
  }
}
