import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int selectedTab = 0;

  // ================= DATA USER =================
  String nama = "MOH. WAKID";
  String email = "moh.wakid@uim.ac.id";
  String prodi = "S1 Teknik Informatika";
  String fakultas = "Teknik";

  // ================= DATA KELAS =================
  final List<Map<String, String>> kelasList = [
    {
      "nama": "DESAIN ANTARMUKA & PENGALAMAN PENGGUNA",
      "kode": "D4SM-42-03 [ADY]"
    },
    {
      "nama": "KEWARGANEGARAAN",
      "kode": "D4SM-41-GAB1 [BBO]"
    },
    {
      "nama": "SISTEM OPERASI",
      "kode": "D4SM-44-02 [DDS]"
    },
    {
      "nama": "PEMROGRAMAN MULTIMEDIA INTERAKTIF",
      "kode": "D4SM-43-04 [TPR]"
    },
  ];

  // ================= CONTROLLER EDIT =================
  final TextEditingController namaCtrl = TextEditingController();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController prodiCtrl = TextEditingController();
  final TextEditingController fakultasCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    namaCtrl.text = nama;
    emailCtrl.text = email;
    prodiCtrl.text = prodi;
    fakultasCtrl.text = fakultas;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(height: 260, color: Colors.blue),

          SafeArea(
            child: Column(
              children: [
                // ================= APPBAR =================
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back,
                        color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),

                const SizedBox(height: 10),

                // ================= FOTO =================
                const CircleAvatar(
                  radius: 48,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 44,
                    backgroundImage:
                        AssetImage("assets/images/profile.jpg"),
                  ),
                ),

                const SizedBox(height: 12),

                Text(
                  nama,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 16),

                // ================= TAB =================
                _buildTabs(),

                const SizedBox(height: 20),

                Expanded(child: _buildContent()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ================= TAB =================
  Widget _buildTabs() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 8)
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _tabItem("Tentang Saya", 0),
          _tabItem("Kelas", 1),
          _tabItem("Edit Profile", 2),
        ],
      ),
    );
  }

  Widget _tabItem(String title, int index) {
    final bool active = selectedTab == index;
    return InkWell(
      onTap: () => setState(() => selectedTab = index),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: active ? Colors.blue : Colors.black,
            ),
          ),
          if (active)
            Container(
              margin: const EdgeInsets.only(top: 6),
              width: 30,
              height: 3,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(2),
              ),
            )
        ],
      ),
    );
  }

  // ================= CONTENT SWITCH =================
  Widget _buildContent() {
    if (selectedTab == 0) return _aboutMe();
    if (selectedTab == 1) return _kelas();
    return _editProfile();
  }

  // ================= ABOUT ME =================
  Widget _aboutMe() {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        _info("Email", email),
        _info("Program Studi", prodi),
        _info("Fakultas", fakultas),
      ],
    );
  }

  // ================= KELAS =================
  Widget _kelas() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: kelasList.length,
      itemBuilder: (context, index) {
        final kelas = kelasList[index];
        return InkWell(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Masuk kelas ${kelas["nama"]}"),
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 14),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 6)
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 60,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade200,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        kelas["nama"]!,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        kelas["kode"]!,
                        style: const TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 2),
                      const Text(
                        "Mulai: 8 Februari 2021",
                        style: TextStyle(
                            fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // ================= EDIT PROFILE =================
  Widget _editProfile() {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        _input("Nama", namaCtrl),
        _input("Email", emailCtrl),
        _input("Program Studi", prodiCtrl),
        _input("Fakultas", fakultasCtrl),

        const SizedBox(height: 20),

        ElevatedButton(
          onPressed: () {
            setState(() {
              nama = namaCtrl.text;
              email = emailCtrl.text;
              prodi = prodiCtrl.text;
              fakultas = fakultasCtrl.text;
              selectedTab = 0;
            });

            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Profil berhasil diubah")),
            );
          },
          child: const Text("Simpan Perubahan"),
        )
      ],
    );
  }

  // ================= HELPER =================
  Widget _info(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style:
                  const TextStyle(fontWeight: FontWeight.bold)),
          Text(value),
        ],
      ),
    );
  }

  Widget _input(String label, TextEditingController ctrl) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        controller: ctrl,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}