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
  List toDoList = [
    ['Study for PAM', false],
    ['Debug Db Issues', false],
  ];

  void checkBoxChanged(int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
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
              Image.asset(
                'images/profile.png',
                height: 50,
                width: 50,
                fit: BoxFit.contain,
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          // Progress bar (jika ada)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: Colors.white,
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
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

                    Container(
                    height: 45,
                    child: LinearProgressIndicator(
                    value: 0.5,
                    backgroundColor: Colors.grey[200],
                    valueColor:
                        AlwaysStoppedAnimation<Color>(const Color(0xFF4169E1)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // All Task
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

          // ListView for tasks
          Container(
            height: 350, // Tentukan tinggi jika diperlukan
            child: Column(
              children: toDoList.map((item) {
                int index = toDoList.indexOf(item);
                return TodoCard(
                  taskName: item[0],
                  taskCompleted: item[1],
                  onChanged: (value) => checkBoxChanged(index),
                );
              }).toList(),
            ),
          ),

          // logout (sementara)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                },
                child: const Text(
                  'Logout',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
       floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigasi ke halaman Add Task
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
