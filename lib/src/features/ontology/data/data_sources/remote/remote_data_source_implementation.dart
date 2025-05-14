import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:turismo_app/src/core/config/config.dart';
import 'package:turismo_app/src/core/error/exeptions.dart';
import 'package:turismo_app/src/features/ontology/data/data_sources/remote/remote_data_source_interface.dart';
import 'package:turismo_app/src/features/ontology/data/models/category_model.dart';
import 'package:turismo_app/src/features/ontology/domain/entities/categoty_entity.dart';

//api
class RemoteDataSourceImplementation implements RemoteDataSourceInterface {
  RemoteDataSourceImplementation({
    required this.client,
  });

  final http.Client client;

  final String apiUrl = 'https://ontologiaturismo.vercel.app';

  @override
  Future<List<CategoryModel>> getCategories() async {
    final url = Uri.parse('$apiUrl/categorias');

    final response = await client.get(url);

    if (response.statusCode == 200) {
      // Mapeamos los datos a objetos CategoryList
      final result = CategoryListModel.fromJson(response.body);

      customLog('===<<<<<>>> ${result.toMap()}');

      return [CategoryModel(value: 'value')];
    } else {
      throw ServerException(
        message: 'Error al obtener las categorías: ${response.body}',
      );
    }
  }

  @override
  Future<List<CategoryModel>> getSubCategories(
      {required CategoryEntity categoria}) {
    // TODO: implement getSubCategories
    throw UnimplementedError();
  }
}
