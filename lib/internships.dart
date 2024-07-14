import 'package:flutter/material.dart';

class MyInternships extends StatefulWidget {
  const MyInternships({super.key});

  @override
  State<MyInternships> createState() => _MyInternshipsState();
}

class _MyInternshipsState extends State<MyInternships> {
  void showInternshipDialog(BuildContext context, String role,
      String companyName, String description, String date, String image) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:
              Text(role, style: const TextStyle(fontWeight: FontWeight.bold)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              if (image.isNotEmpty)
                Image.asset(
                  image,
                  height: 100,
                ),
              const SizedBox(height: 10),
              Text(companyName, style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Text(description),
              const SizedBox(height: 10),
              Text('Date: $date',
                  style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  GridTile myInternshipTile(String role, String companyName, String description,
      String date, String image) {
    return GridTile(
      child: GestureDetector(
        onTap: () {
          showInternshipDialog(
              context, role, companyName, description, date, image);
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[850],
            borderRadius: BorderRadius.circular(10),
          ),
          margin: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  role,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                  child: Text('open'),
                  onPressed: () {
                    showInternshipDialog(
                        context, role, companyName, description, date, image);
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white)),
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
          ),
        ),
        title: const Text(
          'Internships',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            myInternshipTile(
                'Flutter Developer Intern',
                'Infits',
                'Developed mobile applications using Flutter',
                'May 2024 - Aug 2024',
                'assets/Infits offer letter.png'),
            myInternshipTile(
                'Mathematics Tutor',
                'Course Hero',
                'Solved Online maths problems for school children',
                'Sep 2022 - Aug 2023',
                ''),
            myInternshipTile(
                'Student Teacher Intern',
                'Jawahar Navodaya Vidyalaya, East Medinipur',
                'Taught maths and science to students of class 6-9',
                'Sep 2022 - Jan 2023',
                'assets/JNV East Medinipur.jpg'),
            myInternshipTile(
                'Subject Matter Expert',
                'Armstrong Edu.',
                'Created articles of maths and science',
                'Apr 2021 - Sep 2022',
                ''),
            myInternshipTile(
                'Manager: Social Work',
                'Aashman Foundation',
                'Managed the social Work Team',
                'Oct 2021 - Jan 2022',
                'assets/Aashman foundation certificate.jpg'),
            myInternshipTile(
                'Campus Ambassador',
                'Internshala',
                'Promote Internshala Training programs using social media and online platforms',
                'Sep 2020 - Oct 2020',
                'assets/Internshala.png'),
          ],
        ),
      ),
    );
  }
}
