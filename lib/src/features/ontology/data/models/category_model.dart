import 'dart:convert';

import 'package:turismo_app/src/features/ontology/domain/entities/categoty_entity.dart';
class CategoryListModel {
    final CategoryModel? nombre;

    CategoryListModel({
        this.nombre,
    });

    factory CategoryListModel.fromJson(String str) => CategoryListModel.fromMap(json.decode(str) as Map<String, dynamic>);

    String toJson() => json.encode(toMap());

    factory CategoryListModel.fromMap(Map<String, dynamic> json) => CategoryListModel(
        nombre: json["nombre"] == null ? null : CategoryModel.fromMap(json["nombre"] as Map<String, dynamic>),
    );

    Map<String, dynamic> toMap() => {
        "nombre": nombre?.toMap(),
    };
}




class CategoryModel extends CategoryEntity {

  CategoryModel({
    required this.value,
  }) : super (
    normaliceName: value.replaceAll('_', ' '),
    originalName: value,
  );

  factory CategoryModel.fromJson(String str) =>
      CategoryModel.fromMap(json.decode(str) as Map<String, dynamic>);

  factory CategoryModel.fromMap(Map<String, dynamic> map) => CategoryModel(
        value: map['value'] as String,
      );

  final String value;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'value': value,
      };
}
