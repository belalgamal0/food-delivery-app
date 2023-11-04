// import 'package:equatable/equatable.dart';
// import 'package:food_delivery/features/product_details/data/food_details_model.dart';

// enum DetailsStatus { initial,loading, loadedSuccessfully, error }


// class AuthenticationState extends Equatable {
//   const AuthenticationState._({
//     this.status = DetailsStatus.initial,
//      required this.foodDetailsModel
//     // this.foodDetailsModel= FoodDetailsModel();
//     // this.user = User.empty,
//   });
//   // const AuthenticationState.unknown() : this._();

//   const AuthenticationState.authenticated(FoodDetailsModel user)
//       : this._(status: DetailsStatus.loadedSuccessfully, foodDetailsModel: user);

//   // const AuthenticationState.unauthenticated()
//   //     : this._(status: AuthenticationStatus.unauthenticated);

//   final DetailsStatus status;
//   final FoodDetailsModel foodDetailsModel;

//   @override
//   List<Object> get props => [status, foodDetailsModel];
// }
import 'package:equatable/equatable.dart';

import '../../data/food_details_model.dart';

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


