import 'package:flutter/material.dart';
import 'package:paalpro/services/shared_preferences_service.dart';
import 'dashboard_page.dart';

class MasukPage extends StatefulWidget {
  const MasukPage({super.key});

  @override
  State<MasukPage> createState() => _MasukPageState();
}

class _MasukPageState extends State<MasukPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  String? errorMessage;

  void login() async {
    final user = await SharedPrefService.getUser();

    if (usernameController.text == user['username'] &&
        passwordController.text == user['password']) {
      await SharedPrefService.setLoggedIn(true);
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const DashboardPage()),
        );
      }
    } else {
      setState(() {
        errorMessage = "Password anda salah!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Background texture paper (pastikan ada file assets/paper.jpg dan didaftarkan di pubspec.yaml)
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/paper.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Logo bulat dengan border hitam
            Container(
              width: 130,
              height: 130,
              decoration: BoxDecoration(
                //color: Colors.white,
                //shape: BoxShape.circle,
                //border: Border.all(color: Colors.black, width: 3),
              ),
              child: ClipOval(
                child: Image.asset(
                  'assets/logo.png', // ganti sesuai logo Anda
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 40),

            // Username label dan TextField
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Username",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black.withOpacity(0.9),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 5),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
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

            // Password label dan TextField
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Password",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black.withOpacity(0.9),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 5),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
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

            // Error message tampilkan jika ada
            if (errorMessage != null) ...[
              const SizedBox(height: 15),
              Text(errorMessage!, style: const TextStyle(color: Colors.red)),
            ],

            const SizedBox(height: 30),

            // Tombol Login
            SizedBox(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300],
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  elevation: 0,
                ),
                onPressed: login,
                child: const Text(
                  "Login",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
