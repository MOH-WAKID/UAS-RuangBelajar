import 'package:flutter/material.dart';
import 'dart:async';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double progress = 0;

  @override
  void initState() {
    super.initState();

    Timer.periodic(const Duration(milliseconds: 120), (timer) {
      if (!mounted) return;

      setState(() {
        progress += 5;
      });

      if (progress >= 100) {
        timer.cancel();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => LoginScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0B1220),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.05),
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Icon(
                Icons.school,
                color: Colors.white,
                size: 45,
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              "Ruang Belajar",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "Solusi cerdas untuk belajar",
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 60),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "LOADING RESOURCES",
                      style: TextStyle(
                        color: Colors.blue[300],
                        letterSpacing: 2,
                      ),
                    ),
                  ),

                  const SizedBox(height: 8),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: LinearProgressIndicator(
                      minHeight: 8,
                      value: progress / 100,
                      color: Colors.blue,
                      backgroundColor: Colors.white24,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    "${progress.toInt()}%",
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}