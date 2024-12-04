import 'package:hive/hive.dart';
import 'local_book_model.dart';
part 'collection_model.g.dart';


@HiveType(typeId: 0)
class CollectionModel extends HiveObject {
  @HiveField(0)
  late String name;

  @HiveField(1)
  late HiveList<LocalBookModel> books;
}
