import 'package:flutter/material.dart';

import '../../utils/contants/colors.dart';
import 'widgets/review_bottom_sheet.dart';

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
      body: Center(
        child: TextButton.icon(
          icon: const Icon(Icons.add),
          label: const Text('Add Your First Book'),
          style: ElevatedButton.styleFrom(
            foregroundColor: HColors.mainColor,
            textStyle:
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (BuildContext context) {
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: const ReviewBottomaSheet(),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
