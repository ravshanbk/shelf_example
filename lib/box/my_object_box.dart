import 'package:shelf_example/objectbox.g.dart';

class AppObjectbox {
  static late Store itemStore;
  static late Store categoryStroe;

  static Future<void> init() async {
    // Directory dir = Directory.current;
    const itemPath = "C:\\itemBox";
    const categoryPatn = "C:\\categoryBox";

    itemStore = Store(
      getObjectBoxModel(),
      directory: itemPath,
    );
    categoryStroe = Store(
      getObjectBoxModel(),
      directory: categoryPatn,
    );
  }
}
