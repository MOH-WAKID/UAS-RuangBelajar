import 'package:flutter/material.dart';
import '/screens/quiz_screen.dart';

class KelasScreen extends StatelessWidget {
  const KelasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Kelas Saya",
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [

          // ================= DESAIN ANTARMUKA =================
          JudulKelas(title: "DESAIN ANTARMUKA & UX"),
          MateriItem(
            pertemuan: "Pertemuan 1",
            judul: "Pengantar UI Design",
            info: "Materi & Quiz",
            selesai: true,
          ),
          MateriItem(
            pertemuan: "Pertemuan 2",
            judul: "Prinsip UI Design",
            info: "Materi & Quiz",
            selesai: true,
          ),
          MateriItem(
            pertemuan: "Pertemuan 3",
            judul: "Interaksi Pengguna",
            info: "Materi & Quiz",
            selesai: false,
          ),

          SizedBox(height: 24),

          // ================= KEWARGANEGARAAN =================
          JudulKelas(title: "KEWARGANEGARAAN"),
          MateriItem(
            pertemuan: "Pertemuan 1",
            judul: "Pancasila dan Nilai Bangsa",
            info: "Materi & Quiz",
            selesai: true,
          ),
          MateriItem(
            pertemuan: "Pertemuan 2",
            judul: "Hak dan Kewajiban Warga Negara",
            info: "Materi & Quiz",
            selesai: false,
          ),
          MateriItem(
            pertemuan: "Pertemuan 3",
            judul: "Demokrasi di Indonesia",
            info: "Materi & Quiz",
            selesai: false,
          ),

          SizedBox(height: 24),

          // ================= SISTEM OPERASI =================
          JudulKelas(title: "SISTEM OPERASI"),
          MateriItem(
            pertemuan: "Pertemuan 1",
            judul: "Pengantar Sistem Operasi",
            info: "Materi & Quiz",
            selesai: true,
          ),
          MateriItem(
            pertemuan: "Pertemuan 2",
            judul: "Manajemen Proses",
            info: "Materi & Quiz",
            selesai: false,
          ),
          MateriItem(
            pertemuan: "Pertemuan 3",
            judul: "Manajemen Memori",
            info: "Materi & Quiz",
            selesai: false,
          ),
        ],
      ),
    );
  }
}

// ================= JUDUL KELAS =================
class JudulKelas extends StatelessWidget {
  final String title;

  const JudulKelas({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

// ================= ITEM MATERI =================
class MateriItem extends StatelessWidget {
  final String pertemuan;
  final String judul;
  final String info;
  final bool selesai;

  const MateriItem({
    super.key,
    required this.pertemuan,
    required this.judul,
    required this.info,
    required this.selesai,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
onTap: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => QuizScreen(
        judulMateri: judul,
      ),
    ),
  );
},

      child: Container(
        margin: const EdgeInsets.only(bottom: 14),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 6,
            ),
          ],
        ),
        child: Row(
          children: [
            // LEFT
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                pertemuan,
                style: const TextStyle(
                    color: Colors.white, fontSize: 12),
              ),
            ),

            const SizedBox(width: 12),

            // CENTER
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    judul,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    info,
                    style: const TextStyle(
                        fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),

            // RIGHT
            Icon(
              selesai
                  ? Icons.check_circle
                  : Icons.radio_button_unchecked,
              color: selesai ? Colors.green : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}