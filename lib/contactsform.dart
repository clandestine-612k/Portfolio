// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

// void main() => runApp(MaterialApp(
//       home: ContactFormPage(),
//     ));

// class ContactFormPage extends StatefulWidget {
//   @override
//   _ContactFormPageState createState() => _ContactFormPageState();
// }

// class _ContactFormPageState extends State<ContactFormPage> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _messageController = TextEditingController();

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _emailController.dispose();
//     _messageController.dispose();
//     super.dispose();
//   }

//   void _submitForm() {
//     if (_formKey.currentState!.validate()) {
//       _sendEmail();
//     }
//   }

//   void _sendEmail() async {
//     final Uri emailLaunchUri = Uri(
//       scheme: 'mailto',
//       path: 'bandana.shaw612@gmail.com', // Replace with your email address
//       query: encodeQueryParameters({
//         'subject': 'Example Subject & Symbols are allowed!',
//         'body': _messageController.text,
//       }),
//     );

//     final url = emailLaunchUri.toString();
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }

//   String? encodeQueryParameters(Map<String, String> params) {
//     return params.entries
//         .map((entry) =>
//             '${Uri.encodeComponent(entry.key)}=${Uri.encodeComponent(entry.value)}')
//         .join('&');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Color(0xff252525),
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: Icon(
//             Icons.arrow_back_ios_new_outlined,
//             color: Colors.white,
//           ),
//         ),
//         title: Text(
//           'Contact Form',
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: EdgeInsets.all(16.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: <Widget>[
//                 TextFormField(
//                   controller: _nameController,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your name';
//                     }
//                     return null;
//                   },
//                   style: TextStyle(color: Colors.white),
//                   decoration: InputDecoration(
//                     labelText: 'Name',
//                     labelStyle: TextStyle(color: Colors.white),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.white),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.white),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 16.0),
//                 TextFormField(
//                   controller: _emailController,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your email';
//                     }
//                     return null;
//                   },
//                   keyboardType: TextInputType.emailAddress,
//                   style: TextStyle(color: Colors.white),
//                   decoration: InputDecoration(
//                     labelText: 'Email',
//                     labelStyle: TextStyle(color: Colors.white),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.white),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.white),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 16.0),
//                 TextFormField(
//                   controller: _messageController,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your message';
//                     }
//                     return null;
//                   },
//                   maxLines: 5,
//                   style: TextStyle(color: Colors.white),
//                   decoration: InputDecoration(
//                     labelText: 'Message',
//                     labelStyle: TextStyle(color: Colors.white),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.white),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.white),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 24.0),
//                 ElevatedButton(
//                   onPressed: _submitForm,
//                   child: Text('Submit'),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MaterialApp(
      home: ContactFormPage(),
    ));

class ContactFormPage extends StatefulWidget {
  @override
  _ContactFormPageState createState() => _ContactFormPageState();
}

class _ContactFormPageState extends State<ContactFormPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _sendEmail();
    }
  }

  void _sendEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'bandana.shaw612@gmail.com', // Replace with your email address
      query: encodeQueryParameters({
        'subject': 'Example Subject & Symbols are allowed!',
        'body': _messageController.text,
      }),
    );

    if (await canLaunch(emailLaunchUri.toString())) {
      await launch(emailLaunchUri.toString());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not launch email client.')),
      );
    }
  }

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((entry) =>
            '${Uri.encodeComponent(entry.key)}=${Uri.encodeComponent(entry.value)}')
        .join('&');
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
          ),
        ),
        title: Text(
          'Contact Form',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextFormField(
                  controller: _nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Name',
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _messageController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your message';
                    }
                    return null;
                  },
                  maxLines: 5,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Message',
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
