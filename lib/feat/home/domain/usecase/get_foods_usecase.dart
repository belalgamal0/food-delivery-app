import 'package:dartz/dartz.dart';
import '../../data/model/food_model.dart';
import '../../presentation/bloc/home_bloc.dart';
import '../entity/food.dart';
import '../repository/food_repository.dart';
import '../../../../core/failure/failure.dart';


class GetFoodsUseCase {
  final FoodRepository foodRepository;
  GetFoodsUseCase(this.foodRepository);

  Future<Either<Failure, FoodModel>> call(String category) async {
    return await foodRepository.getFoodsList(category);
  }
}