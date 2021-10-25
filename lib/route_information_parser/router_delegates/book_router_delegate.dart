import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navigator_2/route_information_parser/models/book.dart';
import 'package:navigator_2/route_information_parser/models/book_route_path.dart';
import 'package:navigator_2/route_information_parser/page_transitions/from_bottom_to_top_page_transition.dart';
import 'package:navigator_2/route_information_parser/pages/book_details_page.dart';
import 'package:navigator_2/route_information_parser/pages/book_list_page.dart';
import 'package:navigator_2/route_information_parser/pages/unknown_page.dart';

class BookRouterDelegate extends RouterDelegate<BookRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<BookRoutePath> {
  late final GlobalKey<NavigatorState> _navigatorKey =
      GlobalKey<NavigatorState>();

  Book? _selectedBook;
  bool show404 = false;

  List<Book> books = [
    Book('Left Hand of Darkness', 'Ursula K. Le Guin'),
    Book('Too Like the Lightning', 'Ada Palmer'),
    Book('Kindred', 'Octavia E. Butler'),
  ];

  @override
  BookRoutePath get currentConfiguration {
    if (show404) {
      return BookRoutePath.unknown();
    }

    return _selectedBook == null
        ? BookRoutePath.home()
        : BookRoutePath.details(books.indexOf(_selectedBook!));
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: _navigatorKey,
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
        _selectedBook = null;
        show404 = false;
        notifyListeners();

        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(BookRoutePath configuration) async {
    if (configuration.isUnknown) {
      _selectedBook = null;
      show404 = true;
      return;
    }

    if (configuration.isDetailsPage) {
      if (configuration.id! < 0 || configuration.id! > books.length - 1) {
        show404 = true;
        return;
      }

      _selectedBook = books[configuration.id!];
    } else {
      _selectedBook = null;
    }

    show404 = false;
  }

  void _handleBookTapped(Book book) {
    _selectedBook = book;
    notifyListeners();
  }
}
