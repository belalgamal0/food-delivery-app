import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/features/product_details/presentation/bloc/details_event.dart';
import 'package:food_delivery/features/product_details/presentation/bloc/details_states.dart';
import '../../../../core/theme/app_text_theme.dart';
import '../../../home/data/model/food_model.dart';
import '../../../home/domain/entity/food.dart';
import '../../../home/presentation/bloc/home_bloc.dart';
import '../bloc/details_bloc.dart';
import '../widgets/ingredients_widget.dart';
import 'dart:developer';

import '../../../../core/api_provider/utils.dart';
import '../../../../core/extensions/extentions.dart';
import 'package:food_delivery/injection_container.dart' as di;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class DetailsPage extends StatelessWidget {
  final Recipe recipe;
  const DetailsPage({super.key,required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => di.services<DetailsBloc>()..add(LoadDetailsEvent(id: recipe.recipeId.toString())),
        child: BlocBuilder<DetailsBloc, DetailsState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            log("state has been update to $state");
            // if(state.s){
            //   return Center(child: CircularProgressIndicator.adaptive());
            // }
            // else if(state == DetailsStatus.error){
            //   return Center(child: Text("failed"));
            // }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 100),
                  Center(child: Text(state.toString())),
 ElevatedButton(onPressed: (){
  log(recipe.recipeId.toString());
  di.services<DetailsBloc>()..add(LoadDetailsEvent(id: recipe.recipeId.toString()));
 }, child: Text("click"))
           
                  // Expanded(flex: 15,child: Container())
                  // Expanded(
                  //   flex: 15,
                  //   child: Builder(
                  //     builder: (context) {
                  //       if(state is FoodLoadedState){
                  //        return ListView.builder(
                  //                itemCount: state.foodList.length,
                  //                itemBuilder: (context, index) => Padding(
                  //                      padding: const EdgeInsets.all(8.0),
                  //                      child: GestureDetector(
                  //                          onTap: () {
                  //                            Navigator.of(context).pushNamed('/foodDetailsPage', arguments: state.foodList[index]);
                  //                          },
                  //                          child: Text("")
                  //                   //        HomeFoodWidget(
                  //                   //            foodCategory: 
                  //                   //            Utils.categories[context.read<HomeBloc>().selectedCategoryIndex!.toInt()],
                  //                   //            foodModel: state.foodList[index].,
                  //                   //  ),
                  //                  ),
                  //                ),
                  //              );
                  //        } else if (state is FoodLoadingState) {
                  //       return const LoadingWidget();
                  //     } else if (state is FoodsErrorState) {
                  //       return HomeEmptyFoodList(widgetText: state.message);
                  //     } else {
                  //       return const HomeEmptyFoodList(widgetText: "Please select a category");
                  //     }
                  //   },
                  //   ),
                  // ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}




// class FoodDetailsPage extends StatelessWidget {
//   final Food foodEntity;
//   const FoodDetailsPage({super.key, required this.foodEntity});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(foodEntity..toString())),
//       body: Container(
//         padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
//         child: Center(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               CachedNetworkImage(imageUrl: foodEntity.image.toString()),
//               const SizedBox(height: 15),
//               Center(
//                   child: Text(foodEntity.name.toString(),
//                       style: AppTextTheme.black17Bold),
//               ),
//               const SizedBox(height: 5),
//               Text(
//                 "${foodEntity.name} ingredients:",
//                 style: AppTextTheme.black14Bold,
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 10),
//                 child: foodEntity.ingredients!.isEmpty
//                     ? const Text("Ingredients is not available for this product.")
//                     : IngredientsWidget(ingredients: foodEntity.ingredients),
//               ),
//               const SizedBox(height: 5),
//               Text(foodEntity.spicy == true ? "Spicy" : "Not Spicy", style: AppTextTheme.black14Bold),          
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
