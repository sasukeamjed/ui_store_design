class DimensionsModel{
  final String? length;
  final String? width;
  final String? height;

  DimensionsModel({required this.length, required this.width, required this.height});

  factory DimensionsModel.fromJson(Map<String, dynamic> data){
    return DimensionsModel(length: data["length"], width: data["length"], height: data["height"]);
  }


}