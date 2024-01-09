class ServiceResponse {
  int status;
  bool success;
  List<Service> services;

  ServiceResponse({
    required this.status,
    required this.success,
    required this.services,
  });

  factory ServiceResponse.fromJson(Map<String, dynamic> json) {
    List<dynamic> data = json['data'];
    List<Service> services =
        data.map((service) => Service.fromJson(service)).toList();

    return ServiceResponse(
      status: json['status'],
      success: json['success'],
      services: services,
    );
  }
}

class Service {
  int id;
  String mainImage;
  double price;
  double? discount;
  double priceAfterDiscount;
  String title;
  double averageRating;
  int completedSalesCount;
  bool recommended;

  Service({
    required this.id,
    required this.mainImage,
    required this.price,
    required this.discount,
    required this.priceAfterDiscount,
    required this.title,
    required this.averageRating,
    required this.completedSalesCount,
    required this.recommended,
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      id: json['id'],
      mainImage: json['main_image'],
      price: json['price'].toDouble(),
      discount: json['discount'] != null ? json['discount'].toDouble() : null,
      priceAfterDiscount: json['price_after_discount'].toDouble(),
      title: json['title'],
      averageRating: json['average_rating'].toDouble(),
      completedSalesCount: json['completed_sales_count'],
      recommended: json['recommended'],
    );
  }
}
