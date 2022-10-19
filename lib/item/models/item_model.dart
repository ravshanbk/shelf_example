class ItemModel {
  String id;
  String name;
  String barcode;
  int sku;
  String categoryId;
  int inStock;
  int price;
  int camePrice;
  ItemModel({
    required this.barcode,
    required this.camePrice,
    required this.categoryId,
    required this.id,
    required this.inStock,
    required this.name,
    required this.price,
    required this.sku,
  });
}
