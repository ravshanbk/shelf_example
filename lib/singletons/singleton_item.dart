import 'dart:convert';

import 'package:shelf_example/box/my_object_box.dart';
import 'package:shelf_example/models/item_model.dart';
import 'package:shelf_example/objectbox.g.dart';
import 'package:shelf_example/utils/colored_print.dart';

class ItemSingleton {
  static Future<List<int>> addItem(dynamic request) async {
    List<ItemModel> items = [];
    try {
      final payload = await request.readAsString();
      payload.toString().printf("payload");
      final decoded = jsonDecode(payload);
      decoded.runtimeType.toString().printf("run time type");
      decoded.toString().printf("decoded");
      items = (decoded as List).map((e) => ItemModel.fromJson(e)).toList();
      items.length.printf("item barcode");
    } catch (e) {
      e.toString().printf("error");
    }
    Box<ItemModel> box = AppObjectbox.itemStore.box<ItemModel>();
    List<int> v = box.putMany(items);

    v.printf("put id list");
    return v;
  }

  static String itemsEncode(List<ItemModel> items) {
    List<dynamic> mapList = [];
    for (int i = 0; i < items.length; i++) {
      mapList.add(items[i].toJson());
    }

    return jsonEncode(mapList);
  }
}
