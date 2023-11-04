import 'package:dartz/dartz.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/failure/exception.dart';
import '../../domain/repository/details_repository.dart';
import '../data_source/details_data_source.dart';
import '../food_details_model.dart';

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