// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:turismo_app/src/features/user/domain/entities/user_entity.dart';

class UserModel extends UserEntity {

  const UserModel({
    required this.id,
    required this.fullName,
    required this.email,
    required this.password,
  }) : super(id: id, fullName: fullName, email: email, password: password);

  factory UserModel.fromJson(String source) =>
  UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: (map['id_usuario'] as num).toString(),
      fullName: map['nombre_usuario'] as String? ?? '',
      email: map['correo'] as String? ?? '',
      password: map['contraseña'] as String? ?? '',
    );
  }



  @override
  final String id;
  @override
  final String fullName;
  @override
  final String email;
  @override
  final String password;


  Map<String, dynamic> toMap() {
    return {
      'id_usuario': id,
      'nombre_usuario': fullName,
      'correo': email,
      'contraseña': password,
    };
  }

  String toJson() => json.encode(toMap());


  @override
  String toString() {
    return 'UserModel(id: $id, fullName: $fullName, email: $email, password: $password)';
  }

}
