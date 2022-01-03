import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:game_snakes_ladders/stores/snakes-ladders.dart';
import 'package:game_snakes_ladders/view/home.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  GetIt getIt = GetIt.instance;
  getIt.registerSingleton<SnakesLadders>(SnakesLadders());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ludo Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black12,
        primarySwatch: Colors.blue,
      ),
      home: Home(),
      // home: ImageItem(),
    );
  }
}
