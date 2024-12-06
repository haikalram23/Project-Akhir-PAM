import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskly/components/my_button.dart';
import 'package:taskly/components/my_button2.dart';
import 'package:taskly/components/my_textfield.dart';
import 'package:taskly/pages/regist_page.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFFF5F7FD),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            SvgPicture.asset('images/logo.svg',),

            const SizedBox(height: 70),

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

            const SizedBox(height: 10),

            //forgot password?
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Lupa kata sandi?',
                    style: TextStyle(color: Color(0xFF656565)),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            //login button
            MyButton(
              text: "Login",
              onTap: () {},
            ),

            const SizedBox(height: 15),

            //atau
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Color(0xFFA8A8A8),
                    ),
                  ),

                  SizedBox(width: 8),
                  Text("atau"),
                  SizedBox(width: 8),

                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Color(0xFFA8A8A8),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 15),

            //masuk with google
            MyButton2(
              text: "Masuk dengan Google",
              onTap: () {},
            ),

            const SizedBox(height: 30),

            //belum?
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Belum memiliki akun?',
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
                        builder: (context) => RegistPage(),
                      ),
                    );
                  },
                  child: const Text(
                    'Daftar',
                    style: TextStyle(
                      color: Color(0xFF4169E1),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        )
      );
  }
}