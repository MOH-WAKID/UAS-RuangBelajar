import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  final String judulMateri;

  const QuizScreen({super.key, required this.judulMateri});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int indexSoal = 0;
  int skor = 0;

  final List<Map<String, dynamic>> soal = [
    {
      "pertanyaan": "Apa tujuan utama UI Design?",
      "jawaban": [
        {"text": "Mempercantik tampilan", "benar": false},
        {"text": "Memudahkan pengguna", "benar": true},
        {"text": "Menambah animasi", "benar": false},
      ]
    },
    {
      "pertanyaan": "UI berhubungan dengan?",
      "jawaban": [
        {"text": "Antarmuka pengguna", "benar": true},
        {"text": "Database", "benar": false},
        {"text": "Server", "benar": false},
      ]
    },
  ];

  void jawab(bool benar) {
    if (benar) skor++;

    if (indexSoal < soal.length - 1) {
      setState(() {
        indexSoal++;
      });
    } else {
      _selesai();
    }
  }

  void _selesai() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Quiz Selesai"),
        content: Text("Skor kamu: $skor / ${soal.length}"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final data = soal[indexSoal];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(widget.judulMateri),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Soal ${indexSoal + 1} / ${soal.length}",
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 12),
            Text(
              data["pertanyaan"],
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),

            ...(data["jawaban"] as List).map((j) {
              return Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 12),
                child: ElevatedButton(
                  onPressed: () => jawab(j["benar"]),
                  child: Text(j["text"]),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}