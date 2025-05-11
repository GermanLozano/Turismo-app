import 'package:equatable/equatable.dart';
import 'package:turismo_app/src/core/type_defs/type_defs.dart';

abstract interface class UseCaseInterface<ReturnType, ParamsType> {
  FutureEither<ReturnType> call(ParamsType paramsType);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
