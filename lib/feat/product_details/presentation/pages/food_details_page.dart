import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/feat/product_details/data/food_details_model.dart';
import '../../../../core/theme/app_text_theme.dart';
import '../bloc/details_bloc.dart';
import '../bloc/details_event.dart';
import '../bloc/details_states.dart';
import '../widgets/ingredients_widget.dart';
import 'package:food_delivery/injection_container.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';


class FoodDetailsPage extends StatelessWidget {
  final Recipe recipe;
  const FoodDetailsPage({super.key,required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => di.services<DetailsBloc>()..add(LoadDetailsEvent(id: recipe.recipeId.toString())),
        child: BlocBuilder<DetailsBloc, DetailsState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            return Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(imageUrl: recipe.imageUrl.toString()),
              const SizedBox(height: 15),
              // Center(
              //     child: Text(foodEntity.name.toString(),
              //         style: AppTextTheme.black17Bold),
              // ),
              const SizedBox(height: 5),
              Text(
                "${recipe.title} ingredients:",
                style: AppTextTheme.black14Bold,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: recipe.ingredients!.isEmpty
                    ? const Text("Ingredients is not available for this product.")
                    : IngredientsWidget(ingredients: recipe.ingredients),
              ),
              const SizedBox(height: 5),
              // Text(foodEntity.spicy == true ? "Spicy" : "Not Spicy", style: AppTextTheme.black14Bold),          
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
//   final Recipe foodEntity;
//   const FoodDetailsPage({super.key, required this.foodEntity});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(foodEntity.title.toString())),
//       body: Container(
//         padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
//         child: Center(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               CachedNetworkImage(imageUrl: foodEntity.imageUrl.toString()),
//               const SizedBox(height: 15),
//               // Center(
//               //     child: Text(foodEntity.name.toString(),
//               //         style: AppTextTheme.black17Bold),
//               // ),
//               const SizedBox(height: 5),
//               Text(
//                 "${foodEntity.title} ingredients:",
//                 style: AppTextTheme.black14Bold,
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 10),
//                 child: foodEntity.ingredients!.isEmpty
//                     ? const Text("Ingredients is not available for this product.")
//                     : IngredientsWidget(ingredients: foodEntity.ingredients),
//               ),
//               const SizedBox(height: 5),
//               // Text(foodEntity.spicy == true ? "Spicy" : "Not Spicy", style: AppTextTheme.black14Bold),          
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
