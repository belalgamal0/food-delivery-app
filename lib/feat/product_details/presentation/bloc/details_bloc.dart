import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/failure/failure.dart';
import '../../data/model/food_details_model.dart';
import '../../domain/usecase/load_details_usecase.dart';
import 'details_states.dart';

import 'details_event.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  final LoadDetailsUseCase loadDetails;

  DetailsBloc(this.loadDetails) : super(const DetailsState.initial()) {
    on<LoadDetailsEvent>(_loadDetails);
  }
  void _loadDetails(LoadDetailsEvent event, Emitter<DetailsState> emit) async {
    emit(DetailsState.loading());
    final modelOrError = await loadDetails(event.id);
    _eitherLoadedOrErrorState(modelOrError, emit);
  }

  _eitherLoadedOrErrorState(Either<Failure, FoodDetailsModel> failureOrFoodList,
      Emitter<DetailsState> emit) async {
    failureOrFoodList.fold(
      (l) => emit(DetailsState.error(_mapFailureToMessage(l))),
      (foodList) => emit(DetailsState.loaded(foodList)),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return "SERVER_FAILURE_MESSAGE";
      case CacheFailure:
        return "CACHE_FAILURE_MESSAGE";
      default:
        return 'Unexpected error';
    }
  }
}
