// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i10;
import 'package:food_delivery/core/network/network_info.dart' as _i16;
import 'package:food_delivery/feat/basket/presentation/bloc/basket_bloc.dart'
    as _i3;
import 'package:food_delivery/feat/categories/data/repository/categories_repository_impl.dart'
    as _i5;
import 'package:food_delivery/feat/categories/domain/repository/categories_repository.dart'
    as _i4;
import 'package:food_delivery/feat/categories/domain/usecase/get_categories_usecase.dart'
    as _i12;
import 'package:food_delivery/feat/favorites/data/datasources/favorite_local_datasource.dart'
    as _i18;
import 'package:food_delivery/feat/favorites/data/repository/favorite_repository_impl.dart'
    as _i24;
import 'package:food_delivery/feat/favorites/domain/repository/favorite_repository.dart'
    as _i23;
import 'package:food_delivery/feat/favorites/domain/usecase/favorite_usecase.dart'
    as _i25;
import 'package:food_delivery/feat/favorites/domain/usecase/is_cached_usecase.dart'
    as _i26;
import 'package:food_delivery/feat/favorites/presentation/bloc/favorite_bloc.dart'
    as _i27;
import 'package:food_delivery/feat/home/data/data_sources/food_remote_data_source.dart'
    as _i11;
import 'package:food_delivery/feat/home/data/repository/food_repository_impl.dart'
    as _i20;
import 'package:food_delivery/feat/home/domain/repository/food_repository.dart'
    as _i19;
import 'package:food_delivery/feat/home/domain/usecase/get_foods_usecase.dart'
    as _i21;
import 'package:food_delivery/feat/home/presentation/bloc/home_bloc.dart'
    as _i22;
import 'package:food_delivery/feat/product_details/data/data_source/details_data_source.dart'
    as _i7;
import 'package:food_delivery/feat/product_details/data/repository/details_repository_impl.dart'
    as _i9;
import 'package:food_delivery/feat/product_details/domain/repository/details_repository.dart'
    as _i8;
import 'package:food_delivery/feat/product_details/domain/usecase/load_details_usecase.dart'
    as _i15;
import 'package:food_delivery/feat/product_details/presentation/bloc/details_bloc.dart'
    as _i17;
import 'package:food_delivery/injection_container.dart' as _i28;
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive/hive.dart' as _i13;
import 'package:http/http.dart' as _i6;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i14;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule(this);
    final registerModule = _$RegisterModule();
    gh.factory<_i3.BasketBloc>(() => appModule.basketBloc);
    gh.factory<_i4.CategoriesRepository>(() => _i5.CategoriesRepositoryImpl());
    gh.lazySingleton<_i6.Client>(() => registerModule.client);
    gh.factory<_i7.DetailsRemoteDataSource>(
        () => _i7.DetailsRemoteDataSourceImpl(client: gh<_i6.Client>()));
    gh.factory<_i8.DetailsRepository>(
        () => _i9.DetailsRepositoryImpl(gh<_i7.DetailsRemoteDataSource>()));
    gh.lazySingleton<_i10.Dio>(() => registerModule.httpClient);
    gh.factory<_i11.FoodRemoteDataSource>(
        () => _i11.FoodRemoteDataSourceImpl(client: gh<_i10.Dio>()));
    gh.lazySingleton<_i12.GetCategories>(() => appModule.getCategories);
    gh.lazySingleton<_i13.HiveInterface>(() => registerModule.hive);
    gh.lazySingleton<_i14.InternetConnectionChecker>(
        () => registerModule.internetConnectionChecker);
    gh.lazySingleton<_i15.LoadDetailsUseCase>(
        () => appModule.loadDetailsUseCase);
    gh.factory<_i16.NetworkInfo>(
        () => _i16.NetworkInfoImpl(gh<_i14.InternetConnectionChecker>()));
    gh.lazySingleton<_i16.NetworkInfoImpl>(() => appModule.networkInfo);
    gh.factory<_i17.DetailsBloc>(() => appModule.detailsBloc);
    gh.factory<_i18.FavoritesLocalDataSource>(() =>
        _i18.FavoritesLocalDataSourceImpl(hive: gh<_i13.HiveInterface>()));
    gh.factory<_i19.FoodRepository>(() => _i20.FoodRepositoryImpl(
          networkInfo: gh<_i16.NetworkInfo>(),
          remoteDataSource: gh<_i11.FoodRemoteDataSource>(),
        ));
    gh.lazySingleton<_i21.GetFoodsUseCase>(() => appModule.getFoodsUseCase);
    gh.factory<_i22.HomeBloc>(() => appModule.homeBloc);
    gh.factory<_i23.FavoriteRepository>(() => _i24.FavoriteRepositoryImpl(
        favoritesLocalDataSource: gh<_i18.FavoritesLocalDataSource>()));
    gh.lazySingleton<_i25.FavoritesFoodUseCase>(
        () => appModule.favoritesFoodUseCase);
    gh.lazySingleton<_i26.IsCachedUseCase>(() => appModule.isCachedUseCase);
    gh.factory<_i27.FavoriteBloc>(() => appModule.favoriteBloc);
    return this;
  }
}

class _$AppModule extends _i28.AppModule {
  _$AppModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i3.BasketBloc get basketBloc => _i3.BasketBloc();

  @override
  _i12.GetCategories get getCategories =>
      _i12.GetCategories(_getIt<_i4.CategoriesRepository>());

  @override
  _i15.LoadDetailsUseCase get loadDetailsUseCase =>
      _i15.LoadDetailsUseCase(_getIt<_i8.DetailsRepository>());

  @override
  _i16.NetworkInfoImpl get networkInfo =>
      _i16.NetworkInfoImpl(_getIt<_i14.InternetConnectionChecker>());

  @override
  _i17.DetailsBloc get detailsBloc =>
      _i17.DetailsBloc(_getIt<_i15.LoadDetailsUseCase>());

  @override
  _i21.GetFoodsUseCase get getFoodsUseCase =>
      _i21.GetFoodsUseCase(_getIt<_i19.FoodRepository>());

  @override
  _i22.HomeBloc get homeBloc => _i22.HomeBloc(
        _getIt<_i21.GetFoodsUseCase>(),
        _getIt<_i12.GetCategories>(),
      );

  @override
  _i25.FavoritesFoodUseCase get favoritesFoodUseCase =>
      _i25.FavoritesFoodUseCase(_getIt<_i23.FavoriteRepository>());

  @override
  _i26.IsCachedUseCase get isCachedUseCase =>
      _i26.IsCachedUseCase(_getIt<_i23.FavoriteRepository>());

  @override
  _i27.FavoriteBloc get favoriteBloc => _i27.FavoriteBloc(
        _getIt<_i25.FavoritesFoodUseCase>(),
        _getIt<_i26.IsCachedUseCase>(),
      );
}

class _$RegisterModule extends _i28.RegisterModule {}
