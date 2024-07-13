import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/book.dart';

class BookService {
  static const String apiUrl = 'https://www.googleapis.com/books/v1/volumes?q=';

  Future<List<Book>> searchBooks(String query) async {
    final response = await http.get(Uri.parse('$apiUrl$query'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<Book> books = (data['items'] as List).map((item) => Book.fromJson(item)).toList();
      return books;
    } else {
      throw Exception('Failed to load books');
    }
  }

  Future<List<Book>> getRecommendations(String author) async {
    final response = await http.get(Uri.parse('$apiUrl+inauthor:$author'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<Book> books = (data['items'] as List).map((item) => Book.fromJson(item)).toList();
      return books;
    } else {
      throw Exception('Failed to load recommendations');
    }
  }
}
