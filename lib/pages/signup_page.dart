import 'package:flutter/material.dart';
import 'package:paalpro/services/shared_preferences_service.dart';
import 'login_page.dart';
import 'masuk.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void signUp() async {
    if (usernameController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Isi semua data dulu ya!")));
      return;
    }
    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Password dan Cek Password harus sama!")),
      );
      return;
    }
    await SharedPrefService.saveUser(
      usernameController.text,
      passwordController.text,
    );
    if (context.mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Akun berhasil dibuat!")));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const MasukPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Background dengan tekstur kertas
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/paper.jpg'), // Pastikan ada file ini
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 70),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Logo lingkaran dengan border hitam
              Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  //color: Colors.white,
                  //border: Border.all(color: Colors.black, width: 3),
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/logo.png', // Pastikan sesuai dengan file Anda
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 35),

              // Username TextField
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: "Username",
                  filled: true,
                  fillColor: Colors.grey[300],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 12,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Password TextField
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  filled: true,
                  fillColor: Colors.grey[300],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 12,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Confirm Password TextField
              TextField(
                controller: confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Cek Password",
                  filled: true,
                  fillColor: Colors.grey[300],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 12,
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Button Sign Up dengan style sesuai gambar
              SizedBox(
                width: 150,
                height: 40,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                    side: const BorderSide(color: Colors.black, width: 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  onPressed: signUp,
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Garis pembatas dengan tulisan "or"
              Row(
                children: [
                  Expanded(
                    child: Divider(color: Colors.black.withOpacity(0.4)),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      'or',
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                  ),
                  Expanded(
                    child: Divider(color: Colors.black.withOpacity(0.4)),
                  ),
                ],
              ),
              const SizedBox(height: 18),

              // Row icon Gmail, Google, Instagram
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/email.png',
                    width: 35,
                    height: 35,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 23),
                  Image.asset(
                    'assets/igs.png',
                    width: 35,
                    height: 35,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 23),
                  Image.asset(
                    'assets/ins.png',
                    width: 35,
                    height: 35,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:paalpro/pages/dashboard_page.dart';
// import 'package:paalpro/widgets/custom_button.dart';

// class SignUpPage extends StatelessWidget {
//   const SignUpPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     TextEditingController usernameController = TextEditingController();
//     TextEditingController passwordController = TextEditingController();
//     TextEditingController confirmController = TextEditingController();

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         iconTheme: const IconThemeData(color: Colors.black),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(40.0),
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const LogoWidget(),

//               const SizedBox(height: 30),

//               const Text(
//                 "SIGN UP",
//                 style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//               ),

//               const SizedBox(height: 30),

//               TextField(
//                 controller: usernameController,
//                 decoration: const InputDecoration(
//                   labelText: 'Username',
//                   border: OutlineInputBorder(),
//                 ),
//               ),

//               const SizedBox(height: 20),

//               TextField(
//                 controller: passwordController,
//                 obscureText: true,
//                 decoration: const InputDecoration(
//                   labelText: 'Password',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               TextField(
//                 controller: confirmController,
//                 obscureText: true,
//                 decoration: const InputDecoration(
//                   labelText: 'Cek Password',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               const SizedBox(height: 30),
//               CustomButton(
//                 text: "Sign Up",
//                 onPressed: () {
//                   Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => const DashboardPage(),
//                     ),
//                   );
//                 },
//               ),
//               // const SizedBox(height: 20),
//               // const Text("or"),
//               // const SizedBox(height: 10),
//               // Row(
//               //   mainAxisAlignment: MainAxisAlignment.center,
//               //   children: const [
//               //     Icon(Icons.mail_outline, color: Colors.red),
//               //     SizedBox(width: 20),
//               //     Icon(Icons.g_mobiledata, color: Colors.blue),
//               //     SizedBox(width: 20),
//               //     Icon(Icons.camera_alt, color: Colors.purple),
//               //   ],
//               // ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
