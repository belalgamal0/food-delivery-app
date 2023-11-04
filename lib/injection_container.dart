import 'package:dio/dio.dart';
import 'package:food_delivery/feat/product_details/data/data_source/details_data_source.dart';
import 'package:food_delivery/feat/product_details/data/repository/details_repository_impl.dart';
import 'package:food_delivery/feat/product_details/domain/repository/details_repository.dart';
import 'package:food_delivery/feat/product_details/domain/usecase/load_details_usecase.dart';
import 'package:food_delivery/feat/product_details/presentation/bloc/details_bloc.dart';
import 'feat/basket/presentation/bloc/basket_bloc.dart';
import 'feat/categories/data/repository/categories_repository_impl.dart';
import 'feat/categories/domain/repository/categories_repository.dart';
import 'feat/categories/domain/usecase/get_categories_usecase.dart';
import 'feat/favorites/data/datasources/favorite_local_datasource.dart';
import 'feat/favorites/data/repository/favorite_repository_impl.dart';
import 'feat/favorites/domain/repository/favorite_repository.dart';
import 'feat/favorites/domain/usecase/favorite_usecase.dart';
import 'feat/favorites/domain/usecase/is_cached_usecase.dart';
import 'feat/favorites/presentation/bloc/favorite_bloc.dart';
import 'feat/home/data/data_sources/food_remote_data_source.dart';
import 'feat/home/data/repository/food_repository_impl.dart';
import 'feat/home/domain/repository/food_repository.dart';
import 'feat/home/domain/usecase/get_foods_usecase.dart';
import 'feat/home/presentation/bloc/home_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:hive/hive.dart';
import 'package:get_it/get_it.dart';
import 'core/network/network_info.dart';
import 'package:http/http.dart' as http;
final services = GetIt.instance;
Future<void> init() async {
  //! Features: Get foods - Set favorite - Add to basket
  // Bloc
  services.registerFactory(
    () => HomeBloc(services(),services()),
  );
  services.registerFactory(
    () => BasketBloc(),
  );

  services.registerFactory(
    () => FavoriteBloc(services(), services()),
  );
    services.registerFactory(
    () => DetailsBloc(services()),
  );

  // Use cases
  services.registerLazySingleton(() => GetFoodsUseCase(services()));
  services.registerLazySingleton(() => GetCategories(services()));
  services.registerLazySingleton(() => FavoritesFoodUseCase(services()));
  services.registerLazySingleton(() => IsCachedUseCase(services()));
  services.registerLazySingleton(() => LoadDetailsUseCase(services()));

  // Repository
  services.registerLazySingleton<FoodRepository>(
    () => FoodRepositoryImpl(networkInfo: services(), remoteDataSource: services()),
  );
  services.registerLazySingleton<DetailsRepository>(
    () => DetailsRepositoryImpl(services()),
  );
    services.registerLazySingleton<CategoriesRepository>(
    () => CategoriesRepositoryImpl(),
  );

  services.registerLazySingleton<FavoriteRepository>(
    () => FavoriteRepositoryImpl(favoritesLocalDataSource: services()),
  );

  // Data sources
  services.registerLazySingleton<FoodRemoteDataSource>(
    () => FoodRemoteDataSourceImpl(client: services()),
  );
    services.registerLazySingleton<DetailsRemoteDataSource>(
    () => DetailsRemoteDataSourceImpl(client: services()),
  );
  services.registerLazySingleton<FavoritesLocalDataSource>(
    () => FavoritesLocalDataSourceImpl(hive: services()),
  );


  //! Core
  services.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(services()));

  //! External
  services.registerLazySingleton<HiveInterface>(() => Hive);
  services.registerLazySingleton(() => Dio());
  services.registerLazySingleton(() => http.Client());
  services.registerLazySingleton(() => InternetConnectionChecker());
}
