import 'package:dartz/dartz.dart';
import '../../../../core/failure/exception.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entity/food.dart';
import '../../domain/repository/food_repository.dart';
import '../data_sources/food_remote_data_source.dart';
import '../model/food_model.dart';

class FoodRepositoryImpl implements FoodRepository {
  final NetworkInfo networkInfo;
  final FoodRemoteDataSource remoteDataSource;
  FoodRepositoryImpl(
      {required this.networkInfo, required this.remoteDataSource});
  @override
  Future<Either<Failure, FoodModel>> getFoodsList(String category) async {
    return await _getFoodsRemote(category);
  }

  Future<Either<Failure, FoodModel>> _getFoodsRemote(String category) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteFoods = await remoteDataSource.getfoods(category);
        return Right(remoteFoods);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}

