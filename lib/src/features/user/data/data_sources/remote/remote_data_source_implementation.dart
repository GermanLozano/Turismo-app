import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:turismo_app/src/core/error/exeptions.dart';
import 'package:turismo_app/src/features/user/data/data_sources/remote/remote_data_source_interface.dart';
import 'package:turismo_app/src/features/user/data/models/user_model.dart';
import 'package:turismo_app/src/features/user/domain/entities/user_entity.dart';

//api
class RemoteDataSourceImplementation implements RemoteDataSourceInterface {
  RemoteDataSourceImplementation({
    required this.client,
  });

  final http.Client client;

  final String url = 'https://ontologiaturismo.vercel.app';

  // implementacion del metodo de login en la fuente de datos

  @override
  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    final uri = Uri.parse('$url/usuarios/login');

    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    final body = {
      'correo': email,
      'contraseña': password,
    };

    try {
      final response = await client.post(
        uri,
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        return UserModel.fromJson(response.body);
      } else {
        throw ServerException(
          message: 'Error al iniciar sesion ${response.body}',
        );
      }
    } on ServerException catch (e) {
      throw ServerException(
        message: e.message,
      );
    }
  }

  // implementacion del metodo de registro para la base  de datos
  @override
  Future<bool> signUp({required UserEntity userEntity}) async {
    // esto es para la api
    final uri = Uri.parse('$url/usuarios/crear');

    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    final body = {
      'nombre_usuario': userEntity.fullName,
      'correo': userEntity.email,
      'contraseña': userEntity.password,
    };

    try {
      final response = await client.post(
        uri,
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return true;
      } else {
        throw ServerException(
          message: 'Error al crear usuario ${response.body}',
        );
      }
    } on ServerException catch (e) {
      throw ServerException(message: e.message);
    }
  }

  // Implemnetacion del metodo de cierre de sesion
  @override
  Future<bool> logOut() async {
    return true;
  }
}
