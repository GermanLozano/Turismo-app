import 'package:turismo_app/src/core/config/config.dart';
import 'package:turismo_app/src/features/ontology/data/data_sources/remote/remote_data_source_implementation.dart';
import 'package:turismo_app/src/features/ontology/data/data_sources/remote/remote_data_source_interface.dart';
import 'package:turismo_app/src/features/ontology/data/repository/repository_implementation.dart';
import 'package:turismo_app/src/features/ontology/domain/repository/repository_interface.dart';
import 'package:turismo_app/src/features/ontology/domain/use_cases/get_categories_use_case.dart';
import 'package:turismo_app/src/features/ontology/domain/use_cases/get_popular_individual.dart';
import 'package:turismo_app/src/features/ontology/domain/use_cases/get_subcategories_use_case.dart';
import 'package:turismo_app/src/features/ontology/presentation/bloc/category_managemen/category_managemen_bloc.dart';
import 'package:turismo_app/src/features/ontology/presentation/bloc/popular_individual_bloc/popular_individual_bloc_management_bloc.dart';
import 'package:turismo_app/src/features/ontology/presentation/bloc/sub_category_managemen/sub_category_managemen_bloc.dart';

class CategoryDependencyInjection {
  static Future<void> init() async {
    //------------------------ Blocs-providers state management ------------------------
    sl
      ..registerFactory<CategoryManagemenBloc>(
        () => CategoryManagemenBloc(
          getCategoriesUseCase: sl(),
        ),
      )
      ..registerFactory<SubCategoryManagemenBloc>(
        () => SubCategoryManagemenBloc(
          getSubCategoriesUseCase: sl(),
        ),
      )
      ..registerFactory<PopularIndividualBlocManagementBloc>(
        () => PopularIndividualBlocManagementBloc(
          getPopularIndividualUseCase: sl(),
        ),
      )

      // ------------------------ Use cases ------------------------
      ..registerLazySingleton<GetCategoriesUseCase>(
        () => GetCategoriesUseCase(
          repositoryInterface: sl(),
        ),
      )
      ..registerLazySingleton<GetSubCategoriesUseCase>(
        () => GetSubCategoriesUseCase(
          repositoryInterface: sl(),
        ),
      )
      ..registerLazySingleton<GetPopularIndividualUseCase>(
        () => GetPopularIndividualUseCase(
          repositoryInterface: sl(),
        ),
      )

      // ------------------------ Repositories ------------------------
      ..registerLazySingleton<RepositoryInterface>(
        () => RepositoryImplementation(
          remoteDataSourceInterface: sl(),
        ),
      )
      // ------------------------ Data Sources ------------------------
      ..registerLazySingleton<RemoteDataSourceInterface>(
        () => RemoteDataSourceImplementation(
          client: sl(),
        ),
      );
    // ---------------
  }
}
