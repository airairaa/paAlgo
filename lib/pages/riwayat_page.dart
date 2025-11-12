import 'package:flutter/material.dart';

class RiwayatPage extends StatefulWidget {
  const RiwayatPage({super.key});

  @override
  State<RiwayatPage> createState() => _RiwayatPageState();
}

class _RiwayatPageState extends State<RiwayatPage> {
  final TextEditingController searchController = TextEditingController();
  int _currentPage = 0;

  // Contoh data riwayat pengaduan
  final List<Map<String, dynamic>> _data = List.generate(15, (i) {
    return {
      'no': i + 1,
      'judul': i % 2 == 0 ? 'Wifi lemot' : 'AC Mati',
      'kategori': 'Fasilitas',
      'keluhan': 'Koneksi wifi lambat di ruang kelas',
      'status': i < 11 ? 'Done' : 'In Progress',
    };
  });

  // Fungsi filter data search (judul)
  List<Map<String, dynamic>> get filteredData {
    if (searchController.text.isEmpty) {
      return _data;
    }
    final query = searchController.text.toLowerCase();
    return _data
        .where((e) => e['judul'].toLowerCase().contains(query))
        .toList();
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  Widget _buildStatusBadge(String status) {
    Color color;
    if (status == 'Done') {
      color = Colors.green;
    } else if (status == 'In Progress') {
      color = Colors.amber;
    } else {
      color = Colors.grey;
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        status,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildTableRow(Map<String, dynamic> item) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade300, width: 1),
        ),
      ),
      child: Row(
        children: [
          SizedBox(width: 30, child: Text(item['no'].toString())),
          Expanded(flex: 3, child: Text(item['judul'])),
          Expanded(flex: 2, child: Text(item['kategori'])),
          Expanded(
            flex: 5,
            child: Text(
              item['keluhan'],
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          Container(
            width: 90,
            alignment: Alignment.centerRight,
            child: _buildStatusBadge(item['status']),
          ),
        ],
      ),
    );
  }

  Widget _buildTableHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      color: Colors.grey[200],
      child: Row(
        children: const [
          SizedBox(
            width: 30,
            child: Text('No.', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Expanded(
            flex: 3,
            child: Text('Judul', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'Kategori',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 5,
            child: Text(
              'Keluhan',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            width: 90,
            child: Text(
              'Status',
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/paper.jpg'), // Pastikan ada asset ini
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 20),

              // Logo di tengah atas
              Center(
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    // shape: BoxShape.circle,
                    // color: Colors.white,
                    // border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: ClipOval(
                    child: Image.asset('assets/logo.png', fit: BoxFit.cover),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Judul
              const Text(
                'Pengaduan Mahasiswa UPNVYK',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),

              const Text(
                'PENGAJUAN ADUAN',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 20),

              // Sub-judul Riwayat Pengaduan
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: const Text(
                  'Riwayat Pengaduan',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // Search bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: TextField(
                  controller: searchController,
                  onChanged: (value) => setState(() {}),
                  decoration: InputDecoration(
                    hintText: 'Cari berdasarkan Judul...',
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 16,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Tabel header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: _buildTableHeader(),
              ),

              const SizedBox(height: 4),

              // Data list scrollable
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Scrollbar(
                    thumbVisibility: true,
                    child: ListView.builder(
                      itemCount: filteredData.length,
                      itemBuilder: (context, index) {
                        return _buildTableRow(filteredData[index]);
                      },
                    ),
                  ),
                ),
              ),

              // Pagination dots (dummy 3 dots, active one sesuai _currentPage)
              Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    3,
                    (index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        //shape: BoxShape.circle,
                        //color: index == _currentPage
                        //   ? Colors.black
                        // : Colors.black26,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavIcon(IconData icon) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Icon(icon, color: Colors.black),
    );
  }
}
