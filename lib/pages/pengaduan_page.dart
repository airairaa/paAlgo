import 'package:flutter/material.dart';

class PengaduanPage extends StatefulWidget {
  const PengaduanPage({super.key});

  @override
  State<PengaduanPage> createState() => _PengaduanPageState();
}

class _PengaduanPageState extends State<PengaduanPage> {
  String? _kategori;
  final keluhanController = TextEditingController();
  // Tambahan untuk dokumen (tidak ada fungsionalitas upload sesuai kode asli)
  String dokumenName = "Dokumen.pdf";
  bool dokumenChecked = false;

  void _submitAduan() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Aduan terkirim!"),
        content: const Text("Pilih tindakan selanjutnya."),
        actions: [
          TextButton(
            onPressed: () {
              keluhanController.clear();
              setState(() {
                _kategori = null;
                dokumenChecked = false;
              });
              Navigator.pop(context);
            },
            child: const Text("Ajukan Lagi"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Kembali ke Dashboard")),
              );
            },
            child: const Text("Kembali"),
          ),
        ],
      ),
    );
  }

  Widget _buildKategoriCheckbox(String label) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      height: 40,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        border: Border.all(color: Colors.black54),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          Checkbox(
            value: _kategori == label,
            onChanged: (bool? val) {
              setState(() {
                if (val == true) {
                  _kategori = label;
                } else {
                  _kategori = null;
                }
              });
            },
          ),
          Text(label),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Background texture kertas yang sama dengan permintaan sebelumnya
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/paper.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 50),
          children: [
            // Logo di atas tengah
            Center(
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  //shape: BoxShape.circle,
                  //color: Colors.white,
                  // border: Border.all(width: 2, color: Colors.black),
                ),
                child: ClipOval(
                  child: Image.asset('assets/logo.png', fit: BoxFit.cover),
                ),
              ),
            ),

            const Center(
              child: Text(
                "Pengaduan Mahasiswa UPNVYK",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 6),

            const Center(
              child: Text(
                "PENGAJUAN ADUAN",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),

            const Divider(
              thickness: 1,
              indent: 40,
              endIndent: 40,
              height: 40,
              color: Colors.black54,
            ),

            const Text(
              "Form Pengajuan Aduan",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                decoration: TextDecoration.underline,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 18),

            const Text(
              "Kategori (pilih salah satu) :",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
            ),
            const SizedBox(height: 6),

            // Checkbox kategori (edited sesuai gambar ; warna abu dan border)
            _buildKategoriCheckbox("Akademis"),
            _buildKategoriCheckbox("Fasilitas"),
            _buildKategoriCheckbox("Sosial"),

            const SizedBox(height: 20),

            const Text(
              "Keluhan/ Saran/ Kritik tentang kampus :",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
            ),
            const SizedBox(height: 8),

            Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                controller: keluhanController,
                maxLines: 6,
                decoration: const InputDecoration(
                  hintText: "Isi disini..",
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 12,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              "Dokumen/ foto (pdf, jpg, img)",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
            ),
            const SizedBox(height: 8),

            Row(
              children: [
                Checkbox(
                  value: dokumenChecked,
                  onChanged: (val) {
                    setState(() {
                      dokumenChecked = val ?? false;
                    });
                  },
                ),
                Expanded(
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(6),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      dokumenName,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),

            Center(
              child: SizedBox(
                width: 110,
                height: 32,
                child: OutlinedButton(
                  onPressed: _submitAduan,
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: const BorderSide(color: Colors.black),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    padding: EdgeInsets.zero,
                  ),
                  child: const Text(
                    "Submit",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),

      // Bottom Navigation bar dengan 3 icon putih latar hitam
      // bottomNavigationBar: Container(
      //   height: 70,
      //   color: Colors.black,
      //   padding: const EdgeInsets.symmetric(horizontal: 28),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       // Icon kiri - video camera
      //       Container(
      //         width: 50,
      //         height: 50,
      //         decoration: BoxDecoration(
      //           color: Colors.white,
      //           borderRadius: BorderRadius.circular(50),
      //         ),
      //         child: const Icon(Icons.videocam, color: Colors.black),
      //       ),

      //       // Icon tengah - save
      //       Container(
      //         width: 50,
      //         height: 50,
      //         decoration: BoxDecoration(
      //           color: Colors.white,
      //           borderRadius: BorderRadius.circular(50),
      //         ),
      //         child: const Icon(Icons.save, color: Colors.black),
      //       ),

      //       // Icon kanan - person
      //       Container(
      //         width: 50,
      //         height: 50,
      //         decoration: BoxDecoration(
      //           color: Colors.white,
      //           borderRadius: BorderRadius.circular(50),
      //         ),
      //         child: const Icon(Icons.person, color: Colors.black),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
