import 'package:book_logging_app/controller/add_book_controller.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../data/service/network_api_services.dart';

class HProviders {
  static List<SingleChildWidget> providers = [
    Provider<NetworkApiService>(create: (_) => NetworkApiService()),
    Provider<AddBookController>(
      create: (_) => AddBookController(
        apiServices: NetworkApiService(),
      ),
    ),
  ];
}
