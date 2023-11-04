import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../categories/domain/entity/category.dart';
import '../../../favorites/presentation/bloc/favorite_state.dart';
import '../../domain/usecase/get_foods_usecase.dart';
import '../../../categories/domain/usecase/get_categories_usecase.dart';
import '../../data/model/food_model.dart';
import 'home_events.dart';
import 'home_states.dart';
import '../../../../core/failure/failure.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetFoodsUseCase getFoodsUseCase;
  final GetCategories getCategories;
  HomeBloc(this.getFoodsUseCase, this.getCategories)
      : super(HomeInitalState()) {
    on<GetCategoriesEvent>(_loadCategories);
    on<LoadFoodEvent>(_onLoadFood);
    on<SelectCategoryEvent>(_onSelectCategory);
  }
  List<Category> _loadedCategories = [];

  int? selectedCategoryIndex ;
  List<Category> get loadedCategories => _loadedCategories;

  void _loadCategories(
      GetCategoriesEvent event, Emitter<HomeState> emit) async {
    emit(FoodCategoriesLoadingState());
    _loadedCategories = await getCategories();
    emit(FoodCategoriesSuccessState());

    emit(CategorySelectedState());
  }

  void _onSelectCategory(
      SelectCategoryEvent event, Emitter<HomeState> emit) async {
    emit(CategorySelectingState());
    selectedCategoryIndex = event.categoryIndex;
    emit(CategorySelectedState());
  }

  void _onLoadFood(LoadFoodEvent event, Emitter<HomeState> emit) async {
    emit(FoodLoadingState());
    final getFoodFeedback = await getFoodsUseCase(event.categoryName);
    _eitherLoadedOrErrorState(getFoodFeedback, emit);
  }

  _eitherLoadedOrErrorState(Either<Failure, FoodModel> failureOrFoodList,
      Emitter<HomeState> emit) async {
    failureOrFoodList.fold(
      (l) => emit(
          FoodsErrorState(message: "Failed to load data, Please try again!")),
      (foodList) => emit(FoodLoadedState(foodModel: foodList)),
    );
  }

  bool isFoodSetToFavorite(FavoriteState state) {
    bool isFavorite =
        state is DoneLoadingFavoriteCachingCachingState && state.isFoodCached;
    return isFavorite;
  }
}
