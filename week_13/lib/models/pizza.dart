class Pizza {
  final int id;
  final String pizzaName;
  final String description;
  final double price;
  final String imageUrl;

  Pizza({
    required this.id,
    required this.pizzaName,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  Pizza.fromJson(Map<String, dynamic> json)
    : id = (json['id'] as num?)?.toInt() ?? 0,
      pizzaName = json['pizzaName']?.toString() ?? '',
      description = json['description']?.toString() ?? '',
      price = (json['price'] as num?)?.toDouble() ?? 0,
      imageUrl = json['imageUrl']?.toString() ?? '';

  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'pizzaName': pizzaName,
      'description': description,
      'price': price,
      'imageUrl': imageUrl
    };
  }
}