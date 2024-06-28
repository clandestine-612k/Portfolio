import 'package:flutter/material.dart';

class MyEducation extends StatefulWidget {
  const MyEducation({super.key});

  @override
  State<MyEducation> createState() => _MyEducationState();
}

class _MyEducationState extends State<MyEducation> {
  myedu(updegree, clgname, degree, timedur, cgpa) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border(
          top: BorderSide(width: 1, color: Colors.white),
          bottom: BorderSide(width: 1, color: Colors.white),
        ),
        color: Colors.white60,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              updegree,
            ),
            SizedBox(
              width: 20,
            ),
            Center(
              child: ElevatedButton(
                style: ButtonStyle(
                  elevation: WidgetStateProperty.resolveWith<double>(
                    (Set<WidgetState> states) {
                      if (states.contains(WidgetState.pressed)) return 10.0;
                      return 10.0;
                    },
                  ),
                ),
                onPressed: () {
                  final snackBar = SnackBar(
                    content: Container(
                      height: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            clgname,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            degree,
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            timedur,
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.white70,
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                ' CGPA / Percentage - ',
                                style: TextStyle(color: Colors.white70),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                cgpa,
                                style: TextStyle(color: Colors.white70),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    action: SnackBarAction(
                      label: 'Close',
                      textColor: Colors.black,
                      backgroundColor: Colors.white,
                      onPressed: () {
                        // Some code to undo the change.
                      },
                    ),
                  );

                  // Find the ScaffoldMessenger in the widget tree
                  // and use it to show a SnackBar.
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: const Text(
                  'Details',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Color(0xff252525),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Colors.white,
              )),
          title: Text(
            'Education ',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text(
              //   'Education ',
              //   style: TextStyle(
              //       color: Colors.white,
              //       fontWeight: FontWeight.bold,
              //       fontSize: 30),
              // ),
              SizedBox(
                height: 50,
              ),
              myedu(
                  "Post Graduation",
                  "Harcourt Butler Technical University, Kanpur",
                  "MCA",
                  "August 2023 - Present ",
                  "9.5"),
              SizedBox(
                height: 20,
              ),
              myedu(
                  "Graduation",
                  "Regional Institute Of Education, Bhubaneswar",
                  "B.Sc. B.Ed.",
                  "August 2019 - June 2023 ",
                  "8.64"),
              SizedBox(
                height: 20,
              ),
              myedu("Higher Secondary", "Jawahar Navodaya Vidyalaya, Banipur",
                  "XII", "2019", "90.8 %"),
              SizedBox(
                height: 20,
              ),
              myedu("Secondary", "Jawahar Navodaya Vidyalaya, Banipur", "X",
                  "2017 ", "10"),
            ],
          ),
        ));
  }
}
