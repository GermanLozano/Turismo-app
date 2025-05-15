import 'dart:convert';
import 'dart:math' as math;

import 'package:http/http.dart' as http;
import 'package:turismo_app/src/core/config/config.dart';
import 'package:turismo_app/src/core/error/exeptions.dart';
import 'package:turismo_app/src/features/ontology/data/data_sources/remote/remote_data_source_interface.dart';
import 'package:turismo_app/src/features/ontology/data/models/category_model.dart';
import 'package:turismo_app/src/features/ontology/data/models/individual_model.dart';
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
      final jsonList = jsonDecode(response.body) as List;
      final categories = jsonList
          .map((item) => CategoryModel.fromMap(item as Map<String, dynamic>))
          .toList();

      return categories;
    } else {
      throw ServerException(
        message: 'Error al obtener las categorías: ${response.body}',
      );
    }
  }

  @override
  Future<List<CategoryModel>> getSubCategories({
    required CategoryEntity categoria,
  }) async {
    final url = Uri.parse('$apiUrl/subcategorias/${categoria.originalName}');

    final response = await client.get(url);

    if (response.statusCode == 200) {
      final jsonList = jsonDecode(response.body) as List;
      final categories = jsonList
          .map((item) => CategoryModel.fromMap(item as Map<String, dynamic>))
          .toList();

      return categories;
    } else {
      throw ServerException(
        message: 'Error al obtener las Subcategorías: ${response.body}',
      );
    }
  }

  @override
  Future<List<IndividualModel>> getPopularIndividual() async {
    final url = Uri.parse('$apiUrl/ofertas-destacadas');

    final response = await client.get(url);
    if (response.statusCode == 200) {
      final jsonList = json.decode(response.body) as List;
      final individuals = jsonList.map((item) {
        final imageURL = getimageUrl;

        final individuals =
            IndividualModel.fromMap(item as Map<String, dynamic>);

        return individuals.copyWith(imageURL: imageURL);
      }).toList();

      return individuals;
    } else {
      throw ServerException(
        message:
            'Error al obtener los individuos mas populares: ${response.body}',
      );
    }
  }

  String get getimageUrl {
    final random = math.Random();
    final randomNumer = random.nextInt(200);
    return 'https://picsum.photos/500/400?image=$randomNumer';
  }

  @override
  Future<List<IndividualModel>> getIndividual({
    String? category = '',
    String? queryData = '',
    int? offset = 0,
  }) async {
    final url = Uri.parse(
      '$apiUrl/buscar?q=$queryData&offset=$offset&category=$category',
    ); //modificar ruta

    customLog('url <<<<<<<<<<<${url}>>>>>>>>>>');

    final response = await client.get(url);
    customLog('<<<<<<<<<<<${response.body}>>>>>>>>>>');
    customLog(response.body);
    if (response.statusCode == 200) {
      final jsonList = json.decode(response.body) as List;
      final individuals = jsonList.map((item) {
        final imageURL = getimageUrl;

        final individuals =
            IndividualModel.fromMap(item as Map<String, dynamic>);

        return individuals.copyWith(imageURL: imageURL);
      }).toList();

      return individuals;
    } else {
      throw ServerException(
        message: 'Error al obtener los individuos: ${response.body}',
      );
    }
  }
}
