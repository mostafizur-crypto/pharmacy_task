class Bestsellmodel {
  final String name;
  final String power;
  final String image;
  final double rating;
  final double originalPrice;
  final double discountPrice;
  final int discountPercentage;
  final int reviewsCount;
  final String productUrl;

  Bestsellmodel({
    required this.name,
    required this.power,
    required this.image,
    required this.rating,
    required this.originalPrice,
    required this.discountPrice,
    required this.discountPercentage,
    required this.reviewsCount,
    required this.productUrl,
  });

  factory Bestsellmodel.fromJson(Map<String, dynamic> json) {
    return Bestsellmodel(
      name: json['name'],
      power: json['power'],
      image: json['image'],
      rating: json['rating'],
      originalPrice: json['original_price'],
      discountPrice: json['discount_price'],
      discountPercentage: json['discount_percentage'],
      reviewsCount: json['reviews_count'],
      productUrl: json['product_url'],
    );
  }
}
