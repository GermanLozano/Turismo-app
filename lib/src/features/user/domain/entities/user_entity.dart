import 'package:equatable/equatable.dart';


class UserEntity extends Equatable {

  const UserEntity({
    required this.id,
    required this.fullName, 
    required this.email, 
    required this.password, 
  });

  
  final String id;
  final String fullName;
  final String email;
  final String password;
 

  @override
  List<Object> get props {
    return [
      id,
      fullName,
      email,
      password,
    ];
  }
}
