import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Myprojects extends StatefulWidget {
  const Myprojects({super.key});

  @override
  State<Myprojects> createState() => _MyprojectsState();
}

class _MyprojectsState extends State<Myprojects> {
  myprojectcar(tech, title, desc, star, link) {
    return Container(
      height: 280,
      width: MediaQuery.of(context).size.width * 0.9,
      child: Card(
        color: Color(0xff262628),
        child: Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tech,
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                desc,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
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
                    star,
                    style: TextStyle(color: Colors.white70),
                  ),
                  Expanded(child: Container()),
                  IconButton(
                    onPressed: () async {
                      if (await canLaunch(link)) {
                        await launch(link);
                      } else {
                        throw 'Could not launch $link';
                      }
                    },
                    icon: Icon(FontAwesomeIcons.github),
                    color: Colors.white70,
                  )
                ],
              )
            ],
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
          'Projects',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              myprojectcar(
                  'FLUTTER',
                  'Portfolio App',
                  "This is my Portfolio as an app",
                  '10',
                  'https://github.com/clandestine-612k/Portfolio'),
              myprojectcar(
                  'FLUTTER',
                  'Weather App',
                  "The app showcases the current weather of Kolkata using an external API",
                  '10',
                  'https://github.com/clandestine-612k/Weather_App'),
              myprojectcar(
                  'FLUTTER',
                  'Loan EMI Calculator',
                  "Calculates loan EMI given the koan amount, period and rate of interest",
                  '10',
                  "https://github.com/clandestine-612k/LoanCalculator"),
              myprojectcar(
                  'JPDB',
                  'School DB',
                  "It is an interactive form using JsonPowerDB",
                  '10',
                  "https://github.com/clandestine-612k/Schooldb"),
              myprojectcar(
                  'JAVASCRIPT',
                  'To Do Application',
                  "It is a basic page that saves the to so list",
                  '10',
                  "https://github.com/clandestine-612k/ToDo_List")
            ],
          ),
        ),
      ),
    );
  }
}
