import 'package:flutter/material.dart';

class IngredientsWidget extends StatelessWidget {
  final List<String>? ingredients;
  const IngredientsWidget({super.key, required this.ingredients});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: ingredients!.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Text(ingredients![index].toString()),
        ),
      ),
    );
  }
}
