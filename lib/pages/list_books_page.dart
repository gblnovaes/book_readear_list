import 'package:book_reader_register/components/list_books.dart';
import 'package:book_reader_register/components/list_divider_horizontal.dart';
import 'package:book_reader_register/models/book_model.dart';
import 'package:book_reader_register/pages/register_books_page.dart';
import 'package:flutter/material.dart';

class ListBooksPage extends StatefulWidget {
  const ListBooksPage({super.key});

  @override
  State<ListBooksPage> createState() => _ListBooksPageState();
}

class _ListBooksPageState extends State<ListBooksPage> {
  List<BookModel> booksModel = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1Ef88),

      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 58),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'List Books Reader',
                          style: TextStyle(
                            color: Color(0xFF498C9A),
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        FloatingActionButton(
                          foregroundColor: Colors.white,
                          shape: CircleBorder(),
                          mini: true,
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => RegisterBooksPage(
                                  onRegisterAdd: (bookModel) {
                                    setState(() {
                                      booksModel.add(bookModel);
                                    });
                                  },
                                ),
                              ),
                            );
                          },
                          backgroundColor: Color(0xFF498C9A),
                          child: Icon(Icons.add),
                        ),
                        SizedBox(width: 4),
                      ],
                    ),
                  ),
                  ListDividerHorizontal(),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: ListBooks(listBooks: booksModel),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 38.0),
              child: VerticalDivider(color: Colors.red[200], thickness: 3),
            ),
          ],
        ),
      ),
    );
  }
}
