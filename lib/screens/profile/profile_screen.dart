import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Stack(
        children: [

          // ================= HEADER MERAH =================
          Container(
            height: 260,
            color: Colors.blue,
          ),

          SafeArea(
            child: Column(
              children: [

                // ================= APPBAR =================
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back,
                            color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                // ================= FOTO & NAMA =================
                CircleAvatar(
                  radius: 48,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 44,
                    backgroundImage:
                        AssetImage("assets/images/profile.jpg"),
                  ),
                ),

                const SizedBox(height: 12),

                const Text(
                  "DANDY CANDRA PRATAMA",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 16),

                // ================= TAB =================
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      _TabItem(title: "About Me", active: true),
                      _TabItem(title: "Kelas"),
                      _TabItem(title: "Edit Profile"),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // ================= CONTENT =================
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        _sectionTitle("Informasi User"),
                        _infoItem("Email address",
                            "dandycandra@365.telkomuniversity.ac.id"),
                        _infoItem("Program Studi",
                            "D4 Teknologi Rekayasa Multimedia"),
                        _infoItem("Fakultas", "FIT"),

                        const SizedBox(height: 24),

                        _sectionTitle("Aktivitas Login"),
                        _infoItem(
                          "First access to site",
                          "Monday, 7 September 2020, 9:27 AM",
                        ),
                        _infoItem(
                          "Last access to site",
                          "Tuesday, 22 June 2021, 9:44 PM",
                        ),

                        const SizedBox(height: 40),

                        // ================= LOGOUT =================
                        Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 12),
                            ),
                            icon: const Icon(Icons.logout),
                            label: const Text("Log Out"),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),

                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ================= WIDGET =================
  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _infoItem(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  fontWeight: FontWeight.w600)),
          const SizedBox(height: 4),
          Text(value),
        ],
      ),
    );
  }
}

class _TabItem extends StatelessWidget {
  final String title;
  final bool active;

  const _TabItem({required this.title, this.active = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: active ? Colors.blue : Colors.black),
        ),
        const SizedBox(height: 6),
        if (active)
          Container(
            width: 30,
            height: 3,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(2),
            ),
          )
      ],
    );
  }
}