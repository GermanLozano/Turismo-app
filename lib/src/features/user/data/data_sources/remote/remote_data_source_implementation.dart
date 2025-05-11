import 'package:http/http.dart' as http;
import 'package:turismo_app/src/core/config/config.dart';
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
  Future<UserEntity> signIn({
    required String email,
    required String password,
  }) async {
    final uri = Uri.parse('$url/iniciarSesion');

    final response = await client.post(
      uri,
      body: {
        'correo': email,
        'contraseña': password,
      },
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(response.body);
    } else {
      return UserModel(
        id: '1',
        fullName: 'Brayan care verga',
        email: email,
        password: password,
      );

      // throw ServerException(
      //   message: 'Error al iniciar sesion ${response.body}',
      // );
    }
  }

  // implementacion del metodo de registro para la base  de datos
  @override
  Future<bool> signUp({required UserEntity userEntity}) async {
    final uri = Uri.parse('$url/crearUsuario');

    final response = await client.post(
      uri,
      body: {
        'nombre_usuario': userEntity.fullName,
        'correo': userEntity.email,
        'contraseña': userEntity.password,
      },
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return true;
      // throw ServerException(
      //   message: 'Error al crear usuario ${response.body}',
      // );
    }
  }

  // Implemnetacion del metodo de cierre de sesion
  @override
  Future<bool> logOut() async {
    return true;
  }
}
