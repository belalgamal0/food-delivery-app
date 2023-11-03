import '../../domain/entity/category.dart';

class CategoryModel extends Category {
  String? description;
  DateTime? createdAt;
  DateTime? modifiedAt;
  CategoryModel(
      {required int id,
      required String name,
      String? description,
      DateTime? createdAt,
      DateTime? modifiedAt})
      : super(
          id: id,
          name: name
        );

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        modifiedAt: json["modifiedAt"] == null
            ? null
            : DateTime.parse(json["modifiedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "createdAt": createdAt?.toIso8601String(),
        "modifiedAt": modifiedAt?.toIso8601String(),
      };
}
