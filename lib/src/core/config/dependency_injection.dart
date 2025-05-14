import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:turismo_app/src/features/ontology/ontology_dependency_injection.dart';
import 'package:turismo_app/src/features/user/user_dependency_injection.dart';

GetIt sl = GetIt.instance;

class DependencyInjection {
  static Future<void> init()  async {
    sl.registerLazySingleton(http.Client.new);

      await UserDependencyInjection.init();
      await CategoryDependencyInjection.init();
  }
}
