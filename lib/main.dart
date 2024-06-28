import 'package:flutter/material.dart';
import 'package:portfolio/about.dart';
import 'package:portfolio/achievements.dart';
import 'package:portfolio/certifications.dart';
import 'package:portfolio/contactsform.dart';
import 'package:portfolio/education.dart';
import 'package:portfolio/home.dart';
import 'package:portfolio/internships.dart';
import 'package:portfolio/miscellenaous.dart';
import 'package:portfolio/projects.dart';

void main() {
  runApp(MaterialApp(
      initialRoute: "home",
      debugShowCheckedModeBanner: false,
      routes: {
        "home": (context) => Myhome(),
        "about": (context) => MyAbout(),
        "projects": (context) => Myprojects(),
        "education": (context) => MyEducation(),
        "cert": (context) => MyCertifications(),
        "internships": (context) => MyInternships(),
        "achievements": (context) => MyAchievements(),
        "miscellneous": (context) => MiscellaneousPage(),
        "/contactform": (context) => ContactFormPage(),
      }));
}
