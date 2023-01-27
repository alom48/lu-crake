import 'package:flutter/material.dart';

class middleman extends StatefulWidget {
  middleman({super.key});
  String TeacherName = "Moni sir";
  String StudentName = "shafkat";
  @override
  State<middleman> createState() => _middlemanState();

  void getTeacherName(String tn, String st) {
    tn = TeacherName;
    st = StudentName;
  }
}

class _middlemanState extends State<middleman> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView();
  }
}
