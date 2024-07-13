import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/book.dart';
import '../services/book_service.dart';
import 'book_details_screen.dart';
import '../models/bookmark.dart';
import 'bookmark_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final BookService _bookService = BookService();
  List<Book> _books = [];
  List<Book> _recommendedBooks = [];
  bool _isLoading = false;

  void _searchBooks(String term) async {
    setState(() {
      _isLoading = true;
    });

    final books = await _bookService.searchBooks(term);
    String? author;
    if (books.isNotEmpty) {
      author = books.first.authors.split(', ').first;
    }
    final recommendations = author != null
        ? await _bookService.getRecommendations(author)
        : <Book>[];

    setState(() {
      _books = books;
      _recommendedBooks = recommendations.cast<Book>();
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Book Api'),
        actions: [
          IconButton(
            icon: Icon(Icons.bookmark),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BookmarkScreen()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: const InputDecoration(
                  labelText: 'Search for books',
                  border: OutlineInputBorder(),
                ),
                onSubmitted: (term) {
                  _searchBooks(term);
                },
              ),
            ),
            _isLoading
                ? CircularProgressIndicator()
                : Expanded(
              child: ListView(
                children: <Widget>[
                  _buildSectionTitle('Search Results'),
                  _buildBookList(_books),
                  _buildSectionTitle('Recommended Books'),
                  _buildBookList(_recommendedBooks),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildBookList(List<Book> books) {
    return Column(
      children: books.map((book) {
        return ListTile(
          leading: book.thumbnail != null
              ? Image.network(book.thumbnail!)
              : null,
          title: Text(book.title),
          subtitle: Text(book.authors),
          trailing: IconButton(
            icon: Icon(Icons.bookmark_border),
            onPressed: () {
              Provider.of<Bookmark>(context, listen: false).addBookmark(book);
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
      }).toList(),
    );
  }
}
