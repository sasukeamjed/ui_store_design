//plan to pick product variation
//first try to make and attribute object for each variation
class ProductVariationModel{
  final Map<String, dynamic> attributes;
  final Map<String, dynamic> dimension;
  final String displayPrice;
  final String displayRegularPrice;
  final String singleImage;
  final String thumbnailImage;
  final String sku;
  final double variationPrice;
  final int variationId;
  final bool isInStock;
  //ToDo: filter the products which has 0 priced
  ProductVariationModel({required this.variationPrice, required this.isInStock,
    required this.thumbnailImage,
    required this.attributes,
    required this.dimension,
    required this.displayPrice,
    required this.displayRegularPrice,
    required this.singleImage,
    required this.sku,
    required this.variationId,
  });
  
  factory ProductVariationModel.fromJson(Map<String, dynamic> data){
    return ProductVariationModel(
        attributes: data["attributes"],
        dimension: data["dimensions"],
        displayPrice: data["display_price"].toString(),
        displayRegularPrice: data["display_regular_price"].toString(),
        singleImage: data["image"]["src"],
        thumbnailImage: data["image"]["thumb_src"],
        sku: data['sku'],
        variationId: data['variation_id'],
        isInStock: data['is_in_stock'],
        variationPrice: double.parse(data['display_price']),
    );
  }

  @override
  String toString() {
    return "displayRegularPrice => $displayRegularPrice ,displayPrice => $displayPrice ,dimension => $dimension,attributes => $attributes";
  }

// List<Map<String, String>> getVariation(){
  //   Map<String, String> variation = {
  //
  //   };
  // }

  // @override
  // // TODO: implement props
  // List<Object?> get props => [variationId, sku, imgUrl, displayRegularPrice, displayPrice, dimension, attributes];
}
