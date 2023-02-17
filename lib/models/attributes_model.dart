import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
part 'attributes_model.g.dart';

@JsonSerializable()
class AttributesModel {
  final int id;
  final String name;
  // List<String> options;
  final List<String> options;

  AttributesModel(
      {required this.id,
      required this.name,
      this.options = const []});

  // factory AttributesModel.fromJson(Map<String, dynamic> data) {
  //   return AttributesModel(
  //     id: data["id"] ?? 0,
  //     name: data["name"] ?? "attribute-name",
  //     slug: data["slug"] ?? "slug-name",
  //     // options: (data["options"] as List<dynamic>)
  //     //     .map((option) => option.toString())
  //     //     .toList(),
  //     options: data["options"],
  //   );
  // }

  factory AttributesModel.fromJson(Map<String, dynamic> json)=> _$AttributesModelFromJson(json);
  Map<String, dynamic> toJson() => _$AttributesModelToJson(this);

  @override
  String toString() {
    return "AttributeModel Object = id => ${this.id.toString()}, name => ${this.name}, options => ${this.options}";
  }

// @override
// // TODO: implement props
// List<Object?> get props => [id, name, slug, options];
}
