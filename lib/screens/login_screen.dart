import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0B1220),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60),

            Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                color: Colors.blueGrey[700],
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Center(
                child: Text(
                  "Ruang Belajar",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              "Selamat Datang\nKembali",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            const Text(
              "Masuk untuk melanjutkan pembelajaran Anda hari ini.",
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 25),

            const Text("Email", style: TextStyle(color: Colors.white)),
            const SizedBox(height: 8),

            TextField(
              controller: emailController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white10,
                prefixIcon: const Icon(Icons.email, color: Colors.white),
                hintText: "nama@sekolah.id",
                hintStyle: const TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text("Kata Sandi", style: TextStyle(color: Colors.white)),
            const SizedBox(height: 8),

            TextField(
              obscureText: true,
              controller: passController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white10,
                prefixIcon: const Icon(Icons.lock, color: Colors.white),
                suffixIcon: const Icon(Icons.visibility, color: Colors.white),
                hintText: "Masukkan kata sandi",
                hintStyle: const TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "Masuk  →",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Center(
              child: Text(
                "Butuh Bantuan?",
                style: TextStyle(color: Colors.blue[300]),
              ),
            )
          ],
        ),
      ),
    );
  }
}