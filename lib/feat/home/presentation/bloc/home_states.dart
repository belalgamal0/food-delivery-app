import 'package:equatable/equatable.dart';
import '../../data/model/food_model.dart';
enum HomeStatus {
  initial,
  loadingCategories,
  loadedCategories,
  selectingCategory,
  selectedCategory,
  loadingFood,
  loadedFood,
  error
}

class HomeState extends Equatable {
  const HomeState._({
    this.status = HomeStatus.initial,
    this.foodModel,
    this.errorMessage,
  });

  const HomeState.initial() : this._();
  const HomeState.loadingCategories() : this._(status: HomeStatus.loadingCategories);
  const HomeState.loadedCategories() : this._(status: HomeStatus.loadedCategories);
  const HomeState.selectingCategory() : this._(status: HomeStatus.selectingCategory);
  const HomeState.selectedCategory() : this._(status: HomeStatus.selectedCategory);
  const HomeState.loadingFood() : this._(status: HomeStatus.loadingFood);
  const HomeState.loadedFood(FoodModel foodModel)
      : this._(status: HomeStatus.loadedFood, foodModel: foodModel);
  const HomeState.error(String errorMessage)
      : this._(status: HomeStatus.error, errorMessage: errorMessage);
  final HomeStatus status;
  final FoodModel? foodModel;
  final String? errorMessage;

  @override
  List<Object?> get props => [status, foodModel, errorMessage];
}