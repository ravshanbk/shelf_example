
import 'package:objectbox/objectbox.dart';

@Entity(uid: 2)
class CategoryModel {
  int? id;
  String name;
  String categoryId;
  CategoryModel(
      {required this.categoryId, required this.id, required this.name});
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      categoryId: json['categoryId'].toString(),
      id: json['id'],
      name: json['name'],
    );
  }
  Map<String, dynamic> toJson() => {
        "id": id,
        "categoryId": categoryId,
        "name": name,
      };
}
