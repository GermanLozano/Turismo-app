
import 'dart:convert';
import 'package:turismo_app/src/features/ontology/domain/entities/individual_entity.dart';

class IndividualModel extends IndividualEntity {
  const IndividualModel({
    required this.name,
    required this.address,
    required this.valoration,
    required this.type,
    required this.imageUrl,
  }) : super(
          name: name,
          address: address,
          valoration: valoration,
          type: type,
          imageUrl: imageUrl,
        );

  factory IndividualModel.fromJson(String source) =>
    IndividualModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory IndividualModel.fromMap(Map<String, dynamic> map) {
    return IndividualModel(
      name: map['nombre'] as String? ?? '',
      address: map['direccion'] as String? ?? '',
      valoration: map['valoracion'] as String? ?? '',
      type: map['type'] as String? ?? '',
      imageUrl: map['imageUrl'] as String? ?? '',
    );
  }

  
  final String name;
  final String address;
  final String valoration;
  final String type;
  final String imageUrl;

  Map<String, dynamic> toMap() {
    return {
      'nombre': name,
      'direccion': address,
      'valoracion': valoration,
      'type': type,
      'imageUrl': imageUrl,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() =>
      'CategoryModel(name: $name, address: $address, valoration: $valoration, type: $type, imageUrl: $imageUrl)';
}

class CategoryList {
  CategoryList({
    this.category,
  });

  factory CategoryList.fromMap(Map<String, dynamic> json) => CategoryList(
        category: IndividualModel.fromMap(json),
      );

  final IndividualModel? category;

  Map<String, dynamic> toMap() => {
        'category': category?.toMap(),
      };

  String toJson() => json.encode(toMap());
}
