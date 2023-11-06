import 'package:equatable/equatable.dart';
import '../../data/model/food_details_model.dart';

enum DetailsStatus {
  initial,
  loading,
  loaded,
  error,
}

class DetailsState extends Equatable {
  const DetailsState._({
    this.status = DetailsStatus.initial,
    this.foodDetailsModel,
    this.errorMessage,
  });

  const DetailsState.initial() : this._();

  const DetailsState.loading() : this._(status: DetailsStatus.loading);

  const DetailsState.loaded(FoodDetailsModel foodDetailsModel)
      : this._(status: DetailsStatus.loaded, foodDetailsModel: foodDetailsModel);

  const DetailsState.error(String errorMessage)
      : this._(status: DetailsStatus.error, errorMessage: errorMessage);

  final DetailsStatus status;
  final FoodDetailsModel? foodDetailsModel;
  final String? errorMessage;

  @override
  List<Object?> get props => [status, foodDetailsModel, errorMessage];
}


