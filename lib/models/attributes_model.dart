class AttributesModel{
  final int id;
  final String name;
  final String slug;
  final List<String> options;

  AttributesModel({required this.id, required this.name, required this.slug, required this.options});
  
  factory AttributesModel.fromJson(Map<String, dynamic> data){
    return AttributesModel(id: data["id"], name: data["name"], slug: data["slug"], options: (data["options"] as List<dynamic>).map((e) => e.toString()).toList());
  }
}