import '../../../home/data/model/food_model.dart';
import '../../../home/domain/entity/food.dart';
import '../../../home/presentation/bloc/home_bloc.dart';

class CartItem {
  int quantity;
  final Recipe foodEntity;
  CartItem({required this.quantity, required this.foodEntity});
}
