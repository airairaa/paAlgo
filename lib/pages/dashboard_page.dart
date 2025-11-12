import 'package:flutter/material.dart';
import 'package:paalpro/services/shared_preferences_service.dart';
import 'login_page.dart';
import 'pengaduan_page.dart';
import 'riwayat_page.dart';
import 'profil_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;
  final List<Widget> _pages = const [
    PengaduanPage(),
    RiwayatPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<void> _logout() async {
    await SharedPrefService.logout();
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard User"),
        actions: [
          IconButton(icon: const Icon(Icons.logout), onPressed: _logout),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.campaign), label: "Aduan"),
          BottomNavigationBarItem(icon: Icon(Icons.archive), label: "Riwayat"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// // import 'pengaduan_page.dart';
// // import 'riwayat_page.dart';
// import 'profil_page.dart';

// class DashboardPage extends StatefulWidget {
//   const DashboardPage({super.key});

//   @override
//   State<DashboardPage> createState() => _DashboardPageState();
// }

// class _DashboardPageState extends State<DashboardPage> {
//   int _selectedIndex = 0;

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });

//     if (index == 0) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => const PengaduanPage()),
//       );
//     } else if (index == 1) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => const RiwayatPage()),
//       );
//     } else if (index == 2) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => const ProfilPage()),
//       );
//     }
//   }

//   void _tampilkanFormAduan() {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text("Ajukan Aduan"),
//         content: const Text("Fitur pengajuan aduan akan ditambahkan nanti."),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text("Tutup"),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Pengaduan Mahasiswa UPNVYK",
//           style: TextStyle(fontSize: 16, color: Colors.black),
//         ),
//         backgroundColor: Colors.white,
//         centerTitle: true,
//         elevation: 0,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               // 🔍 Kolom pencarian
//               TextField(
//                 decoration: InputDecoration(
//                   hintText: 'Cari aduan...',
//                   suffixIcon: const Icon(Icons.search),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),

//               // 🗣️ Ajukan Aduan
//               const Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   "Ajukan Aduan :",
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               GestureDetector(
//                 onTap: _tampilkanFormAduan,
//                 child: Container(
//                   height: 60,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     color: Colors.black,
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: const Center(
//                     child: Icon(Icons.add, color: Colors.white),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 30),

//               // 📂 Riwayat Aduan
//               const Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   "Riwayat Aduan :",
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => const RiwayatPage(),
//                     ),
//                   );
//                 },
//                 child: Container(
//                   height: 60,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     color: Colors.black,
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: const Center(
//                     child: Icon(Icons.archive, color: Colors.white),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),

//       // 🔽 Bottom Navigation Bar
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedIndex,
//         backgroundColor: Colors.black,
//         selectedItemColor: Colors.white,
//         unselectedItemColor: Colors.white54,
//         onTap: _onItemTapped,
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.campaign), label: ''),
//           BottomNavigationBarItem(icon: Icon(Icons.archive), label: ''),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
//         ],
//       ),
//     );
//   }
// }
