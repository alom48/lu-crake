import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:swe_lu/app/views/login_page.dart';
import 'package:swe_lu/app/views/regester_page._teacher.dart';
import 'package:swe_lu/app/views/register_page.dart';

class OpenFirstPage extends StatefulWidget {
  const OpenFirstPage({super.key});

  @override
  State<OpenFirstPage> createState() => _OpenFirstPageState();
}

class _OpenFirstPageState extends State<OpenFirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 250,
            ),
            Container(
              margin: EdgeInsets.all(90),
              height: 40,
              width: 200,
              color: Colors.amber,
              child: Center(
                  child: Text(
                "WELCOME ",
                style: TextStyle(fontSize: 20),
              )),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(RegistrationPageStudent());
              },
              child: Text(
                "As a Student",
                style: TextStyle(fontSize: 20),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Get.to(RegistrationPageStudentTeacher);
                },
                child: Text(
                  "As a Teacher",
                  style: TextStyle(fontSize: 20),
                )),
          ],
        ),
      ),
    );
  }
}
