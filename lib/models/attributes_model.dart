import 'dart:convert';

class AttributesModel {
  final int id;
  final String name;
  final String slug;
  // List<String> options;
  var options;

  AttributesModel(
      {required this.id,
      required this.name,
      required this.slug,
      this.options = const []});

  factory AttributesModel.fromJson(Map<String, dynamic> data) {
    return AttributesModel(
      id: data["id"] ?? 0,
      name: data["name"] ?? "attribute-name",
      slug: data["slug"] ?? "slug-name",
      // options: (data["options"] as List<dynamic>)
      //     .map((option) => option.toString())
      //     .toList(),
      options: data["options"],
    );
  }

  @override
  String toString() {
    return "AttributeModel Object = id => ${this.id}, name => ${this.name}, slug => ${this.slug}, options => ${this.options}";
  }

// @override
// // TODO: implement props
// List<Object?> get props => [id, name, slug, options];
}
