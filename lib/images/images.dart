import 'package:flutter/material.dart';

class ImagesDemoScreen extends StatelessWidget {
  const ImagesDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Demo'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildImageWithRatio('16:9', 16 / 9),
            _buildImageWithRatio('4:3', 4 / 3),
            _buildImageWithRatio('1:1', 1),
            _buildImageWithRatio('3:4', 3 / 4),
            _buildImageWithRatio('9:16', 9 / 16),
          ],
        ),
      ),
    );
  }

  Widget _buildImageWithRatio(String label, double ratio) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          AspectRatio(
            aspectRatio: ratio,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/images/flutter-clouds.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
