import 'package:book_recomend/screens/mainScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/bookmark.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Bookmark(),
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
