import 'package:flutter/foundation.dart';
import 'book.dart';

class Bookmark with ChangeNotifier {
  final List<Book> _bookmarkedBooks = [];

  List<Book> get bookmarkedBooks => _bookmarkedBooks;

  void addBookmark(Book book) {
    _bookmarkedBooks.add(book);
    notifyListeners();
  }

  void removeBookmark(Book book) {
    _bookmarkedBooks.remove(book);
    notifyListeners();
  }
}
