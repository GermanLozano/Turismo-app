import 'package:dartz/dartz.dart';
import 'package:turismo_app/src/core/error/error.dart';

typedef EitherOr<T> = Either<Failure, T>;
typedef FutureEither<T> = Future<EitherOr<T>>;
