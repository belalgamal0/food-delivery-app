import 'package:dio/dio.dart' as dio;
import 'feat/product_details/domain/usecase/load_details_usecase.dart';
import 'feat/product_details/presentation/bloc/details_bloc.dart';
import 'injection_container.config.dart';
import 'package:injectable/injectable.dart';
import 'feat/basket/presentation/bloc/basket_bloc.dart';
import 'feat/categories/domain/usecase/get_categories_usecase.dart';
import 'feat/favorites/domain/usecase/favorite_usecase.dart';
import 'feat/favorites/domain/usecase/is_cached_usecase.dart';
import 'feat/favorites/presentation/bloc/favorite_bloc.dart';
import 'feat/home/domain/usecase/get_foods_usecase.dart';
import 'feat/home/presentation/bloc/home_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:hive/hive.dart';
import 'package:get_it/get_it.dart';
import 'core/network/network_info.dart';
import 'package:http/http.dart' as http;

@module
abstract class AppModule {
  // Register blocs
  @injectable
  HomeBloc get homeBloc;

  @injectable
  BasketBloc get basketBloc;

  @injectable
  FavoriteBloc get favoriteBloc;

  @injectable
  DetailsBloc get detailsBloc;

  // Register use cases
  @lazySingleton
  GetFoodsUseCase get getFoodsUseCase;

  @lazySingleton
  GetCategories get getCategories;
  @lazySingleton
  FavoritesFoodUseCase get favoritesFoodUseCase;
  @lazySingleton
  IsCachedUseCase get isCachedUseCase;
  @lazySingleton
  LoadDetailsUseCase get loadDetailsUseCase;

  // Register other dependencies
  @lazySingleton
  NetworkInfoImpl get networkInfo;
}

@module
abstract class RegisterModule {
  @lazySingleton
  dio.Dio get httpClient => dio.Dio();
  @lazySingleton
  HiveInterface get hive => Hive;
  @lazySingleton
  http.Client get client => http.Client();
  @lazySingleton
  InternetConnectionChecker get internetConnectionChecker =>
      InternetConnectionChecker();
}

final getIT = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async => await getIT.init();

class $RegisterModule extends RegisterModule {}
