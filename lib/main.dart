import 'package:flutter/material.dart';
import 'package:lirarate/models/data_handler.dart';
import 'package:lirarate/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DataHandler(),
      child: MaterialApp(
        home: const HomeScreen(),
        theme: ThemeData(
          fontFamily: 'Nunito',
        ),
      ),
    );
  }
}
