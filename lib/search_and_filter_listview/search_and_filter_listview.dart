import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minitutorials/search_and_filter_listview/book_page.dart';
import 'package:minitutorials/search_and_filter_listview/books.dart';

class MySearchAndFilterListView extends StatefulWidget {
  const MySearchAndFilterListView({Key? key}) : super(key: key);

  @override
  _TemplateState createState() => _TemplateState();
}

class _TemplateState extends State<MySearchAndFilterListView> {
  final controller = TextEditingController();
  List<Book> books = allBooks;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search and Filter ListView)')),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(16),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Book Tile',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.blue)),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red))),
              onChanged: (query) {
                searchBook(query);
              },
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: books.length,
                  itemBuilder: (context, index) {
                    final book = books[index];
                    return ListTile(
                      leading: Image.network(
                        book.urlImage,
                        fit: BoxFit.cover,
                        width: 50,
                        height: 50,
                      ),
                      title: Text(book.title),
                      onTap: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => BookPage(book: book))),
                    );
                  }))
        ],
      ),
    );
  }

  void searchBook(String query) {
    final suggestions = allBooks.where((book) {
      final bookTitle = book.title.toLowerCase();
      final input = query.toLowerCase();

      return bookTitle.contains(input);
    }).toList();
    setState(() {
      books = suggestions;
    });
  }
}
