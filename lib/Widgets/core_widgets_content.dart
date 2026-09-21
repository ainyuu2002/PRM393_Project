import 'package:flutter/material.dart';

class CoreWidgetsContent extends StatelessWidget {
  const CoreWidgetsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Headline Text
            const Text(
              'Welcome to Flutter UI',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Material Icon
            const Icon(Icons.movie_creation_sharp, size: 80, color: Colors.blue),
            const SizedBox(height: 16),

            // Image with a translucent Play button.
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/images/bridge.webp',
                  width: double.infinity,
                  height: 180,
                  fit: BoxFit.cover,
                ),
                IconButton(
                  onPressed: () {},
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.white.withValues(alpha: 0.7),
                    fixedSize: const Size(64, 64),
                  ),
                  icon: const Icon(
                    Icons.play_arrow,
                    size: 40,
                    color: Colors.lightBlue,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Card containing a ListTile
            const Card(
              elevation: 4,
              child: ListTile(
                leading: Icon(Icons.star, color: Colors.black),
                title: Text('Movie Item'),
                subtitle: Text('This is a sample ListTile inside a Card.'),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
