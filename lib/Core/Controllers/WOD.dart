class WOD {
  String? id;  
  String? userId;  
  String? name;
  String? data;

  WOD(
      {this.id,
      this.userId,
      this.name,
      this.data});

  WOD.fromJson(json) {
    id = json['id'].toString();
    userId = json['user_id'].toString();
    name = json['wheel_name'];    
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "user_id": userId,
      "wheel_name": name,
      "data": data
    };
  }
}
