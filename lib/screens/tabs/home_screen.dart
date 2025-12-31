import 'package:flutter/material.dart';
import '../profile/profile_screen.dart';

class AppColors {
  static const background = Color(0xff0B1220);
  static const cardDark = Color(0xff111B2E);

  static const primaryBlue = Colors.blue;
  static const primaryBlueAccent = Colors.blueAccent;

  static const textWhite = Colors.white;
  static const textWhite70 = Colors.white70;
}

class BerandaScreen extends StatelessWidget {
  const BerandaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // ================= HEADER =================
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Colors.blue,
                      Colors.blueAccent,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Row(
                  children: [
                    // AVATAR
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.25),
                      ),
                      child: const Center(
                        child: Text(
                          "MW",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 12),

                    // NAMA
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Selamat Datang",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "MOH. WAKID",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.4,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // BUTTON PROFILE
                    InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ProfileScreen(),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Row(
                          children: [
                            Text(
                              "Mahasiswa",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 12),
                            ),
                            SizedBox(width: 6),
                            Icon(Icons.person,
                                color: Colors.white, size: 16),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // ================= TUGAS =================
              const Text(
                "Tugas Yang Akan Datang",
                style: TextStyle(
                  color: AppColors.textWhite,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.primaryBlue,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "DESAIN ANTARMUKA & UX",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 6),
                    Text(
                      "Tugas 01 - UI Design Mobile App",
                      style: TextStyle(color: Colors.white70),
                    ),
                    SizedBox(height: 12),
                    Text(
                      "Deadline\nJumat, 26 Februari 23:59 WIB",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // ================= PENGUMUMAN =================
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Pengumuman",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Lihat Semua",
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              Container(
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: const DecorationImage(
                    image: NetworkImage(
                      "https://images.unsplash.com/photo-1522202176988-66273c2fd55f",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.black.withOpacity(0.4),
                  ),
                  child: const Center(
                    child: Text(
                      "Kuis Pertemuan 3 Telah Dibuka.\n" 
                      "Silakan kerjakan sebelum pukul 23:59 WIB",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // ================= PROGRES =================
              const Text(
                "Progres Kelas",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 12),

              _kelasItem(
                title: "DESAIN ANTARMUKA & UX",
                percent: 0.89,
              ),
              _kelasItem(
                title: "KEWARGANEGARAAN",
                percent: 0.86,
              ),
              _kelasItem(
                title: "SISTEM OPERASI",
                percent: 0.90,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ================= ITEM PROGRES =================
  Widget _kelasItem({required String title, required double percent}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.cardDark,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: percent,
            minHeight: 6,
            backgroundColor: Colors.white24,
            color: Colors.blue,
          ),
          const SizedBox(height: 6),
          Text(
            "${(percent * 100).toInt()} % Selesai",
            style:
                const TextStyle(color: Colors.white70, fontSize: 12),
          ),
        ],
      ),
    );
  }
}