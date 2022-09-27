class ProductCategory {
  final int categoryId;
  final String categoryName;
  final String categorySlugName;

  ProductCategory(
      {required this.categoryId,
      required this.categoryName,
      required this.categorySlugName});

  factory ProductCategory.fromJson(Map<String, dynamic> data) {
    return ProductCategory(
        categoryId: data["id"],
        categoryName: data["name"],
        categorySlugName: data["slug"]);
  }

  @override
  String toString() {
    return "ProductCategory Object: categoryId => ${this.categoryId}, categoryName => ${this.categoryName}, categorySlugName => ${this.categorySlugName}";
  }
}
