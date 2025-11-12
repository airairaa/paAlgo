// import 'package:flutter/material.dart';
// import 'package:paalpro/pages/login_page.dart';
// import 'package:paalpro/pages/signup_page.dart';
// import 'package:paalpro/widgets/custom_button.dart';

// class WelcomePage extends StatelessWidget {
//   const WelcomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Center(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 40.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const LogoWidget(),
//                 const SizedBox(height: 30),
//                 const Text(
//                   "SELAMAT DATANG",
//                   style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//                 ),

//                 const SizedBox(height: 40),

//                 CustomButton(
//                   text: "Login",
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => const LoginPage(),
//                       ),
//                     );
//                   },
//                 ),

//                 const SizedBox(height: 25),

//                 CustomButton(
//                   text: "Sign Up",
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => const SignUpPage(),
//                       ),
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
