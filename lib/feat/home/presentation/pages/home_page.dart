
import '../widgets/loading_widget.dart';
import '../bloc/home_states.dart';
import '../widgets/category_widget.dart';
import 'package:food_delivery/injection_container.dart' as di;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_events.dart';
import '../widgets/home_food_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => di.services<HomeBloc>()..add(GetCategoriesEvent()),
        child: BlocBuilder<HomeBloc, HomeState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: BlocProvider.of<HomeBloc>(context).loadedCategories.length,
                      itemBuilder: (context, index) => CategoryWidget(
                        categoryName: BlocProvider.of<HomeBloc>(context).loadedCategories[index].name,
                        isSelected: BlocProvider.of<HomeBloc>(context).selectedCategoryIndex == index,
                        buttonAction: () async {
                          if(context.read<HomeBloc>().selectedCategoryIndex != index){
                            context.read<HomeBloc>().add(SelectCategoryEvent(categoryIndex: index));
                            BlocProvider.of<HomeBloc>(context).add(LoadFoodEvent(categoryName: BlocProvider.of<HomeBloc>(context).loadedCategories[index].name));
                          }
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Builder(builder: (context) {
                    if(state.status == HomeStatus.loadingFood){
                      return const LoadingWidget();
                    }else if (state.status == HomeStatus.loadedFood){
                      return Expanded(flex: 15,child: ListView.builder(itemCount: state.foodModel!.recipes!.length,itemBuilder: (context, index) => 
                   HomeFoodWidget(foodModel: state.foodModel!.recipes![index],foodCategory: BlocProvider.of<HomeBloc>(context).loadedCategories[BlocProvider.of<HomeBloc>(context).selectedCategoryIndex!].name),
                   ) );
                    }else {
                      return const Center(child: Text("Please select category"));
                    }
                  },),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
