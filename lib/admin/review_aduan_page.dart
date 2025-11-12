import 'package:flutter/material.dart';

class ReviewAduanPage extends StatelessWidget {
  const ReviewAduanPage({super.key});

  @override
  Widget build(BuildContext context) {
    final feedbackController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Review Aduan")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text("Isi Aduan: Lampu rusak di kelas 302"),
            const SizedBox(height: 20),
            TextField(
              controller: feedbackController,
              decoration: const InputDecoration(
                labelText: "Tulis Feedback untuk User",
                border: OutlineInputBorder(),
              ),
              maxLines: 4,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Feedback dikirim ke User")),
                );
                Navigator.pop(context);
              },
              child: const Text("Kirim Feedback"),
            ),
          ],
        ),
      ),
    );
  }
}
