import 'package:flutter/material.dart';

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
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ================= HEADER =================
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.primaryBlue,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Halo,",
                          style: TextStyle(color: AppColors.textWhite70),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "DANDY CANDRA PRATAMA",
                          style: TextStyle(
                            color: AppColors.textWhite,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.primaryBlueAccent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      children: [
                        Text(
                          "MAHASISWA",
                          style: TextStyle(
                              color: AppColors.textWhite, fontSize: 12),
                        ),
                        SizedBox(width: 6),
                        Icon(Icons.person,
                            color: AppColors.textWhite, size: 18),
                      ],
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(height: 20),

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
                    "DESAIN ANTARMUKA & PENGALAMAN PENGGUNA",
                    style: TextStyle(
                        color: AppColors.textWhite,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "Tugas 01 - UID Android Mobile Game",
                    style: TextStyle(color: AppColors.textWhite70),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Waktu Pengumpulan\nJumat 26 Februari, 23:59 WIB",
                    style: TextStyle(color: AppColors.textWhite),
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
                  "Pengumuman Terakhir",
                  style: TextStyle(
                      color: AppColors.textWhite,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Lihat Semua",
                  style: TextStyle(color: AppColors.primaryBlue),
                ),
              ],
            ),

            const SizedBox(height: 12),

            Container(
              height: 120,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Center(
                child: Text(
                  "Maintenance LMS",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // ================= PROGRES =================
            const Text(
              "Progres Kelas",
              style: TextStyle(
                  color: AppColors.textWhite,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            _kelasItem(
              title: "DESAIN ANTARMUKA & PENGALAMAN PENGGUNA",
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
            style: const TextStyle(color: AppColors.textWhite),
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: percent,
            minHeight: 6,
            backgroundColor: Colors.white24,
            color: AppColors.primaryBlue,
          ),
          const SizedBox(height: 6),
          Text(
            "${(percent * 100).toInt()} % Selesai",
            style:
                const TextStyle(color: AppColors.textWhite70, fontSize: 12),
          ),
        ],
      ),
    );
  }
}