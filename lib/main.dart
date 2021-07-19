import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive/hive.dart';
import 'package:mobile_programming/locale/app_localizations.dart';
import 'package:mobile_programming/models/to_do_model.dart';
import 'package:mobile_programming/routing/route_class.dart' as route;
import 'package:path_provider/path_provider.dart' as pathProvider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppLocalizations();
  Directory directory = await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(ToDoModelAdapter());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile Programming',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: route.generateRoute,
      initialRoute: route.splash,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [const Locale('en'), const Locale('hi')],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
