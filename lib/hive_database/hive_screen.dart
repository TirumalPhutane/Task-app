import 'package:flutter/material.dart';
import 'package:demo/hive_database/hive_functions.dart';

class HiveScreen extends StatefulWidget {
  const HiveScreen({super.key});

  @override
  State<HiveScreen> createState() => _HiveScreenState();
}

class _HiveScreenState extends State<HiveScreen> {
  List myHiveData = [];

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  getHiveData() {
    myHiveData = HiveFunctions.getAllUsers();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getHiveData();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CRUD with Hive"),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 5.0,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showForm(null);
        },
        label: Text("Add Data"),
        icon: Icon(Icons.add),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: myHiveData.isEmpty
            ? const Center(
                child: Text(
                  "No data is stored",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              )
            : Column(
                children: List.generate(myHiveData.length, (index) {
                  final userData = myHiveData[index];
                  return Card(
                    color: Colors.white,
                    elevation: 3,
                    child: ListTile(
                      title: Text("Name: ${userData["name"]}"),
                      subtitle: Text("Email: ${userData["email"]}"),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              showForm(userData['key']);
                            },
                            icon: Icon(Icons.edit),
                          ),
                          IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                  backgroundColor: Colors.white,
                                  title: Text('Alert!'),
                                  content: Text(
                                    "Are you sure you want to delete?",
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(ctx).pop();
                                      },
                                      child: const Text("Cancel"),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        HiveFunctions.deleteUser(
                                          userData["key"],
                                        );
                                        getHiveData();
                                        Navigator.of(ctx).pop();
                                      },
                                      child: const Text("Delete"),
                                    ),
                                  ],
                                ),
                              );
                            },
                            icon: Icon(Icons.delete),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
      ),
    );
  }

  void showForm(int? itemKey) async {
    if (itemKey != null) {
      final existingItem = myHiveData.firstWhere(
        (element) => element['key'] == itemKey,
      );
      _nameController.text = existingItem['name'];
      _emailController.text = existingItem['email'];
    }

    showModalBottomSheet(
      context: context,
      elevation: 5,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      builder: (_) => Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          top: 15,
          left: 15,
          right: 15,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                itemKey == null ? "Create New" : "Update",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
            ),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(hintText: 'Name'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(hintText: 'Email'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (itemKey == null) {
                  HiveFunctions.createUser({
                    "email": _emailController.text,
                    "name": _nameController.text,
                  });
                }

                if (itemKey != null) {
                  HiveFunctions.updateUser(itemKey, {
                    "email": _emailController.text,
                    "name": _nameController.text,
                  });
                }
                _nameController.text = '';
                _emailController.text = '';

                Navigator.of(context).pop();
                getHiveData();
              },
              child: Text(itemKey == null ? 'Create New' : "Update"),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
