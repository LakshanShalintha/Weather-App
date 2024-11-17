import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final Function(String) onSearch; // Callback for search

  const CustomSearchBar({super.key, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300], // Background color
        borderRadius: BorderRadius.circular(20), // Rounded corners
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        onChanged: onSearch, // Call the onSearch function with the query
        decoration: const InputDecoration(
          hintText: 'Search items...',
          border: InputBorder.none,
          suffixIcon: Icon(Icons.search), // Search icon
        ),
      ),
    );
  }
}
