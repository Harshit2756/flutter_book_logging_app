import 'package:book_logging_app/data/api_endpoints.dart';
import 'package:book_logging_app/data/model/category_model.dart';
import 'package:flutter/material.dart';

import '../data/model/book_model.dart';
import '../data/service/network_api_services.dart';

class AddBookController extends ChangeNotifier {
  AddBookController({required this.apiServices}) {
    fetchCategories();
  }

  NetworkApiService apiServices;
  List<CategoryModel> categories = [];
  List<BookModel> books = [];
  CategoryModel? selectedCategory;
  BookModel? selectedBook;
  bool isLoadingCategories = false;
  bool isLoadingBooks = false;
  final formKey = GlobalKey<FormState>();
  String? bookSummary;
  TextEditingController reviewController = TextEditingController();

  Future<void> fetchCategories() async {
    isLoadingCategories = true;
    notifyListeners();
    try {
      final response =
          await apiServices.getApiResponse(url: ApiEndPoints.getBookCategory);
      categories = (response as List)
          .map((json) => CategoryModel.fromJson(json))
          .toList();
    } finally {
      isLoadingCategories = false;
      notifyListeners();
    }
  }

  Future<void> fetchBooks(String categoryId) async {
    isLoadingBooks = true;
    notifyListeners();
    try {
      final response = await apiServices.getApiResponse(
          url: '${ApiEndPoints.getBookDetailsById}$categoryId');
      books =
          (response as List).map((json) => BookModel.fromJson(json)).toList();
    } finally {
      isLoadingBooks = false;
      notifyListeners();
    }
  }

  void selectCategory(CategoryModel category) {
    selectedCategory = category;
    selectedBook = null;
    fetchBooks(category.id!);
  }

  void selectBook(BookModel selectedBook) {
    selectedBook = selectedBook;
    final bookSum = books
        .firstWhere((book) => book.id.toString() == selectedBook.id.toString());
    bookSummary = bookSum.summary;
    notifyListeners();
  }

  void saveBook() {
    // Save book entry in local storage
  }
}
