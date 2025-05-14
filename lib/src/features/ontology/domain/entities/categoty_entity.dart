
import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  const CategoryEntity({
    required this.originalName,
    required this.normaliceName,
  });

  final String originalName;
  final String normaliceName;

  @override
  List<Object> get props => [originalName, normaliceName];
}
