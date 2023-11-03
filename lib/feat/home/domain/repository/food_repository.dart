import 'package:dartz/dartz.dart';
import '../../../../core/failure/failure.dart';
import '../../data/model/food_model.dart';

abstract class FoodRepository {
  Future<Either<Failure,FoodModel>> getFoodsList(String category);
}
 