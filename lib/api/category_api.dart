import 'package:shelf_example/box/my_object_box.dart';
import 'package:shelf_example/models/category_model.dart';
import 'package:shelf_example/singletons/category_singleton.dart';
import 'package:shelf_example/singletons/singleton_item.dart';
import 'package:shelf_example/models/item_model.dart';
import 'package:shelf_example/objectbox.g.dart';
import 'package:shelf_example/utils/colored_print.dart';
import 'package:shelf_router/shelf_router.dart';
// ignore: depend_on_referenced_packages
import 'package:shelf/shelf.dart' as shelf;

class CategoryApi {
  CategoryApi();

  Router get router {
    final router = Router();

    router.post('/upload', (shelf.Request request) async {
      int v = await CategorySingleton.addCategory(request);
      if (v == -1) {
        return shelf.Response.ok("failed",
            headers: {'Content-Type': 'application/json'});
      }
      return shelf.Response.ok(v.toString(),
          headers: {'Content-Type': 'application/json'});
    });

    router.get('/getAll', (shelf.Request request) async {
      Box<CategoryModel> box = AppObjectbox.categoryStroe.box<CategoryModel>();
      List<CategoryModel> items = box.getAll();
      final data = CategorySingleton.categoriesEncode(items);
      data.printf("data");
      return shelf.Response.ok(data,
          headers: {'Content-Type': 'application/json'});
    });
    return router;
  }
}
