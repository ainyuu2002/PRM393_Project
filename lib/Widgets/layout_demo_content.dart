import 'package:flutter/material.dart';

class LayoutDemoContent extends StatelessWidget {
  const LayoutDemoContent({super.key});

  static const List<String> movieTitles = [
    'Avatar',
    'Inception',
    'Interstellar',
    'Joker',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Text(
            'Now Playing',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: movieTitles.length,
              itemBuilder: (context, index) {
                final String movieTitle = movieTitles[index];

                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Card(
                    margin: EdgeInsets.zero,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: const Color(0xFFE1E4FF),
                        child: Text(movieTitle[0]),
                      ),
                      title: Text(movieTitle),
                      subtitle: const Text('Sample description'),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
