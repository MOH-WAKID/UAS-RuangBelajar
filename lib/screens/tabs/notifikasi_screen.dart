import 'package:flutter/material.dart';

class NotifikasiScreen extends StatelessWidget {
  const NotifikasiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0B1220),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // ================= TITLE =================
              const Text(
                "Notifikasi",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 16),

              // ================= LIST NOTIFIKASI =================
              Expanded(
                child: ListView(
                  children: const [

                    NotifikasiItem(
                      icon: Icons.check_circle,
                      iconColor: Colors.green,
                      title: "Pertemuan Selesai",
                      description:
                          "Selamat! Anda telah menyelesaikan Pertemuan 1 pada mata kuliah Desain Antarmuka & UX.",
                      time: "Hari ini • 09:12",
                    ),

                    NotifikasiItem(
                      icon: Icons.quiz,
                      iconColor: Colors.orange,
                      title: "Kuis Dibuka",
                      description:
                          "Kuis Pertemuan 3 pada mata kuliah Sistem Operasi telah dibuka.",
                      time: "Kemarin • 08:30",
                    ),

                    NotifikasiItem(
                      icon: Icons.warning_amber_rounded,
                      iconColor: Colors.redAccent,
                      title: "Kuis Dibuka",
                      description:
                          "Kuis Pertemuan 2 pada mata kuliah Kewarganegaraan telah dibuka.",
                      time: "2 hari lalu • 16:00",
                    ),

                    NotifikasiItem(
                      icon: Icons.school,
                      iconColor: Colors.purpleAccent,
                      title: "Kelas Baru",
                      description:
                          "Anda telah terdaftar pada kelas Sistem Operasi Semester Genap.",
                      time: "3 hari lalu • 10:15",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ================= ITEM NOTIFIKASI =================
class NotifikasiItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String description;
  final String time;

  const NotifikasiItem({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.description,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xff111B2E),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // ICON
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.15),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 22),
          ),

          const SizedBox(width: 12),

          // TEXT
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 13,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  time,
                  style: const TextStyle(
                    color: Colors.white38,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}