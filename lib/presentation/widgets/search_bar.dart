import 'package:flutter/material.dart';
import 'package:iouring_task/presentation/pages/search_page.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  void _navigateToSearch(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SearchPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _navigateToSearch(context),
      child: Container(
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E1E),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            const Icon(Icons.search, color: Colors.grey),
            const SizedBox(width: 12),
            const Text('Search & Add', style: TextStyle(color: Colors.grey)),
            const Spacer(),
            IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              icon: const Icon(Icons.grid_view, color: Color(0xFF00DD8D)),
              onPressed: () {},
            ),
            const SizedBox(width: 16),
            IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              icon: const Icon(Icons.tune, color: Color(0xFF00DD8D)),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
