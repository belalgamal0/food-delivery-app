import 'package:dartz/dartz.dart';
import 'package:food_delivery/core/failure/failure.dart';
import 'package:food_delivery/features/product_details/data/food_details_model.dart';
import 'package:food_delivery/features/product_details/domain/repository/details_repository.dart';

import '../../../../core/failure/exception.dart';
import '../data_source/details_data_source.dart';

class DetailsRepositoryImpl implements DetailsRepository{
  final DetailsRemoteDataSource remoteDatasource;
  DetailsRepositoryImpl(this.remoteDatasource);
  @override
  Future<Either<Failure, FoodDetailsModel>> getFoodDetails(String id) async{
        return await _getFoodDetailsRemote(id);

  }
    Future<Either<Failure, FoodDetailsModel>> _getFoodDetailsRemote(String id) async {
    // if (await networkInfo.isConnected) {
      try {
        final remoteFoods = await remoteDatasource.getfoodDetails(id);
        return Right(remoteFoods);
      } on ServerException {
        return Left(ServerFailure());
      }
    // } else {
    //   return Left(ServerFailure());
    // }
  }
}