import 'package:book_reader_register/pages/list_books_page.dart';
import 'package:book_reader_register/pages/register_books_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Book Reader Register',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.kalamTextTheme(Theme.of(context).textTheme),
      ),

      routes: {
        '/home': (context) => ListBooksPage(),
        '/register': (context) => RegisterBooksPage(),
      },

      initialRoute: '/',

      home: ListBooksPage(),
    );
  }
}
