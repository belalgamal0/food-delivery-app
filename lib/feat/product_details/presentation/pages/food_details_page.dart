import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/feat/home/presentation/widgets/loading_widget.dart';
import 'package:get_it/get_it.dart';
import '../../../../core/theme/app_text_theme.dart';
import '../../../home/data/model/food_model.dart';
import '../bloc/details_bloc.dart';
import '../bloc/details_event.dart';
import '../bloc/details_states.dart';
import '../widgets/ingredients_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoodDetailsPage extends StatelessWidget {
  final Recipe recipe;
  const FoodDetailsPage({super.key,required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(recipe.title!)),
      body: BlocProvider(
        create: (_) => GetIt.instance.get<DetailsBloc>()..add(LoadDetailsEvent(id: recipe.recipeId.toString())),
        child: BlocBuilder<DetailsBloc, DetailsState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            if(state == const DetailsState.loading()){
              return const Center(child: LoadingWidget(),);
            }else if(state.status == DetailsStatus.loaded){
              return   Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(imageUrl: recipe.imageUrl.toString()),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "${recipe.title} ingredients:",
                  style: AppTextTheme.black14Bold,
                ),
              ),
              state.foodDetailsModel!.recipe!.ingredients!.isEmpty
                  ? const Text("Ingredients is not available for this product.")
                  : IngredientsWidget(ingredients: state.foodDetailsModel!.recipe!.ingredients!),
              const SizedBox(height: 5),
            ],
          ),
        );
            }else{
              return Center(child: Text("Please try again later"),) ;
            }
        
          },
        ),
      ),
    );
  }
}
