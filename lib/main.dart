import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/dashboard_page.dart';
import 'package:paalpro/admin/login_admin_page.dart';
import 'package:paalpro/services/shared_preferences_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final isLoggedIn = await SharedPrefService.isLoggedIn();
  runApp(LaporKampusApp(isLoggedIn: isLoggedIn));
}

class LaporKampusApp extends StatelessWidget {
  final bool isLoggedIn;
  const LaporKampusApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lapor Kampus',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: isLoggedIn ? const DashboardPage() : const RoleSelectionPage(),
    );
  }
}

// menambahkan dashboard User dan Admin

class RoleSelectionPage extends StatelessWidget {
  const RoleSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Selamat Datang di Lapor Kampus 👋",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginPage()),
                  );
                },
                child: const Text("Masuk sebagai User"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginAdminPage()),
                  );
                },
                child: const Text("Masuk sebagai Admin"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:paalpro/pages/splash_page.dart';

// void main() {
//   runApp(const LaporKampusApp());
// }

// class LaporKampusApp extends StatelessWidget {
//   const LaporKampusApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Lapor Kampus',
//       theme: ThemeData(
//         primarySwatch: Colors.grey,
//         scaffoldBackgroundColor: Colors.white,
//         textTheme: const TextTheme(
//           bodyMedium: TextStyle(fontFamily: 'Poppins'),
//         ),
//       ),
//       home: const SplashPage(),
//     );
//   }
// }
