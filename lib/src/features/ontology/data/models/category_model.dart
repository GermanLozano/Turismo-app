import 'dart:convert';
import 'package:turismo_app/src/features/ontology/data/models/literal_model.dart';
import 'package:turismo_app/src/features/ontology/domain/entities/categoty_entity.dart';

class CategoryModel extends CategoryEntity {
  CategoryModel({
    required this.nombre,
  }) : super(
          normaliceName: nombre.value.replaceAll('_', ' '),
          originalName: nombre.value,
        );

  factory CategoryModel.fromJson(String str) =>
      CategoryModel.fromMap(json.decode(str) as Map<String, dynamic>);

  factory CategoryModel.fromMap(Map<String, dynamic> json) => CategoryModel(
        nombre: LiteralValue.fromMap(json['nombre'] as Map<String, dynamic>),
      );

  final LiteralValue nombre;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'nombre': nombre.toMap(),
      };
}
