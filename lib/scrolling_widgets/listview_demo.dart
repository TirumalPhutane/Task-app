import 'package:flutter/material.dart';

class ListviewDemoScreen extends StatelessWidget {
  const ListviewDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView Demo"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 3.0,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
            child: ListTile(
              key: ValueKey(index),
              leading: const Icon(Icons.list),
              trailing: const Text(
                "GFG",
                style: TextStyle(color: Colors.green, fontSize: 15),
              ),
              title: Text("List Item ${index + 1}"),
            ),
          );
        },
      ),
    );
  }
}
