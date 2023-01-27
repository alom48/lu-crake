import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../services/authenthication.dart';

class TeacherLogIn extends StatefulWidget {
  const TeacherLogIn({super.key});

  @override
  State<TeacherLogIn> createState() => _TeacherLogInState();
}

class _TeacherLogInState extends State<TeacherLogIn> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Log in Page"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'email',
                hintText: 'Enter email',
                suffixIcon: Icon(Icons.email),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
                hintText: 'Enter Password',
                suffixIcon: Icon(Icons.lock),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () async {
                  if (emailController.text == "" ||
                      passwordController.text == "") {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("All fields are required !"),
                      backgroundColor: Colors.red,
                    ));
                  } else {
                    User? result = await AuthService().login(
                        emailController.text, passwordController.text, context);

                    if (result == null) {
                      print("Password chaking brother");
                    }
                  }
                },
                child: Text("Submit"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
