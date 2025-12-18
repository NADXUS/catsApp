import 'package:flutter/material.dart';

class SearchFilter extends StatelessWidget {
  const SearchFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.fromLTRB(
        25.0,
        0.0,
        25.0,
        0.0,
      ), // padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: 'Search Breeds',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
          prefixIcon: const Icon(Icons.search),
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {},
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 12.0,
          ),
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 0, 0, 0),
              width: 1.0,
            ),
          ),
        ),
        onChanged: (value) {
          // Implement search logic here
        },
      ),
    );
  }
}
