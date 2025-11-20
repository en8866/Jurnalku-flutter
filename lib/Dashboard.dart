import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ---------------- HEADER ----------------
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.home, size: 28),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text(
                        "Valenrio malordy",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "PPLG XII-3",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  ClipOval(
                    child: Image.asset(
                      "assets/profile.jpg", // Ganti dengan gambar profil
                      width: 20,
                      height: 20,
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
            ),

            // ---------------- HERO BANNER ----------------
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF123A9F),
                    Color(0xFF1A43C4),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                children: const [
                  Text(
                    "Selamat Datang di Jurnalku",
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Solusi cerdas untuk memantau perkembangan\nkompetensi siswa secara efektif",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ---------------- APA ITU JURNALKU ----------------
            _buildCard(
              title: "Apa itu Jurnalku?",
              content:
                  "Jurnalku adalah aplikasi cerdas yang membantu guru dan siswa "
                  "dalam memantau kompetensi keahlian siswa secara efektif, terstruktur, "
                  "dan real-time. Dengan fitur lengkap, proses pemantauan lebih mudah dan transparan.",
            ),

            const SizedBox(height: 15),

            // ---------------- FITUR FITUR ----------------
            _buildFeature(
              icon: Icons.school_outlined,
              title: "Dirancang Khusus",
              desc:
                  "Memenuhi kebutuhan spesifik sekolah kami dengan fokus pada kemajuan siswa.",
            ),

            _buildFeature(
              icon: Icons.military_tech_outlined,
              title: "Efektif",
              desc:
                  "Memudahkan siswa dan guru melihat perkembangan secara real-time.",
            ),

            _buildFeature(
              icon: Icons.layers_outlined,
              title: "Terintegrasi",
              desc:
                  "Pengajuan kompetensi, validasi dan laporan perkembangan yang transparan.",
            ),

            const SizedBox(height: 30),

            // ---------------- MENU APLIKASI ----------------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Text(
                "MENU APLIKASI",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
            ),

            _buildMenuItem(Icons.person_outline, "Profil",
                "Lihat dan kelola profilmu di sini."),

            _buildMenuItem(Icons.work_outline, "Portofolio",
                "Lihat dan kelola portofolio kompetensimu di sini."),

            _buildMenuItem(Icons.star_outline, "Sertifikat",
                "Lihat dan unduh sertifikat kompetensimu di sini."),

            _buildMenuItem(Icons.menu_book_outlined, "Jurnal Pembiasaan",
                "Catat dan pantau kegiatan pembiasaan harianmu."),

            _buildMenuItem(Icons.people_alt_outlined, "Permintaan Saksi",
                "Lihat teman yang mengajukan permintaan saksi."),

            _buildMenuItem(Icons.bar_chart_outlined, "Progress",
                "Lihat kemajuan kompetensi dan pencapaian belajarmu."),

            _buildMenuItem(Icons.warning_amber_outlined, "Catatan Sikap",
                "Lihat catatan sikap dan perilaku dari guru."),

            const SizedBox(height: 20),

            // ---------------- STATISTIK ----------------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Text(
                "STATISTIK KOMPETENSI",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
            ),

            _buildStat(
              title: "Materi Diselesaikan",
              value: "0",
              color: Colors.green,
              label: "Selesai",
              icon: Icons.check_circle,
            ),

            _buildStat(
              title: "Pengajuan Pending",
              value: "0",
              color: Colors.orange,
              label: "Pending",
              icon: Icons.access_time,
            ),

            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  // ------------------- COMPONENTS -------------------

  Widget _buildCard({required String title, required String content}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF1E4AC0), Color(0xFF356DDF)],
          ),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text(content,
                style: const TextStyle(fontSize: 14, color: Colors.white70)),
          ],
        ),
      ),
    );
  }

  Widget _buildFeature(
      {required IconData icon, required String title, required String desc}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
          ],
        ),
        child: Column(
          children: [
            Icon(icon, color: Colors.blue[800], size: 40),
            const SizedBox(height: 15),
            Text(title,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text(
              desc,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, color: Colors.black54),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 3, offset: Offset(0, 2)),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: Colors.blue, size: 28),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style:
                          const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(subtitle,
                      style: const TextStyle(fontSize: 13, color: Colors.black54)),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.black45),
          ],
        ),
      ),
    );
  }

  Widget _buildStat({
    required String title,
    required String value,
    required Color color,
    required String label,
    required IconData icon,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style:
                          const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(value,
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: color,
                      )),
                  Text(label, style: TextStyle(color: color)),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(color: color.withOpacity(0.15), shape: BoxShape.circle),
              child: Icon(icon, color: color),
            )
          ],
        ),
      ),
    );
  }
}
