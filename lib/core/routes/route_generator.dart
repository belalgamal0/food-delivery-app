import 'package:flutter/material.dart';
import '../../feat/home/data/model/food_model.dart';
import '../../feat/master/presentation/pages/master_page.dart';
import '../../feat/product_details/presentation/pages/food_details_page.dart';


class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const MasterPage());
      case '/foodDetailsPage':
        if (args is Recipe) {
          return MaterialPageRoute(
            builder: (_) => FoodDetailsPage(
              recipe: args
            ),
          );
        }
        return _errorRoute();
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Error'),
          ),
          body: const Center(
            child: Text('ERROR'),
          ),
        );
      },
    );
  }
}