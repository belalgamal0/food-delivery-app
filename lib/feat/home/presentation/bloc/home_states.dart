// import 'package:food_delivery/features/home/data/model/food_model.dart';

import '../../data/model/food_model.dart';
import '../../domain/entity/food.dart';
import 'home_bloc.dart';

abstract class HomeState {}
class HomeInitalState extends HomeState {}
class FoodLoadingState extends HomeState {}
class FoodCategoriesLoadingState extends HomeState {}
class FoodCategoriesSuccessState extends HomeState {}
class CategorySelectingState extends HomeState {}

class CategorySelectedState extends HomeState {}
class FoodLoadedState extends HomeState {
  final FoodModel foodModel;
  FoodLoadedState({required this.foodModel});
  List<Object> get props => [foodModel];
}
class FoodLoadedSccessState extends HomeState {
  final FoodModel foodModel;
  FoodLoadedSccessState({required this.foodModel});
  List<Object> get props => [foodModel];
}

class FoodsErrorState extends HomeState {
  final String message;
  FoodsErrorState({required this.message});
  List<Object> get props => [message];
}