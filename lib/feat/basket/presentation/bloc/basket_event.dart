import '../../../home/data/model/food_model.dart';
import '../../../home/domain/entity/food.dart';
import '../../../home/presentation/bloc/home_bloc.dart';

abstract class BasketEvent {}

class UpdateBasketEvent extends BasketEvent {
  final Recipe foodEntity;
  UpdateBasketEvent(this.foodEntity);
}
