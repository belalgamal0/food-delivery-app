import 'package:dartz/dartz.dart';
import 'package:food_delivery/features/product_details/data/food_details_model.dart';

import '../../../../core/failure/failure.dart';
import '../repository/details_repository.dart';

class LoadDetailsUseCase{
  final DetailsRepository detailsRepository;
  LoadDetailsUseCase(this.detailsRepository);

  Future<Either<Failure, FoodDetailsModel>> call(String id) async {
    return await detailsRepository.getFoodDetails(id);
  }
}