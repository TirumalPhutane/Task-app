import 'package:flutter/material.dart';

class IconsDemoScreen extends StatelessWidget {
  const IconsDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Icons Demo'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildIcons(Icons.contact_mail, Colors.yellow, 60, 'Yellow'),
            _buildIcons(Icons.calendar_month, Colors.red, 30, 'Red'),
            _buildIcons(Icons.place, Colors.green, 100, 'Green'),
            _buildIcons(Icons.meeting_room, Colors.blue, 50, 'Blue'),
          ],
        ),
      ),
    );
  }

  Widget _buildIcons(
    IconData icon,
    Color color,
    double size,
    String colorName,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'Icon with $colorName and $size',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 8),
          Icon(icon, size: size, color: color),
        ],
      ),
    );
  }
}
