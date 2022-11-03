import 'package:shelf_example/box/my_object_box.dart';
import 'package:shelf_example/singletons/singleton_item.dart';
import 'package:shelf_example/models/item_model.dart';
import 'package:shelf_example/objectbox.g.dart';
import 'package:shelf_example/utils/colored_print.dart';
import 'package:shelf_router/shelf_router.dart';
// ignore: depend_on_referenced_packages
import 'package:shelf/shelf.dart' as shelf;

class ItemApi {
  ItemApi();

  Router get router {
    final router = Router();

    router.post('/add', (shelf.Request request) async {
      List<int> v = await ItemSingleton.addItem(request);

      return shelf.Response.ok(v.toString(),
          headers: {'Content-Type': 'application/json'});
    });

    router.get('/getAll', (shelf.Request request) async {
      Box<ItemModel> box = AppObjectbox.itemStore.box<ItemModel>();
      List<ItemModel> items = box.getAll();
      final data = ItemSingleton.itemsEncode(items);
      data.printf("data");
      return shelf.Response.ok(data,
          headers: {'Content-Type': 'application/json'});
    });
    return router;
  }
}
