import 'package:equatable/equatable.dart';

import '../../data/model/recipe_model.dart';

class Food extends Equatable {
  const Food({
    required this.count,
    required this.recipes,

  });

  final int count;
  final List<Recipe> recipes;

  @override
  List<Object?> get props =>
      [count, recipes];
}
