import 'package:book_logging_app/data/model/local_book_model.dart';
import 'package:hive/hive.dart';
import '../model/collection_model.dart';

class HiveService {
  static const String collectionsBoxName = 'collections';

  // Create a new collection
  Future<void> createCollection(String name) async {
    final box = await Hive.openBox<CollectionModel>(collectionsBoxName);
    final collection = CollectionModel()
      ..name = name
      ..books = HiveList(box);
    await box.add(collection);
  }

  // Add a book to a collection
  Future<void> addBookToCollection(
      int collectionIndex, LocalBookModel book) async {
    final box = await Hive.openBox<CollectionModel>(collectionsBoxName);
    final collection = box.getAt(collectionIndex);
    if (collection != null) {
      collection.books.add(book);
      await collection.save();
    }
  }

  // Get all collections
  Future<List<CollectionModel>> getAllCollections() async {
    final box = await Hive.openBox<CollectionModel>(collectionsBoxName);
    return box.values.toList();
  }

  // Update a book
  Future<void> updateBook(
      int collectionIndex, int bookIndex, LocalBookModel updatedBook) async {
    final box = await Hive.openBox<CollectionModel>(collectionsBoxName);
    final collection = box.getAt(collectionIndex);
    if (collection != null) {
      collection.books[bookIndex] = updatedBook;
      await collection.save();
    }
  }

  // Delete a book
  Future<void> deleteBook(int collectionIndex, int bookIndex) async {
    final box = await Hive.openBox<CollectionModel>(collectionsBoxName);
    final collection = box.getAt(collectionIndex);
    if (collection != null) {
      collection.books.removeAt(bookIndex);
      await collection.save();
    }
  }

  // Delete a collection
  Future<void> deleteCollection(int collectionIndex) async {
    final box = await Hive.openBox<CollectionModel>(collectionsBoxName);
    await box.deleteAt(collectionIndex);
  }
}
