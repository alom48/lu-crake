import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Teacherdeshbord.dart';

class payemnt extends StatefulWidget {
  @override
  State<payemnt> createState() => Teacherlist();
}

class Teacherlist extends State<payemnt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ApproveButton(),
          ],
        ),
      ),
    );
  }
}

Future createuser(var now, String TeacherName, String StudentName) async {
  final docuser = FirebaseFirestore.instance.collection('Class Record').doc();

  final jsona = {
    'name': now,
    'TecherName': TeacherName,
    'StudentNAme': StudentName,
  };
  docuser.set(jsona);
}

Widget ApproveButton() {
  return Row(
    children: [
      SizedBox(
          width: 180,
          height: 70,
          child: ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          side: BorderSide(
                              color: Color.fromARGB(255, 240, 233, 233))))),
              onPressed: () {
                var now = DateTime.now;
                String TeacherName =
                    "moni sir"; //Dummy data it will come from data base
                String StudentName =
                    "Shafkat"; //Dummy data it will come from data base
                createuser(now, TeacherName, StudentName);
              },
              child: Text("Approved"))),
    ],
  );
}
