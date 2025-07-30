import 'dart:io';

import 'package:demo/file_demo/counter_storage.dart';
import 'package:flutter/material.dart';

class FileDemoScreen extends StatefulWidget {
  const FileDemoScreen({required this.storage, super.key});

  final CounterStorage storage;

  @override
  State<FileDemoScreen> createState() => _FileDemoScreenState();
}

class _FileDemoScreenState extends State<FileDemoScreen> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    widget.storage.readCounter().then((value) {
      setState(() {
        _counter = value;
      });
    });
  }

  Future<File> _incrementCounter() {
    setState(() {
      _counter++;
    });

    return widget.storage.writeCounter(_counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reading and Writing Files')),
      body: Center(
        child: Text("Button tapped $_counter time${_counter == 1 ? '' : 's'}."),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
