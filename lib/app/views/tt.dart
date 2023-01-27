import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginViee extends StatefulWidget {
  @override
  State<LoginViee> createState() => Teacherlist();
}

class Teacherlist extends State<LoginViee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            height: 100,
            width: 200,
          ),
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('TeacherInformation')
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                print("helloworld");
                return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      String e;
                      DocumentSnapshot doc = snapshot.data!.docs[index];
                      e = doc['name'];
                      return Column(
                        children: [
                          doc['Subject'] == 'Toc' ? Text(e) : Text("ab")
                        ],
                      );
                      
                    });
              } else {
                return Text("No datasss");
              }
            },
          )
        ],
      )),
    );
  }
}

class TeacherListAll extends StatefulWidget {
  const TeacherListAll({super.key});

  @override
  State<TeacherListAll> createState() => _TeacherListAllState();
}

class _TeacherListAllState extends State<TeacherListAll> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
