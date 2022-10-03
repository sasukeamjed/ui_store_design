class ProductVariationModel {
  final Map<String, dynamic> attributes;
  final Map<String, dynamic> dimension;
  // final double displayPrice;
  // final double displayRegularPrice;
  // final String imgUrl;
  // final String sku;
  // final int variationId;

  ProductVariationModel({
    required this.attributes,
    required this.dimension,
    // required this.displayPrice,
    // required this.displayRegularPrice,
    // required this.imgUrl,
    // required this.sku,
    // required this.variationId,
  });
  
  factory ProductVariationModel.fromJson(Map<String, dynamic> data){
    return ProductVariationModel(
        attributes: data["attributes"],
        dimension: data["dimensions"],
        // displayPrice: double.parse(data["display_price"]),
        // displayRegularPrice: double.parse(data["display_regular_price"]),
        // imgUrl: data["image"]["url"],
        // sku: data['sku'],
        // variationId: data['variation_id'],
    );
  }
}
