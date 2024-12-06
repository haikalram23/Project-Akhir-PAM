import 'package:flutter/material.dart';
import 'package:taskly/components/my_button.dart';
import 'package:taskly/components/my_textfield.dart';
import 'package:taskly/pages/login_page.dart';
import 'package:taskly/pages/home_page.dart';

class RegistPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  RegistPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFF5F7FD),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //daftar
            const Text(
              "Daftar",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Color(0xFF202020),
              ),
            ),

            const SizedBox(height: 5),

            //divider
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Divider(
                thickness: 0.5,
                color: Color(0xFFA8A8A8),
              ),
            ),

            const SizedBox(height: 100),

            //email textfield
            MyTextField(
              controller: emailController,
              hintText: "Email",
              obscureText: false,
            ),

            const SizedBox(height: 20),

            //password textfield
            MyTextField(
              controller: passwordController,
              hintText: "Password",
              obscureText: true,
            ),

            const SizedBox(height: 20),

            //confirm password textfield
            MyTextField(
              controller: confirmPasswordController,
              hintText: "Confirm password",
              obscureText: true,
            ),

            const SizedBox(height: 50),

            //regist button
            MyButton(
              text: "Daftar",
              onTap: () {},
            ),

            const SizedBox(height: 30),

            //sudah punya akun?
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Sudah memiliki akun?',
                  style: TextStyle(
                    color: Color(0xFF656565),
                  ),
                ),

                const SizedBox(width: 4),

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
                    'Login',
                    style: TextStyle(
                      color: Color(0xFF4169E1),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            //go to home (sementara)
            GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    );
                  },
                  child: const Text(
                    'Go to Home',
                    style: TextStyle(
                      color: Color(0xFF4169E1),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
            ),
          ],
        )
    );
  }
}