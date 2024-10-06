import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/widgets/button.dart';
import '../../../controller/add_book_controller.dart';
import '../../../data/model/book_model.dart';
import '../../../data/model/category_model.dart';
import '../../../utils/contants/sizes.dart';

class AddBookForm extends StatelessWidget {
  const AddBookForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AddBookController>(builder: (context, controller, child) {
      return Form(
        key: controller.formKey,
        child: Column(
          children: [
            controller.isLoadingCategories
                ? const CircularProgressIndicator()
                : DropdownButtonFormField<CategoryModel>(
                    decoration: const InputDecoration(
                      labelText: 'Category',
                      border: OutlineInputBorder(),
                    ),
                    value: controller.selectedCategory,
                    items: controller.categories.map((category) {
                      return DropdownMenuItem<CategoryModel>(
                        value: category,
                        child: Text(category.category!),
                      );
                    }).toList(),
                    onChanged: (category) {
                      if (category != null) {
                        controller.selectCategory(category);
                      }
                    },
                  ),
            const SizedBox(height: 16),
            // Book Dropdown
            controller.isLoadingBooks
                ? const CircularProgressIndicator()
                : DropdownButtonFormField<BookModel>(
                    decoration: const InputDecoration(
                      labelText: 'Book',
                      border: OutlineInputBorder(),
                    ),
                    value: controller.selectedBook,
                    items: controller.books.map((book) {
                      return DropdownMenuItem<BookModel>(
                        value: book,
                        child: Text(book.title),
                      );
                    }).toList(),
                    onChanged: controller.selectedCategory != null
                        ? (book) {
                            if (book != null) {
                              controller.selectBook(book);
                            }
                          }
                        : null,
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
              maxLines: 2,
              controller: TextEditingController(text: controller.bookSummary),
            ),

            const SizedBox(height: HSizes.spaceBtwItems),
            TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                labelText: 'Type your review',
                hintText: 'Type your review',
              ),
              maxLines: 5,
              controller: controller.reviewController,
            ),
            const SizedBox(height: HSizes.defaultSpace),
            AppButton(
              text: "Add Book",
              isPadding: false,
              onPressed: () {
                controller.saveBook();
              },
            ),
          ],
        ),
      );
    });
  }
}
