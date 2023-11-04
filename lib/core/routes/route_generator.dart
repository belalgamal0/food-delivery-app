import 'package:flutter/material.dart';

import '../../feat/master/presentation/pages/master_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const MasterPage());
      case '/foodDetailsPage':
        // if (args is Food) {
        //   return MaterialPageRoute(
        //     // builder: (_) => FoodDetailsPage(
        //     //   foodEntity: args,
        //     // ),
        //   );
        }
        // return _errorRoute();
      // default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

   Route<dynamic> _errorRoute() {
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
  // }
}
