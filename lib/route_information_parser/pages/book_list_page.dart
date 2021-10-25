import 'package:flutter/material.dart';
import 'package:navigator_2/route_information_parser/models/book.dart';

class BooksListPage extends StatelessWidget {
  const BooksListPage({
    Key? key,
    required this.books,
    required this.onTapped,
  }) : super(key: key);

  final List<Book> books;
  final ValueChanged<Book> onTapped;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Books List Page'),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(books[index].title),
            subtitle: Text(books[index].author),
            onTap: () => onTapped(books[index]),
          );
        },
        itemCount: books.length,
      ),
    );
  }
}
