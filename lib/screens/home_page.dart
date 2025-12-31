import 'package:flutter/material.dart';
import 'tabs/beranda_screen.dart';
import 'tabs/kursus_screen.dart';
import 'tabs/pesan_screen.dart';
import 'tabs/profil_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  final pages = const [
    BerandaScreen(),
    KursusScreen(),
    PesanScreen(),
    ProfilScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0B1220),

      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xff111B2E),
        currentIndex: currentIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() => currentIndex = index);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Beranda"),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: "Kursus Saya"),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "Pesan"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
        ],
      ),
    );
  }
}