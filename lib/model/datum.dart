class RestaurantModel {
  RestaurantModel({
    this.success,
    this.message,
    this.data,
  });

  bool? success;
  String? message;
  List<Datum>? data;

  factory RestaurantModel.fromJson(Map<String, dynamic> json) => RestaurantModel(
    success: json["success"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  final int? id;
  final String? name;
  final String? description;
  final String? phone;
  final String? address;
  final int? lowestPrice;

  Datum(
      {this.id,
      this.name,
      this.description,
      this.phone,
      this.address,
      this.lowestPrice});

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        phone: json["phone"],
        address: json["address"],
        lowestPrice: json["lowest_price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "phone": phone,
        "address": address,
        "lowest_price": lowestPrice,
      };
}
