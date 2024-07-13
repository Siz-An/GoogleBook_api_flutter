import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/bookmark.dart';
import 'book_details_screen.dart';

class BookmarkScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bookmark = Provider.of<Bookmark>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Bookmarks'),
      ),
      body: ListView.builder(
        itemCount: bookmark.bookmarkedBooks.length,
        itemBuilder: (context, index) {
          final book = bookmark.bookmarkedBooks[index];
          return ListTile(
            leading: book.thumbnail != null
                ? Image.network(book.thumbnail!)
                : null,
            title: Text(book.title),
            subtitle: Text(book.authors),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                bookmark.removeBookmark(book);
              },
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookDetailsScreen(book: book),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
