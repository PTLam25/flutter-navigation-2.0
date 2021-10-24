import 'package:flutter/material.dart';
import 'package:navigator_2/introduction_new/models/book.dart';

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
      appBar: AppBar(),
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
