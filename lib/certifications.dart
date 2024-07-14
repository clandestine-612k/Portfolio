import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyCertifications extends StatefulWidget {
  const MyCertifications({super.key});

  @override
  State<MyCertifications> createState() => _MyCertificationsState();
}

class _MyCertificationsState extends State<MyCertifications> {
  myCertcar(certname, desc, timedur, image) {
    return FittedBox(
      fit: BoxFit.fitHeight,
      child: Container(
        //height: 420,
        width: MediaQuery.of(context).size.width * 0.9,
        child: Card(
          color: const Color(0xff262628),
          child: Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 180,
                  child: Image.asset(image),
                ),
                Text(
                  certname,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  desc,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  timedur,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color(0xff252525),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.white,
            )),
        title: const Text(
          'Certifications and Trainings ',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              myCertcar(
                  'Fundamentals Of Docker And Kubernetes',
                  'Fundamentals Of Docker And Kubernetes masterclass by scalar',
                  "13 June, 2024",
                  "assets/fundamentals of kubernetes and dockernet scalar.png"),
              myCertcar(
                  'Introduction to JSONPowerDB -V2.0',
                  'JSONPowerDB beginner Programme by Login2Xplore',
                  "9 October, 2023",
                  "assets/jsonpowerdb.png"),
              myCertcar(
                  'Introduction to Cybersecurity',
                  'Introduction to Cybersecurity by Cisco',
                  "3 August, 2023",
                  "assets/cybersecurity.png"),
              myCertcar(
                  'Development of Digital Game based eContent',
                  'Online training on " Development of Digital Game based eContent " organized by CIET-NCERT in collaboration with AIM NITI AAYOG(',
                  "5-16 July, 2021)",
                  "assets/onlinegame.png"),
              myCertcar(
                  'MTTS follow-up programme',
                  'Online Foundation course in Mathematics-2020 organized by MTTS',
                  "Feb. 11 - March 2, 2021",
                  "assets/mttsfollowupprogramme.png"),
            ],
          ),
        ),
      ),
    );
  }
}
