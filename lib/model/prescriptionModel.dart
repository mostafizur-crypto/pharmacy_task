class PrescriptionModel {
  String? id;
  String? imagePath;

  PrescriptionModel({
    this.id,
    this.imagePath,
  });

  factory PrescriptionModel.fromJson(Map<String, dynamic> json) {
    return PrescriptionModel(
      id: json['id'],
      imagePath: json['imagePath'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "imagePath": imagePath,
    };
  }
}
