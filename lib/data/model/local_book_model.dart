import 'package:hive/hive.dart';

part 'local_book_model.g.dart';
@HiveType(typeId: 1)
class LocalBookModel extends HiveObject {
  @HiveField(0)
  late String title;

  @HiveField(1)
  late String category;

  @HiveField(2)
  late String summary;

  @HiveField(3)
  late String review;
}
