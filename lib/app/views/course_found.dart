import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CourseView extends StatefulWidget {
  const CourseView({super.key});

  @override
  State<CourseView> createState() => _CourseViewState();
}

class _CourseViewState extends State<CourseView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: StreamBuilder<QuerySnapshot>(
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
                  if (doc['Subject'] == 'Toc') {
                    return Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(doc['name']),
                        ),
                        Expanded(
                          child: Text(doc['Subject']),
                        )
                      ],
                    );
                  }
                  return ScaffoldMessenger(child: Text("Course not Fund"));
                });
          } else {
            return Text("No datasss");
          }
        },
      )),
    );
  }
}
