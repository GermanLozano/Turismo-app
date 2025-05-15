import 'dart:convert';

import 'package:turismo_app/src/features/ontology/data/models/literal_model.dart';
import 'package:turismo_app/src/features/ontology/domain/entities/individual_entity.dart';

class IndividualModel extends IndividualEntity {
  IndividualModel({
    required this.nombre,
    required this.direccion,
    required this.valoracion,
    required this.types,
    required this.imageURL,
  }) : super(
          name: nombre.value,
          address: direccion.value,
          valoration: valoracion.value,
          type: types.value,
          imageURL: imageURL,
        );

  factory IndividualModel.fromJson(String str) =>
      IndividualModel.fromMap(json.decode(str) as Map<String, dynamic>);

  factory IndividualModel.fromMap(Map<String, dynamic> json) => IndividualModel(
        nombre: LiteralValue.fromMap(json['nombre'] as Map<String, dynamic>),
        direccion:
            LiteralValue.fromMap(json['direccion'] as Map<String, dynamic>),
        valoracion:
            LiteralValue.fromMap(json['valoracion'] as Map<String, dynamic>),
        types: LiteralValue.fromMap(json['type'] as Map<String, dynamic>),
        imageURL: json['imageURL'] != null ? json['imageURL'] as String : '',
      );

  final LiteralValue nombre;
  final LiteralValue direccion;
  final LiteralValue valoracion;
  final LiteralValue types;
  @override
  final String imageURL;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'nombre': nombre.toMap(),
        'direccion': direccion.toMap(),
        'valoracion': valoracion.toMap(),
        'type': types.toMap(),
        'imageURL': imageURL,
      };

  IndividualModel copyWith({
    LiteralValue? nombre,
    LiteralValue? direccion,
    LiteralValue? valoracion,
    LiteralValue? types,
    String? imageURL,
  }) {
    return IndividualModel(
      nombre: nombre ?? this.nombre,
      direccion: direccion ?? this.direccion,
      valoracion: valoracion ?? this.valoracion,
      types: types ?? this.types,
      imageURL: imageURL ?? this.imageURL,
    );
  }
}
