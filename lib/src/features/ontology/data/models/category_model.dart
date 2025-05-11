
import 'dart:convert';
import 'package:turismo_app/src/features/ontology/domain/entities/category_entity.dart';

class CategoryModel extends CategoryEntity {
  const CategoryModel({
    required this.value,

  }) : super(nombreCategoria: value);

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      value: map['value'] as String,
    );
  }

 final String value;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'value': value,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'CategoryModel(value: $value)';
}

class CategoryList {

    CategoryList({
        this.nombre,
    });

   // factory CategoryList.fromJson(String str) => CategoryList.fromMap(json.decode(str));


    factory CategoryList.fromMap(Map<String, dynamic> json) => CategoryList(
        nombre: json['nombre'] == null ? null : CategoryModel.fromMap(json['nombre']  as Map<String, dynamic>),
    );

    final CategoryModel? nombre;

    String toJson() => json.encode(toMap());

    Map<String, dynamic> toMap() => {
        'nombre': nombre?.toMap(),
    };
}
