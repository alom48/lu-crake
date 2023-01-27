import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:swe_lu/app/views/teacher_login.dart';
import 'package:swe_lu/services/authenthication.dart';

import 'login_page.dart';

class RegistrationPageStudentTeacher extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController Firstnamecontroler = TextEditingController();
  TextEditingController lastnamecontroler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Registration Page For teacher")),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 65,
                ),
                TextField(
                  controller: Firstnamecontroler,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'First Name',
                    hintText: 'Enter First Name',
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: lastnamecontroler,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Last Name',
                    hintText: 'Enter Last Name',
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
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
                  height: 15,
                ),
                const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Confirm Password',
                    hintText: 'Enter Password',
                    suffixIcon: Icon(Icons.lock),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                    onPressed: (() async {
                      if (emailController.text == "" ||
                          passwordController.text == "") {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("All fields are required !"),
                          backgroundColor: Colors.red,
                        ));
                      } else {
                        User? result = await AuthService().register(
                            emailController.text,
                            passwordController.text,
                            context);
                      }

                      createuser(
                          Firstnamecontroler.text,
                          lastnamecontroler.text,
                          emailController.text,
                          passwordController.text);
                    }),
                    child: Text(
                      "submit",
                    )),
                SizedBox(
                  height: 25,
                ),
                TextButton(
                    onPressed: () {
                      Get.to(TeacherLogIn());
                    },
                    child: Text("Already have an accoutnt, Log in here")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future createuser(
    String Firstname, String Lastname, String email, String password) async {
  final docuser =
      FirebaseFirestore.instance.collection('TeacherInformation').doc();
  final jsona = {
    'name': Firstname,
    'Lastname': Lastname,
    'email': email,
    'password': password
  };
  docuser.set(jsona);
}
