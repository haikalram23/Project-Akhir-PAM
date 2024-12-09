import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskly/components/todo_card.dart';
import 'package:taskly/pages/addtask_page.dart';
import 'package:taskly/pages/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List toDoList = [];

  bool _isLogoutVisible = false;

  void checkBoxChanged(int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  // Function to handle logout
  Future<void> _handleLogout(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut(); // Sign out from Firebase
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    } catch (e) {
      // Handle errors (optional)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to log out: $e')),
      );
    }
  }

  void _toggleLogoutButton() {
    setState(() {
      _isLogoutVisible = !_isLogoutVisible;
    });
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: const Color(0xFFF5F7FD),
    appBar: AppBar(
      backgroundColor: const Color(0xFFF5F7FD),
      toolbarHeight: 100,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset('images/taskly-home.svg'),
            GestureDetector(
              onTap: _toggleLogoutButton,
              child: Image.asset(
                'images/profile.png',
                height: 50,
                width: 50,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    ),
    body: Stack(
  children: [
    // Main Content
    ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            color: Colors.white,
            elevation: 0,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Your Completion',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF656565),
                    ),
                  ),
                  const Text(
                    '25% Task Completed',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF474747),
                    ),
                  ),
                  const SizedBox(height: 15),
                  LinearProgressIndicator(
                    value: 0.5,
                    backgroundColor: Colors.grey[200],
                    valueColor: AlwaysStoppedAnimation<Color>(
                      const Color(0xFF4169E1),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Text(
            'All Task',
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
              color: Color(0xFF202020),
            ),
          ),
        ),
        Column(
          children: toDoList.map((item) {
            int index = toDoList.indexOf(item);
            return TodoCard(
              taskName: item[0],
              taskCompleted: item[1],
              onChanged: (value) => checkBoxChanged(index),
            );
          }).toList(),
        ),
      ],
    ),

    // If logout is visible, blur background
    if (_isLogoutVisible) ...[
      BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: Container(
          color: Colors.black.withOpacity(0.3), // Dim the background
        ),
      ),
      IgnorePointer(
        ignoring: true, // Prevent interactions with blurred background
        child: Container(),
      ),
    ],

    // Logout Button (kept on top and unaffected by blur)
    if (_isLogoutVisible)
      Center(
        child: GestureDetector(
          onTap: () => _handleLogout(context),
          child: Container(
            padding:
                const EdgeInsets.symmetric(vertical: 12, horizontal: 25),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: const Text(
              'Logout',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
  ],
),
floatingActionButton: _isLogoutVisible
    ? null // Hide FAB when logout button is visible
    : FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTaskPage()),
          );
        },
        backgroundColor: const Color(0xFF4169E1),
        child: SvgPicture.asset('images/plus.svg'),
      ),
  );
}
}
