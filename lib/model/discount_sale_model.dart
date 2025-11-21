class DiscountSaleModel {
  final String name;
  final String image;
  final double rating;
  final double originalPrice;
  final double discountPrice;
  final int discountPercentage;
  final int reviewsCount;
  final String productUrl;

  DiscountSaleModel({
    required this.name,
    required this.image,
    required this.rating,
    required this.originalPrice,
    required this.discountPrice,
    required this.discountPercentage,
    required this.reviewsCount,
    required this.productUrl,
  });

  factory DiscountSaleModel.fromJson(Map<String, dynamic> json) {
    return DiscountSaleModel(
      name: json['name'],
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
