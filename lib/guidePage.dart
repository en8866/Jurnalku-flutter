import 'package:flutter/material.dart';
import 'navbar.dart'; // Import your navbar

class GuidePage extends StatelessWidget {
  const GuidePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,



      appBar: CustomNavBar(
        userName: 'Valen', 
        userSubtitle: 'PPLG XII-3', 
        onHomeTap: () {
          Navigator.pop(context); 
        },
      ),



      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ICON + JUDUL
            Row(
              children: const [
                Icon(Icons.menu_book_outlined,
                    color: Color(0xFF1565C0), size: 28),
                SizedBox(width: 10),
                Text(
                  "Panduan Penggunaan",
                  style: TextStyle(
                    color: Color(0xFF1565C0),
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            const Text(
              "Selamat datang di panduan penggunaan aplikasi Jurnalku. "
              "Panduan ini akan membantu Anda memahami cara menggunakan "
              "fitur-fitur yang tersedia dengan optimal.",
              style: TextStyle(
                color: Color(0xFF666666),
                height: 1.5,
                fontSize: 14,
              ),
            ),

            const SizedBox(height: 30),

            _buildSectionTitle("Umum"),
            const SizedBox(height: 10),

            const GuideCard(
              icon: Icons.person_outline,
              title: "Unggah Profile",
              subtitle: "Panduan untuk mengunggah profile pengguna",
            ),
            const GuideCard(
              icon: Icons.lock_outline,
              title: "Ganti Password",
              subtitle: "Panduan untuk mengganti password pengguna",
            ),

            const SizedBox(height: 30),

            _buildSectionTitle("Untuk Siswa"),
            const SizedBox(height: 10),

            const GuideCard(
              icon: Icons.book_outlined,
              title: "Mengisi Jurnal",
              subtitle: "Panduan untuk mengisi kegiatan sehari - hari",
            ),
            const GuideCard(
              icon: Icons.person_pin_outlined,
              title: "Kelengkapan Profile",
              subtitle: "Panduan untuk melengkapi profile",
            ),
            const GuideCard(
              icon: Icons.folder_copy_outlined,
              title: "Mengelola Portfolio",
              subtitle: "Panduan untuk menambah, edit, dan hapus portfolio",
            ),
            const GuideCard(
              icon: Icons.badge_outlined,
              title: "Mengelola Sertifikat",
              subtitle: "Panduan untuk menambah, edit, dan hapus sertifikat",
            ),
            const GuideCard(
              icon: Icons.fact_check_outlined,
              title: "Catatan Sikap Saya",
              subtitle: "Panduan untuk melihat dan memahami catatan sikap",
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  static Widget _buildSectionTitle(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Color(0xFF212121),
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}


class GuideCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const GuideCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFF1565C0).withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: const Color(0xFF1565C0), size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF212121),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Color(0xFF666666),
                    fontSize: 13,
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