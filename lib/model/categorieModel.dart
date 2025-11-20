class Category {
  final String imagePath;
  final String title;

  Category({required this.imagePath, required this.title});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      imagePath: json['imagePath'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'imagePath': imagePath,
      'title': title,
    };
  }
}
