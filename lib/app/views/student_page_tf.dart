import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class stud_page extends StatefulWidget {
  const stud_page({super.key});

  @override
  State<stud_page> createState() => _stud_pageState();
}

class _stud_pageState extends State<stud_page> {
  TextEditingController searchHandeler = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(" Curse with Teacher")),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.all(7),
                    height: 80,
                    width: 300,
                    //color: Colors.red,
                    child: TextField(
                      controller: searchHandeler,
                      decoration: InputDecoration(
                        hintText: "search subject name",
                        filled: true,
                        // fillColor: Colors.blueAccent,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                  ),
                  // Container(
                  //   height: 75,
                  // width: 60,
                  //color: Colors.amber,

                  //   child: ElevatedButton(
                  //     child: Icon(
                  //       Icons.search,
                  //       size: 35,
                  //     ),
                  //     style: ElevatedButton.styleFrom(
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(50),
                  //         // <-- Radius
                  //       ),
                  //     ),
                  //     onPressed: () {
                  //       //getFetchData(searchHandeler.text);
                  //     },
                  //   ),
                  // ),
                  SizedBox(
                    width: 10,
                  )
                ],
              ),
              SizedBox(
                height: 15,
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
                          String a;
                          DocumentSnapshot doc = snapshot.data!.docs[index];
                          a = doc['name'];
                          return Column(
                            children: [
                              doc['Subject'] == searchHandeler.text
                                  ? Text(a)
                                  : Text("no topics found"),
                            ],
                          );
                          // return Text("hello world");
                        });
                  } else {
                    return Text("No data is here");
                  }
                },
              )
            ],
          ),
        ),
      ),
      // body: Container(
      //     margin: EdgeInsets.all(10),
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: [
      //         Container(
      //             width: 250,
      //             color: Colors.amber,
      //             //height: MediaQuery.of(context).size.height * .10,
      //             child: TextField(
      //               decoration: InputDecoration(
      //                   border: InputBorder.none,
      //                   labelText: 'Enter Name',
      //                   hintText: 'Enter Your Name'),
      //             )),
      //         ElevatedButton(onPressed: () {}, child: Icon(Icons.search))
      //       ],
      //     )),
    );
  }
}

// Future getFetchData(String text) async {
//   return StreamBuilder<QuerySnapshot>(
//     stream:
//         FirebaseFirestore.instance.collection('TeacherInformation').snapshots(),
//     builder: (context, snapshot) {
//       if (snapshot.hasData) {
//         print("helloworld");
//         return ListView.builder(
//             scrollDirection: Axis.vertical,
//             shrinkWrap: true,
//             itemCount: snapshot.data!.docs.length,
//             itemBuilder: (context, index) {
//               String a;
//               DocumentSnapshot doc = snapshot.data!.docs[index];
//               a = doc['name'];
//               return Column(
//                 children: [doc['Subject'] == text ? Text(a) : Text("ajk")],
//               );
//               return Text("hello world");
//             });
//       } else {
//         return Text("No datasss");
//       }
//     },
//   );
// }
