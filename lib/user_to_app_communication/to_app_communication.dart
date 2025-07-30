import 'package:flutter/material.dart';

class ToAppCommunicationScreen extends StatefulWidget {
  const ToAppCommunicationScreen({super.key});

  @override
  State<ToAppCommunicationScreen> createState() {
    return _ToAppCommunicationState();
  }
}

class _ToAppCommunicationState extends State<ToAppCommunicationScreen> {
  final _inputController = TextEditingController();
  String inputText = "";
  int _selectedValue = 0;
  String selectedText = "";
  String dropDownValue = "Item 1";
  bool? value = false;

  final items = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5", "Item 6"];

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("To App Communication"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  controller: _inputController,
                  maxLength: 50,
                  decoration: InputDecoration(label: Text("Enter anything")),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    inputText = _inputController.text;
                  });
                },
                child: Text("Submit"),
              ),
              SizedBox(height: 20),
              Text(inputText),
              SizedBox(height: 30),
              Container(
                padding: EdgeInsets.all(0),
                child: Column(
                  children: <Widget>[
                    RadioListTile(
                      title: Text("Option 1"),
                      subtitle: Text("Subtitle for option 1"),
                      value: 1,
                      groupValue: _selectedValue,
                      onChanged: (value) {
                        setState(() {
                          _selectedValue = value!;
                          selectedText = "Option 1 selected";
                        });
                      },
                    ),
                    RadioListTile(
                      title: Text("Option 2"),
                      subtitle: Text("Subtitle for option 2"),
                      value: 2,
                      groupValue: _selectedValue,
                      onChanged: (value) {
                        setState(() {
                          _selectedValue = value!;
                          selectedText = "Option 2 selected";
                        });
                      },
                    ),
                    RadioListTile(
                      title: Text("Option 3"),
                      subtitle: Text("Subtitle for option 3"),
                      value: 3,
                      groupValue: _selectedValue,
                      onChanged: (value) {
                        setState(() {
                          _selectedValue = value!;
                          selectedText = "Option 3 selected";
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(selectedText),
              SizedBox(height: 20),
              DropdownButton(
                value: dropDownValue,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: items.map((String item) {
                  return DropdownMenuItem(value: item, child: Text(item));
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropDownValue = newValue!;
                  });
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Accept terms and conditions: ',
                    style: TextStyle(fontSize: 17.0),
                  ),
                  const SizedBox(width: 10),
                  Checkbox(
                    tristate: false,
                    value: value,
                    onChanged: (bool? newValue) {
                      setState(() {
                        value = newValue;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              if (value!) Text("Accepted!"),
            ],
          ),
        ),
      ),
    );
  }
}
