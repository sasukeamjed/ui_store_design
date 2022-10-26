class DimensionsModel{
  final String length;
  final String width;
  final String height;

  DimensionsModel({required this.length ,required this.width,required this.height});

  factory DimensionsModel.fromJson(Map<String, dynamic> data){
    return DimensionsModel(length: data["length"].toString().isNotEmpty ? data["length"] : "0,0", width: data["width"].toString().isNotEmpty ? data["width"] : "0,0", height: data["height"].toString().isNotEmpty ? data["height"] : "0,0");
  }

  @override
  String toString() {
    return "Product Dimensions => length: ${this.length}, width: ${this.width}, height: ${this.height}";
  }
}