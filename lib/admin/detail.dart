import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String judul;

  const DetailPage({super.key, required this.judul});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/paper.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // 🔹 Logo di atas
                Center(
                  child: Image.asset(
                    'assets/logo.png', // ganti sesuai nama file logomu
                    height: 60,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Pengaduan Mahasiswa UPNVYK',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const Text(
                  'PENGAJUAN ADUAN MAHASISWA',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 20),

                // 🔹 Judul form
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Form Pengajuan Aduan Mahasiswa',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                // 🔹 Bagian info aduan
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                        children: [
                          TextSpan(text: '$judul\n'),
                          const TextSpan(
                            text: 'ID: 1000101',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text('Fasilitas'),
                    ),
                  ],
                ),

                const SizedBox(height: 12),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Waktu: 10:10:01'),
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Tanggal: 2025/11/10'),
                ),

                const SizedBox(height: 16),

                // 🔹 Status dropdown dummy
                Row(
                  children: [
                    const Text('Status: '),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        'Done',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // 🔹 Field keluhan
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Keluhan'),
                ),
                const SizedBox(height: 8),
                TextField(
                  maxLines: 5,
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: 'Wifi lemot banget ya Allah...',
                    fillColor: Colors.grey[200],
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // 🔹 Field balasan
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Balasan'),
                ),
                const SizedBox(height: 8),
                Stack(
                  children: [
                    TextField(
                      maxLines: 5,
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: 'Silakan hubungi teknisi jaringan.',
                        fillColor: Colors.grey[200],
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 4,
                      top: 4,
                      child: IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black87,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Kembali'),
                ),
              ],
            ),
          ),
        ),
      ),

      // // 🔹 Bottom Navigation Bar seragam
      // bottomNavigationBar: BottomAppBar(
      //   child: SizedBox(
      //     height: 56,
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       children: [
      //         IconButton(icon: const Icon(Icons.volume_up), onPressed: () {}),
      //         IconButton(icon: const Icon(Icons.save), onPressed: () {}),
      //         IconButton(icon: const Icon(Icons.person), onPressed: () {}),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
