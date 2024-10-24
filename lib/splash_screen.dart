// // import 'package:flutter/material.dart';
// // import 'package:flutter/services.dart';

// // class SplashScreen extends StatefulWidget {
// //   const SplashScreen({super.key});

// //   @override
// //   State<SplashScreen> createState() => _SplashScreenState();
// // }

// // class _SplashScreenState extends State<SplashScreen>
// //     with SingleTickerProviderStateMixin {
// //   @override
// //   void initState() {
// //     // TODO: implement initState
// //     super.initState();
// //     SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
// //     Future.delayed(Duration(seconds: 3), () {
// //       Navigator.pushNamed(context, "home");
// //     });
// //   }

// //   @override
// //   void dispose() {
// //     // TODO: implement dispose
// //     SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
// //         overlays: SystemUiOverlay.values);
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Container(
// //         width: double.infinity,
// //         decoration: const BoxDecoration(
// //           gradient: LinearGradient(
// //               colors: [Colors.black, Colors.black],
// //               begin: Alignment.topLeft,
// //               end: Alignment.bottomRight),
// //         ),
// //         child: const Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             Text(
// //               "PORTFOLIO",
// //               style: TextStyle(
// //                   fontSize: 20,
// //                   fontWeight: FontWeight.bold,
// //                   color: Colors.white),
// //             )
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen>
//     with SingleTickerProviderStateMixin {
//   final String hardcodedAccessCode = "1234"; // Your hardcoded access code
//   TextEditingController _accessCodeController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _showAccessCodeDialog();
//     });
//   }

//   void _showAccessCodeDialog() {
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text("Enter Access Code"),
//           content: TextField(
//             controller: _accessCodeController,
//             decoration: InputDecoration(hintText: "Access Code"),
//             obscureText: true,
//           ),
//           actions: <Widget>[
//             TextButton(
//               child: Text("Submit"),
//               onPressed: () {
//                 if (_accessCodeController.text == hardcodedAccessCode) {
//                   Navigator.of(context).pop();
//                   _startSplashScreen();
//                 } else {
//                   _showErrorDialog();
//                 }
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _showErrorDialog() {
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text("Error"),
//           content: Text("Access code is incorrect. Please try again."),
//           actions: <Widget>[
//             TextButton(
//               child: Text("Retry"),
//               onPressed: () {
//                 Navigator.of(context).pop();
//                 _accessCodeController.clear();
//                 _showAccessCodeDialog();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _startSplashScreen() {
//     Future.delayed(Duration(seconds: 3), () {
//       Navigator.pushNamed(context, "home");
//     });
//   }

//   @override
//   void dispose() {
//     _accessCodeController.dispose();
//     SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
//         overlays: SystemUiOverlay.values);
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//               colors: [Colors.black, Colors.black],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight),
//         ),
//         child: const Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               "PORTFOLIO",
//               style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushNamed(context, "home");
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.black, Colors.black],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "PORTFOLIO",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
