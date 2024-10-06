import 'package:flutter/material.dart';

import '../../../common/widgets/button.dart';
import '../../../utils/contants/sizes.dart';

class AddBookBottomSHeet extends StatelessWidget {
  const AddBookBottomSHeet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Add New Book',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: HSizes.defaultSpace),
            Form(
              child: Column(
                children: [
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      labelText: 'Category',
                    ),
                    items: ['Fiction', 'Non-Fiction', 'Sci-Fi', 'Fantasy']
                        .map((category) => DropdownMenuItem<String>(
                              value: category,
                              child: Text(category),
                            ))
                        .toList(),
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: HSizes.spaceBtwItems),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      labelText: 'Book Name',
                    ),
                    items: ['Book 1', 'Book 2', 'Book 3']
                        .map((book) => DropdownMenuItem<String>(
                              value: book,
                              child: Text(book),
                            ))
                        .toList(),
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: HSizes.spaceBtwItems),
                  TextField(
                    enabled: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      labelText: 'Details',
                    ),
                    maxLines: 1,
                  ),
                  const SizedBox(height: HSizes.spaceBtwItems),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      labelText: 'Type your review',
                      hintText: 'Type your review',
                    ),
                    maxLines: 5,
                  ),
                  const SizedBox(height: HSizes.defaultSpace),
                  AppButton(
                      text: "Add Book", isPadding: false, onPressed: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
