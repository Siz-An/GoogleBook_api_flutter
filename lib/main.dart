import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/search_history.dart';
import 'screens/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SearchHistory(),
      child: MaterialApp(
        title: 'Book Recommendation App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MainScreen(),
      ),
    );
  }
}
