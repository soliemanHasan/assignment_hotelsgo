import 'package:base_project_v2/modules/home/data/data_source/home_data_source.dart';
import 'package:base_project_v2/modules/home/data/data_source/home_data_source_imp.dart';
import 'package:base_project_v2/modules/home/data/repository/home_repository_imp.dart';
import 'package:base_project_v2/modules/home/domin/repository/home_repository.dart';
import 'package:base_project_v2/modules/home/presentation/blocs/home_bloc/home_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

final sl = GetIt.instance;
final Logger logger = Logger();

/// This class [ServicesLocator] is define to inject values and variables (Objects) into memory when the application is opened,
/// those values will remain stored and preserved for direct access in randomaccess memory according to the specified conditions
/// and situations.
///
/// The concept of injection depends on dependency injection, using the get_it library to provide this type of service,
///
/// it is necessary You have to call [ServicesLocator.init] in main.dart, main finction, before [runApp]
///
/// 1- to inject Your Bloc object use [registerFactory] function
///    Ex:   sl.registerFactory(() => YourBloc(sl()));
/// 2- to inject Your Repository, Data Source object use [registerLazySingleton] function
///    Ex:   sl.registerLazySingleton(() => YourDataSource());
///    Ex:   sl.registerLazySingleton(() => YourDataSource());
///
/// you can get any Object you inject by call [sl]
///    Ex: sl<YourBloc>();

// TODO: add (BLOCs , REPOSITORIES , DATA SOURCES)
class ServicesLocator {
  static ServicesLocator? _instance;
  ServicesLocator._();
  factory ServicesLocator() => _instance ??= ServicesLocator._();

  void init() {
    //// BLOCS
    sl.registerFactory(() => HomeBloc(sl()));

    //// REPOSITORIES
    sl.registerLazySingleton<HomeRepository>(() => HomeRepositoryImp(sl()));

    //// DATA SOURCES
    sl.registerLazySingleton<HomeDataSource>(() => HomeDataSourceImp());
  }
}
