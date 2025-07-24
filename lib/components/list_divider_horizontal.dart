import 'package:flutter/material.dart';

class ListDividerHorizontal extends StatelessWidget {
  const ListDividerHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: const Color.fromARGB(99, 201, 140, 145),
      thickness: 3,
    );
  }
}
