import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'common/provider/app_provider.dart';
import 'common/routes/routes.dart';
import 'common/routes/routes_name.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
