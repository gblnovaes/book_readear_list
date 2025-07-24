import 'package:book_reader_register/components/list_divider_horizontal.dart';
import 'package:book_reader_register/models/book_model.dart';
import 'package:flutter/material.dart';

class ListBooks extends StatelessWidget {
  const ListBooks({super.key, required this.listBooks});

  final List<BookModel> listBooks;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final book = listBooks[index];
        return ListTile(
          title: Padding(
            padding: const EdgeInsets.only(left: 58.0),
            child: Text(
              book.title,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: book.isRead ? Colors.grey : Colors.black,
                decoration: book.isRead ? TextDecoration.lineThrough : null,
              ),
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(left: 58.0),

            child: Text(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              book.description,
              style: TextStyle(
                color: book.isRead ? Colors.grey : Colors.black,
                decoration: book.isRead ? TextDecoration.lineThrough : null,
              ),
            ),
          ),
          visualDensity: VisualDensity.compact,
          contentPadding: EdgeInsets.all(0),
        );
      },
      separatorBuilder: (context, i) {
        return ListDividerHorizontal();
      },
      itemCount: listBooks.length,
    );
  }
}
