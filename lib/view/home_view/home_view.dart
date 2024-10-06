import 'package:flutter/material.dart';

import '../../common/routes/routes_name.dart';
import '../../common/widgets/button.dart';
import '../../utils/formatters/formatter.dart';
import 'widgets/app_bar.dart';
import 'widgets/collection_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const AppBarHeader(),
          Expanded(
            child: ListView.separated(
              itemCount: 3,
              separatorBuilder: (context, index) {
                return const SizedBox(height: 10);
              },
              itemBuilder: (context, index) {
                return CollectionCard(
                    collecionName: index,
                    noOfBook: index,
                    date: HFormatter.formatDate(DateTime.now()));
              },
            ),
          ),
          AppButton(
            text: 'Create a new collection',
            onPressed: () {
              Navigator.pushNamed(context, RoutesName.collectionView);
            },
          )
        ],
      ),
    );
  }
}
