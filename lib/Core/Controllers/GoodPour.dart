class GoodPour {
  String? id;  
  String? bottleName;  
  String? proof;
  String? location;
  String? premium;
  String? status;

  GoodPour(
      {this.id,
      this.bottleName,
      this.proof,
      this.location,
      this.premium,
      this.status});

  GoodPour.fromJson(json) {
    id = json['id'].toString();
    bottleName = json['bottle_name'];
    proof = json['proof'].toString();    
    location = json['location'].toString();
    premium = json['premium'].toString();
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "bottle_name": bottleName,
      "proof": proof,
      "location": location,
      "premium": premium,
      "status": status
    };
  }
}
