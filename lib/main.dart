import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

import 'common/provider/app_provider.dart';
import 'common/routes/routes.dart';
import 'common/routes/routes_name.dart';
import 'data/model/collection_model.dart';
import 'data/model/local_book_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(CollectionModelAdapter());
  Hive.registerAdapter(LocalBookModelAdapter());
  await Hive.openBox<CollectionModel>('collections');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: HProviders.providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Book Loging app',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 32, 81, 229)),
          useMaterial3: true,
        ),
        initialRoute: RoutesName.homeview,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
