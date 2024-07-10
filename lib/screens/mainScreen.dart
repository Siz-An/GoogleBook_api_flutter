import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/search_history.dart';
import 'search_history_screen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final searchHistory = Provider.of<SearchHistory>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Book Recommendations'),
        actions: [
          IconButton(
            icon: Icon(Icons.history),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchHistoryScreen()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Search for books',
                  border: OutlineInputBorder(),
                ),
                onSubmitted: (term) {
                  searchHistory.addSearchTerm(term);
                  // Implement search functionality and show results
                },
              ),
            ),
            // Display recommendations here
          ],
        ),
      ),
    );
  }
}
