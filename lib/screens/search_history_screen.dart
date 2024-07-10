import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/search_history.dart';

class SearchHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final searchHistory = Provider.of<SearchHistory>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Search History'),
      ),
      body: ListView.builder(
        itemCount: searchHistory.history.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(searchHistory.history[index]),
            onTap: () {
              // Implement showing recommendations based on the selected search term
            },
          );
        },
      ),
    );
  }
}
