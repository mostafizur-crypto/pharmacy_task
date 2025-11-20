class Slide {
  final String title;
  final String color;

  Slide({required this.title, required this.color});

  factory Slide.fromJson(Map<String, dynamic> json) {
    return Slide(
      title: json['title'],
      color: json['color'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'color': color,
    };
  }
}
