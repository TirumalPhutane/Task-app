import 'package:flutter/material.dart';

class StackDemoScreen extends StatelessWidget {
  const StackDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stack Demo'),
        backgroundColor: Colors.greenAccent[400],
      ),
      body: Center(
        child: SizedBox(
          width: 300,
          height: 300,
          child: Center(
            child: Stack(
              fit: StackFit.expand,
              clipBehavior: Clip.none,
              children: <Widget>[
                Container(width: 300, height: 300, color: Colors.red),
                Positioned(
                  top: 80,
                  left: 80,
                  child: Container(
                    width: 250,
                    height: 250,
                    color: Colors.black,
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 20,
                  child: Container(
                    width: 200,
                    height: 200,
                    color: Colors.purple,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
