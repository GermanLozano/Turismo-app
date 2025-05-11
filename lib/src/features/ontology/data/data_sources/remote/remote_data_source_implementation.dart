import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:turismo_app/src/core/error/exeptions.dart';
import 'package:turismo_app/src/features/ontology/data/data_sources/remote/remote_data_source_interface.dart';
import 'package:turismo_app/src/features/ontology/data/models/category_model.dart';

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
      final jsonList = json.decode(response.body) as List<dynamic>;

      // Mapeamos los datos a objetos CategoryList
      final result = jsonList
          .map((e) => CategoryList.fromMap(e as Map<String, dynamic>))
          .toList();

      // Extraemos solo las categorías no nulas
      return result
          .where((element) => element.nombre != null)
          .map((e) => e.nombre!)
          .toList();
    } else {
      throw ServerException(
          message: 'Error al obtener las categorías: ${response.body}',);
    }
  }
}
