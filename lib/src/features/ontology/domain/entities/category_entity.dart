import 'package:equatable/equatable.dart';


class CategoryEntity extends Equatable {
  const CategoryEntity({
    required this.nombreCategoria,
  });

  final String nombreCategoria;

  @override
  List<Object> get props {
    return [
      nombreCategoria,
    ];
  }
}
