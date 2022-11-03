import 'dart:convert';

import 'package:shelf_example/box/my_object_box.dart';
import 'package:shelf_example/models/category_model.dart';
import 'package:shelf_example/objectbox.g.dart';
import 'package:shelf_example/utils/colored_print.dart';

class CategorySingleton {
  static Future<int> addCategory(dynamic request) async {
    CategoryModel categories;
    try {
      final payload = await request.readAsString();
      payload.toString().printf("payload");
      final decoded = jsonDecode(payload);
      decoded.runtimeType.toString().printf("run time type");
      decoded.toString().printf("decoded");
      categories = CategoryModel.fromJson(decoded);

    } catch (e) {
      e.toString().printf("error");
      return -1;
    }
    Box<CategoryModel> box = AppObjectbox.categoryStroe.box<CategoryModel>();
    int v = -1;
    try {
      v = box.put(categories);
      categories.id = v;
      box.put(categories, mode: PutMode.update);
    } catch (e) {
      throw Exception("THE OBJECTBOX PUT EXEPTION");
    }

    v.printf("put id list");
    return v;
  }

  static String categoriesEncode(List<CategoryModel> items) {
    List<dynamic> mapList = [];
    for (int i = 0; i < items.length; i++) {
      mapList.add(items[i].toJson());
    }

    return jsonEncode(mapList);
  }
}
