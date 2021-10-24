import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'models/book.dart';
import 'page_transitions/from_bottom_to_top_page_transition.dart';
import 'pages/book_details_page.dart';
import 'pages/book_list_page.dart';
import 'pages/unknown_page.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Book? _selectedBook;
  bool show404 = false;
  final List<Book> books = [
    Book('Left Hand of Darkness', 'Ursula K. Le Guin'),
    Book('Too Like the Lightning', 'Ada Palmer'),
    Book('Kindred', 'Octavia E. Butler'),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Books App',
      home: Navigator(
        pages: [
          // MaterialPage - android page transition animation
          MaterialPage(
            key: const ValueKey('BooksListPage'),
            child: BooksListPage(
              books: books,
              onTapped: _handleBookTapped,
            ),
          ),
          if (show404)
            // CupertinoPage - iOS page transition animation
            const CupertinoPage(
              key: ValueKey('UnknownPage'),
              child: UnknownPage(),
            )
          else if (_selectedBook != null)
            // Custom page transition
            FromBottomToTopPageTransition(
              key: ValueKey(_selectedBook),
              child: BookDetailsPage(
                book: _selectedBook!,
              ),
            ),
        ],
        onPopPage: (Route<dynamic> route, dynamic result) {
          if (!route.didPop(result)) {
            return false;
          }

          // Update the list of pages by setting _selectedBook to null
          setState(() {
            _selectedBook = null;
          });

          return true;
        },
      ),
    );
  }

  void _handleBookTapped(Book book) {
    setState(() {
      _selectedBook = book;
    });
  }
}
