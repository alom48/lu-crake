import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:swe_lu/app/views/tt.dart';

import 'app/views/login_page.dart';
import 'app/views/opening_page.dart';
import 'app/views/register_page.dart';
import 'app/views/regester_page._teacher.dart';
import 'package:get/get.dart';
import 'app/views/Teacherlist.dart';
import 'app/views/student_page_tf.dart';
import 'app/views/tt.dart';
import 'app/views/payementTeacher.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        //home: const MyHomePage(title: 'Flutter Demo Home Page'),
        home: payemnt());
    //OpenFirstPage());

    // home: TeacherListAll());
  }
}
