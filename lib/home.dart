import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wtf_sliding_sheet/wtf_sliding_sheet.dart';

class Myhome extends StatefulWidget {
  const Myhome({super.key});

  @override
  State<Myhome> createState() => _MyhomeState();
}

class _MyhomeState extends State<Myhome> {
  myArchie(numi, type) {
    return Row(
      children: [
        Text(
          numi,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Text(
            type,
          ),
        ),
      ],
    );
  }

  cardwid(icon, tech) {
    return Container(
      width: 105,
      height: 115,
      child: Card(
        margin: EdgeInsets.all(0),
        color: Color(0xff252525),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.white,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                tech,
                style: TextStyle(color: Colors.white),
              ),
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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.black,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: Text(
                  'Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.work, color: Colors.white),
                title: Text('Projects', style: TextStyle(color: Colors.white)),
                onTap: () {
                  // Handle the onTap
                  Navigator.pushNamed(context, 'projects');
                },
              ),
              ListTile(
                leading: Icon(Icons.book, color: Colors.white),
                title: Text('Education', style: TextStyle(color: Colors.white)),
                onTap: () {
                  // Handle the onTap
                  Navigator.pushNamed(context, "education");
                },
              ),
              ListTile(
                leading:
                    Icon((FontAwesomeIcons.certificate), color: Colors.white),
                title: Text('Certifications and Trainings',
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  // Handle the onTap
                  Navigator.pushNamed(context, "cert");
                },
              ),
              ListTile(
                leading: Icon(Icons.note, color: Colors.white),
                title:
                    Text('Internships', style: TextStyle(color: Colors.white)),
                onTap: () {
                  // Handle the onTap
                  Navigator.pushNamed(context, "internships");
                },
              ),
              ListTile(
                leading: Icon(Icons.star_border, color: Colors.white),
                title:
                    Text('Achievements', style: TextStyle(color: Colors.white)),
                onTap: () {
                  // Handle the onTap
                  Navigator.pushNamed(context, 'achievements');
                },
              ),
              ListTile(
                leading: Icon(Icons.functions, color: Colors.white),
                title: Text('Miscellaneous',
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  // Handle the onTap
                  Navigator.pushNamed(context, "miscellneous");
                },
              ),
              // ListTile(
              //   leading: Icon(Icons.contact_mail, color: Colors.white),
              //   title:
              //       Text('Contact Form', style: TextStyle(color: Colors.white)),
              //   onTap: () {
              //     // Handle the onTap
              //     Navigator.pushNamed(context, "/contactform");
              //   },
              // ),
              ListTile(
                leading: Icon(Icons.person, color: Colors.white),
                title: Text('About Me', style: TextStyle(color: Colors.white)),
                onTap: () {
                  // Handle the onTap
                  Navigator.pushNamed(context, "about");
                },
              ),
            ],
          ),
        ),
      ),
      body: SlidingSheet(
        elevation: 8,
        cornerRadius: 50,
        snapSpec: const SnapSpec(
          snap: true,
          snappings: [0.38, 0.7, 1.0],
          positioning: SnapPositioning.relativeToAvailableSpace,
        ),
        body: Container(
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(left: 45),
                child: ShaderMask(
                  shaderCallback: (rect) {
                    return LinearGradient(
                      begin: Alignment.center,
                      end: Alignment.bottomCenter,
                      colors: [Colors.black, Colors.transparent],
                    ).createShader(
                        Rect.fromLTRB(0, 0, rect.width, rect.height));
                  },
                  blendMode: BlendMode.dstIn,
                  child: Image.asset(
                    'assets/file1.png',
                    height: 400,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.49,
                ),
                child: Column(
                  children: [
                    Text(
                      'Bandana Shaw',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Flutter developer',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 20),
            height: 500,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      myArchie('5', ' Projects'),
                      myArchie('5', ' Certifications'),
                      myArchie('6', ' Internships')
                    ],
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    'Specialized In',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          cardwid(Icons.flutter_dash_sharp, 'Flutter'),
                          cardwid(FontAwesomeIcons.fire, 'Firebase'),
                          cardwid(FontAwesomeIcons.c, 'C++'),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          cardwid(FontAwesomeIcons.python, 'python'),
                          cardwid(FontAwesomeIcons.github, 'Github'),
                          cardwid(Icons.html_outlined, 'HTML'),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          cardwid(FontAwesomeIcons.js, 'JavaScript'),
                          cardwid(FontAwesomeIcons.css3, 'CSS'),
                          cardwid(FontAwesomeIcons.figma, 'Figma'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
