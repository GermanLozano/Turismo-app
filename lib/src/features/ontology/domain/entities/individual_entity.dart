import 'package:equatable/equatable.dart';

class IndividualEntity extends Equatable {
  const IndividualEntity({
    required this.name,
    required this.address,
    required this.valoration,
    required this.type,
    required this.imageUrl,
  });

  final String name;
  final String address;
  final String valoration;
  final String type;
  final String imageUrl;

  @override
  List<Object> get props {
    return [
      name,
      address,
      valoration,
      type,
      imageUrl,
    ];
  }
}
