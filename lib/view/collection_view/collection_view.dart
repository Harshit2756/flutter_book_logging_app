import 'package:flutter/material.dart';

import 'widgets/book_card.dart';

class CollectionView extends StatelessWidget {
  const CollectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Collection"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.delete),
            color: Colors.red,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return BookCard(
            category: 'asd',
            bookName: 'asdsa',
            summury:
                'asdsasd asda sd asdasd asd asd asd asdasd asdad asdasdasd asd sd asd asd asd asdasssssssssssssssssssssssssssssssssssssssssssssss',
            review: 'asdasdasd',
            onDelete: () {},
            onEdit: () {},
          );
        },
      ),
    );
  }
}
