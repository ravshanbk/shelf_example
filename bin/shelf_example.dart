import 'package:shelf_example/api/category_api.dart';
import 'package:shelf_example/api/item_api.dart';
import 'package:shelf_example/box/my_object_box.dart';

import 'package:shelf_example/shelf_example.dart' as shelf_example;

import 'package:shelf_router/shelf_router.dart';

// ignore: depend_on_referenced_packages
import 'package:shelf/shelf_io.dart' as io;

void main(List<String> arguments) async {
  await AppObjectbox.init();
  final app = Router();

  app.mount('/items', ItemApi().router);
  app.mount('/category', CategoryApi().router);

  await io.serve(app, 'localhost', 8181);

  print('Hello world: ${shelf_example.calculate()}!');
}
