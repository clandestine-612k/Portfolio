import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MyAbout extends StatefulWidget {
  const MyAbout({super.key});

  @override
  State<MyAbout> createState() => _MyAboutState();
}

class _MyAboutState extends State<MyAbout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.white,
            )),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 60),
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(left: 45),
              child: ShaderMask(
                  shaderCallback: (rect) {
                    return LinearGradient(
                            begin: Alignment.center,
                            end: Alignment.bottomCenter,
                            colors: [Colors.black, Colors.transparent])
                        .createShader(
                            Rect.fromLTRB(0, 0, rect.width, rect.height));
                  },
                  blendMode: BlendMode.dstIn,
                  child: Image.asset(
                    'assets/file1.png',
                    height: 400,
                    fit: BoxFit.contain,
                  )),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.44),
              child: Column(
                children: [
                  Text(
                    'Hello, I am',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    'Bandana Shaw',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Flutter developer',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    width: 120,
                    child: TextButton(
                        onPressed: () async {
                          final Uri params = Uri(
                            scheme: 'mailto',
                            path: 'bandana.shaw612@gmail.com',
                            query:
                                'subject=Hire%20Request&body=Hello,%20I%20would%20like%20to%20hire%20you%20for%20a%20project.%20Please%20contact%20me%20to%20discuss%20further.',
                          );
                          final emailLaunchUri = params.toString();

                          if (await canLaunch(emailLaunchUri)) {
                            await launch(emailLaunchUri);
                          } else {
                            throw 'Could not launch $emailLaunchUri';
                          }
                        },
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black),
                        child: Text(
                          'Hire Me',
                        )),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () async {
                            const url =
                                'https://www.instagram.com/clandestine_21k';
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                          icon: Icon(
                            FontAwesomeIcons.instagram,
                            color: Colors.white,
                          )),
                      IconButton(
                          onPressed: () async {
                            const url =
                                'https://www.linkedin.com/in/bandana-shaw';
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                          icon: Icon(
                            FontAwesomeIcons.linkedin,
                            color: Colors.white,
                          )),
                      IconButton(
                          onPressed: () async {
                            const url = 'https://github.com/clandestine-612k';
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                          icon: Icon(
                            FontAwesomeIcons.github,
                            color: Colors.white,
                          )),
                      IconButton(
                          onPressed: () async {
                            const phoneNumber =
                                'tel:+919330419480'; // Replace with the phone number you want to dial
                            if (await canLaunch(phoneNumber)) {
                              await launch(phoneNumber);
                            } else {
                              throw 'Could not launch $phoneNumber';
                            }
                          },
                          icon: Icon(
                            FontAwesomeIcons.phone,
                            color: Colors.white,
                          )),
                      IconButton(
                          onPressed: () async {
                            final Uri params = Uri(
                              scheme: 'mailto',
                              path:
                                  'bandana.shaw612@gmail.com', // Replace with your email address
                              query:
                                  'subject=Mail%20to%20contact&body=Hii,%20Would%20like%20to%20have%20some%20talk%20to%20you!',
                            );
                            final emailLaunchUri = params.toString();

                            if (await canLaunch(emailLaunchUri)) {
                              await launch(emailLaunchUri);
                            } else {
                              throw 'Could not launch $emailLaunchUri';
                            }
                          },
                          icon: Icon(
                            Icons.mail,
                            color: Colors.white,
                          )),
                      IconButton(
                        onPressed: () async {
                          final phoneNumber =
                              'whatsapp://send?phone=+919330419480'; // Replace with the phone number you want to message on WhatsApp
                          if (await canLaunch(phoneNumber)) {
                            await launch(phoneNumber);
                          } else {
                            throw 'Could not launch $phoneNumber';
                          }
                        },
                        icon: Icon(
                          FontAwesomeIcons.whatsapp,
                          color: Colors.green, // WhatsApp color
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
