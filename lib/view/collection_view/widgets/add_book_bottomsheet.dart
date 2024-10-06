import 'package:book_logging_app/utils/contants/sizes.dart';
import 'package:book_logging_app/view/collection_view/widgets/add_book_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/add_book_controller.dart';
import '../../../data/service/network_api_services.dart';

class AddBookBottomSheet extends StatelessWidget {
  const AddBookBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AddBookController(apiServices: NetworkApiService()),
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Add New Book',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                ),
              ),
              AddBookForm(),
              SizedBox(height: HSizes.defaultSpace),
            ],
          ),
        ),
      ),
    );
  }
}
