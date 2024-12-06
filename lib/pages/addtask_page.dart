import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AddTaskPage(),
    );
  }
}

class AddTaskPage extends StatelessWidget {
  AddTaskPage({super.key});

  final TextEditingController titleController = TextEditingController();
  final TextEditingController notesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Add Task',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Judul',
                labelStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
                border: InputBorder.none,
              ),
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: notesController,
              decoration: const InputDecoration(
                labelText: 'Catatan',
                labelStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
                border: InputBorder.none,
              ),
              maxLines: null, // Allows multiline input
              keyboardType: TextInputType.multiline,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 8,
        color: Colors.blueGrey[50], // Matches light background tone
      ),
      backgroundColor: const Color(0xFFF7F8FC), // Light grey background
    );
  }
}
