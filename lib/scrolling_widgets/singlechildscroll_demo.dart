import 'package:flutter/material.dart';

class SinglechildscrollDemoScreen extends StatelessWidget {
  const SinglechildscrollDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("SingleChildScrollView Demo"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 200,
              color: Colors.blue,
              child: Center(
                child: Text(
                  "Header Content",
                  style: TextStyle(color: Colors.white, fontSize: 24.0),
                ),
              ),
            ),
            Container(
              height: 1000.0,
              color: Colors.green,
              child: Center(
                child: Text(
                  'Scrollable Content',
                  style: TextStyle(color: Colors.white, fontSize: 24.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
