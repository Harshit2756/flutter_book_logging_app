import 'package:book_logging_app/data/api_endpoints.dart';
import 'package:book_logging_app/data/model/category_model.dart';
import 'package:flutter/material.dart';

import '../data/model/book_model.dart';
import '../data/model/local_book_model.dart';
import '../data/service/hive_service.dart';
import '../data/service/network_api_services.dart';

class AddBookController extends ChangeNotifier {
  AddBookController({required this.apiServices}) {
    fetchCategories();
  }

  NetworkApiService apiServices;
  HiveService hiveService = HiveService();
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

  Future<void> saveBook() async {
    if (selectedBook != null && reviewController.text.isNotEmpty) {
      final localBook = LocalBookModel()
        ..title = selectedBook!.title
        ..category = selectedCategory!.category!
        ..summary = selectedBook!.summary
        ..review = reviewController.text;
      hiveService.addBookToCollection(0, localBook);
      notifyListeners();
    }
  }
}
