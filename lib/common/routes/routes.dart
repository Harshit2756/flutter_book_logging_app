import 'package:flutter/material.dart';

import '../../view/collection_view/collection_view.dart';
import '../../view/home_view/home_view.dart';
import 'routes_name.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.homeview:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case RoutesName.collectionView:
        return MaterialPageRoute(builder: (_) => const CollectionView());

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }
}
