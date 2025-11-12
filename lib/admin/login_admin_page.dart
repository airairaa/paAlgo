import 'package:flutter/material.dart';
import 'dashboad_admin_page.dart';

class LoginAdminPage extends StatefulWidget {
  const LoginAdminPage({super.key});

  @override
  State<LoginAdminPage> createState() => _LoginAdminPageState();
}

class _LoginAdminPageState extends State<LoginAdminPage> {
  final userController = TextEditingController();
  final passController = TextEditingController();

  // Statis username dan password
  final String correctUsername = 'admin';
  final String correctPassword = '123';

  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Background dengan gambar / warna
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          // Bisa ganti dengan asset image jika ada
          color: Colors.grey[200],
          image: DecorationImage(
            image: AssetImage("assets/paper.jpg"), // sesuaikan dengan file anda
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
            const SizedBox(height: 20),

            // Judul Login Admin
            const Text(
              "Login Admin",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),

            // Username TextField
            TextField(
              controller: userController,
              decoration: InputDecoration(
                labelText: "Username",
                filled: true,
                fillColor: Colors.white.withOpacity(0.9),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Password TextField
            
            TextField(
              controller: passController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                filled: true,
                fillColor: Colors.white.withOpacity(0.9),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Button Login
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Colors.grey[300],
                  foregroundColor: Colors.black,
                ),
                onPressed: () {
                  if (userController.text == correctUsername &&
                      passController.text == correctPassword) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const DashboardAdminPage(),
                      ),
                    );
                  } else {
                    setState(() {
                      errorMessage = "Username atau Password salah";
                    });
                  }
                },
                child: const Text("Login"),
              ),
            ),

            // Pesan error jika salah login
            if (errorMessage != null) ...[
              const SizedBox(height: 10),
              Text(errorMessage!, style: const TextStyle(color: Colors.red)),
            ],
          ],
        ),
      ),
    );
  }
}
