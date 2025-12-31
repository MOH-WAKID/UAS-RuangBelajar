import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0B1220),
      appBar: AppBar(title: const Text("Beranda")),
      body: const Center(
        child: Text("Ini Halaman Home", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}