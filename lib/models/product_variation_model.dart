class ProductVariationModel {
  final Map<String, dynamic> attributes;
  final Map<String, dynamic> dimension;
  final String displayPrice;
  final String displayRegularPrice;
  final String imgUrl;
  final String sku;
  final int variationId;
  //ToDo: filter the products which has 0 priced
  ProductVariationModel({
    required this.attributes,
    required this.dimension,
    required this.displayPrice,
    required this.displayRegularPrice,
    required this.imgUrl,
    required this.sku,
    required this.variationId,
  });
  
  factory ProductVariationModel.fromJson(Map<String, dynamic> data){
    return ProductVariationModel(
        attributes: data["attributes"],
        dimension: data["dimensions"],
        displayPrice: data["display_price"].toString(),
        displayRegularPrice: data["display_regular_price"].toString(),
        imgUrl: data["image"]["url"],
        sku: data['sku'],
        variationId: data['variation_id'],
    );
  }
}
