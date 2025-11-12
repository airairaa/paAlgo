import 'package:flutter/material.dart';
import 'detail.dart';

class DashboardAdminPage extends StatefulWidget {
  const DashboardAdminPage({super.key});

  @override
  State<DashboardAdminPage> createState() => _DashboardAdminPageState();
}

class _DashboardAdminPageState extends State<DashboardAdminPage> {
  // Simulasi data riwayat aduan
  List<Map<String, dynamic>> items = [
    {
      "id": 200,
      "judul": "Kelas",
      "kategori": "Akademik",
      "detail": "Koneksi wifi lambat",
      "status": "Done",
    },
    {
      "id": 223,
      "judul": "AC Mati",
      "kategori": "Fasilitas",
      "detail": "Ruang kelas panas",
      "status": "Dikirim",
    },
    {
      "id": 299,
      "judul": "Wifi lemot",
      "kategori": "Fasilitas",
      "detail": "Koneksi wifi lambat",
      "status": "Belum",
    },
  ];

  List<Map<String, dynamic>> filteredItems = [];
  String searchQuery = "";

  // Menyimpan id yang dipilih untuk dihapus
  Set<int> selectedIds = {};

  @override
  void initState() {
    super.initState();
    filteredItems = List.from(items);
  }

  // Fungsi filter berdasarkan id atau judul
  void filterItems(String query) {
    final qLower = query.toLowerCase();
    setState(() {
      searchQuery = query;
      filteredItems = items.where((item) {
        final idString = item['id'].toString();
        final judul = item['judul'].toString().toLowerCase();
        return idString.contains(qLower) || judul.contains(qLower);
      }).toList();
      selectedIds.clear(); // reset selection tiap filter
    });
  }

  // Warna status sesuai label
  Color getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'done':
        return Colors.green;
      case 'dikirim':
        return Colors.orange;
      case 'belum':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  // Hapus data berdasar selectedIds
  void deleteSelected() {
    setState(() {
      items.removeWhere((item) => selectedIds.contains(item['id']));
      filterItems(searchQuery); // update filtered list
      selectedIds.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar dihilangkan supaya sesuai gambar
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/paper.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Column(
          children: [
            Container(
              width: 40,
              height: 40,
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

            const SizedBox(height: 10),

            // Judul Riwayat Admin
            const Text(
              "Riwayat Admin",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            // Search + tombol hapus
            Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: filterItems,
                    decoration: InputDecoration(
                      hintText: "Cari berdasarkan Judul atau Id...",
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                // Tombol hapus muncul hanya kalau ada yg dipilih
                if (selectedIds.isNotEmpty)
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: const Text("Konfirmasi"),
                          content: Text(
                            "Hapus ${selectedIds.length} data terpilih?",
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(ctx),
                              child: const Text("Batal"),
                            ),
                            TextButton(
                              onPressed: () {
                                deleteSelected();
                                Navigator.pop(ctx);
                              },
                              child: const Text("Hapus"),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.delete, color: Colors.white),
                    ),
                  ),
              ],
            ),

            const SizedBox(height: 20),

            // Tabel dengan header dan data
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: SingleChildScrollView(
                  child: Table(
                    // Lebar kolom
                    columnWidths: const {
                      0: FixedColumnWidth(50),
                      1: FixedColumnWidth(100),
                      2: FixedColumnWidth(100),
                      3: FlexColumnWidth(),
                      4: FixedColumnWidth(80),
                      5: FixedColumnWidth(40),
                    },
                    border: TableBorder.symmetric(
                      inside: const BorderSide(color: Colors.grey, width: 0.5),
                    ),
                    children: [
                      // Header
                      TableRow(
                        decoration: BoxDecoration(color: Colors.grey.shade300),
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Id",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Judul",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Kategori",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Detail",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Status",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(), // kosong untuk checkbox
                        ],
                      ),

                      // Data rows
                      for (final item in filteredItems)
                        TableRow(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(item['id'].toString()),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          DetailPage(judul: item['judul']),
                                    ),
                                  );
                                },
                                child: Text(
                                  item['judul'],
                                  style: const TextStyle(
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(item['kategori']),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(item['detail']),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: getStatusColor(
                                    item['status'],
                                  ).withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  item['status'],
                                  style: TextStyle(
                                    color: getStatusColor(item['status']),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Checkbox(
                                value: selectedIds.contains(item['id']),
                                onChanged: (val) {
                                  setState(() {
                                    if (val == true) {
                                      selectedIds.add(item['id'] as int);
                                    } else {
                                      selectedIds.remove(item['id']);
                                    }
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
