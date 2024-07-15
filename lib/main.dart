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
import 'package:portfolio/splash_screen.dart';

void main() {
  runApp(MaterialApp(
      initialRoute: "splashscreen",
      debugShowCheckedModeBanner: false,
      routes: {
        "home": (context) => const Myhome(),
        "about": (context) => const MyAbout(),
        "projects": (context) => const Myprojects(),
        "education": (context) => const MyEducation(),
        "cert": (context) => const MyCertifications(),
        "internships": (context) => const MyInternships(),
        "achievements": (context) => const MyAchievements(),
        "miscellneous": (context) => const MiscellaneousPage(),
        "/contactform": (context) => ContactFormPage(),
        "splashscreen": (context) => const SplashScreen()
      }));
}
