import 'package:flutter/material.dart';
import 'package:minitutorials/search_and_filter_listview/books.dart';

class BookPage extends StatelessWidget {
  final Book book;

  const BookPage({required this.book, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
      ),
      body: Image.network(
        book.urlImage,
        width: double.infinity,
        height: 300,
        fit: BoxFit.cover,
      ),
    );
  }
}
