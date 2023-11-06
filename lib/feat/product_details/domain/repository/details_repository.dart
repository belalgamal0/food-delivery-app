import 'package:dartz/dartz.dart';
import '../../data/model/food_details_model.dart';
import '../../../../core/failure/failure.dart';

abstract class DetailsRepository {
  Future<Either<Failure,FoodDetailsModel>> getFoodDetails(String id);
}