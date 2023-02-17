
import 'package:json_annotation/json_annotation.dart';

part 'product_category_model.g.dart';

@JsonSerializable()
class ProductCategory{
  final int id;
  final String name;
  final String slug;

  ProductCategory(
      {required this.id,
      required this.name,
      required this.slug});

  factory ProductCategory.fromJson(Map<String, dynamic> json)=> _$ProductCategoryFromJson(json);
  Map<String, dynamic> toJson() => _$ProductCategoryToJson(this);

  @override
  String toString() {
    return "ProductCategory Object: categoryId => ${this.id}, categoryName => ${this.name}, categorySlugName => ${this.slug}";
  }

  // @override
  // // TODO: implement props
  // List<Object?> get props => [categoryId, categoryName, categorySlugName];
}
