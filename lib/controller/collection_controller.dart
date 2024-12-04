import 'package:flutter/material.dart';
import 'package:book_logging_app/data/service/hive_service.dart';
import 'package:book_logging_app/data/model/collection_model.dart';
import 'package:book_logging_app/data/model/local_book_model.dart';

class CollectionController extends ChangeNotifier {
  final HiveService _hiveService = HiveService();
  List<CollectionModel> _collections = [];
  int _selectedCollectionIndex = 0;

  List<CollectionModel> get collections => _collections;
  CollectionModel get selectedCollection =>
      _collections[_selectedCollectionIndex];

  Future<void> loadCollections() async {
    _collections = await _hiveService.getAllCollections();
    notifyListeners();
  }

  Future<void> createCollection(String name) async {
    await _hiveService.createCollection(name);
    await loadCollections();
  }

  void selectCollection(int index) {
    _selectedCollectionIndex = index;
    notifyListeners();
  }

  Future<void> addBookToCollection(LocalBookModel book) async {
    await _hiveService.addBookToCollection(_selectedCollectionIndex, book);
    await loadCollections();
  }

  Future<void> updateBook(int bookIndex, LocalBookModel updatedBook) async {
    await _hiveService.updateBook(
        _selectedCollectionIndex, bookIndex, updatedBook);
    await loadCollections();
  }

  Future<void> deleteBook(int bookIndex) async {
    await _hiveService.deleteBook(_selectedCollectionIndex, bookIndex);
    await loadCollections();
  }

  Future<void> deleteCollection() async {
    await _hiveService.deleteCollection(_selectedCollectionIndex);
    _selectedCollectionIndex = 0;
    await loadCollections();
  }
}
