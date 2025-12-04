import 'package:flutter/material.dart';
import 'package:jurnalku/ProgresBelajar.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      // ========================= BODY =========================
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
                  // ========= HOME ICON CLICKABLE ==========
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DashboardPage()),
                      );
                    },
                    child: const Icon(
                      Icons.home,
                      size: 28,
                      color: Color(0xFF5B6B7A),
                    ),
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text(
                        "valenrio molordy",
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
                      "assets/images/profile.jpg",
                      width: 44,
                      height: 44,
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
                    Color(0xFF163B80),
                    Color(0xFF2A52B0),
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
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Solusi cerdas untuk memantau perkembangan kompetensi siswa secara efektif",
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

            // ---------------- CARD: APA ITU JURNALKU ----------------
            _buildCard(
              title: "Apa itu Jurnalku?",
              content:
                  "Jurnalku adalah aplikasi cerdas yang membantu guru dan siswa "
                  "dalam memantau kompetensi keahlian siswa secara efektif, terstruktur, "
                  "dan real-time.",
            ),

            const SizedBox(height: 18),

            // ---------------- FEATURE CARDS ----------------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: _featureMini(
                      icon: Icons.account_balance_outlined,
                      title: "Dirancang Khusus",
                      desc: "Memenuhi kebutuhan spesifik sekolah kami.",
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _featureMini(
                      icon: Icons.check_circle_outline,
                      title: "Efektif",
                      desc: "Memudahkan pemantauan secara real-time.",
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _featureMini(
                      icon: Icons.sync_alt,
                      title: "Terintegrasi",
                      desc: "Validasi dan laporan transparan.",
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 26),

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
            const SizedBox(height: 10),

            _buildMenuItem(
                Icons.person_outline, "Profil", "Lihat dan kelola profilmu di sini."),
            _buildMenuItem(Icons.work_outline, "Portofolio",
                "Lihat dan kelola portofolio."),
            _buildMenuItem(Icons.star_outline, "Sertifikat",
                "Lihat dan unduh sertifikat."),
            _buildMenuItem(Icons.menu_book_outlined, "Jurnal Pembiasaan",
                "Catat kegiatan harianmu."),
            _buildMenuItem(Icons.people_alt_outlined, "Permintaan Saksi",
                "Lihat daftar permintaan."),
            _buildMenuItem(Icons.bar_chart_outlined, "Progress",
                "Lihat pencapaian belajarmu."),
            _buildMenuItem(Icons.warning_amber_outlined, "Catatan Sikap",
                "Catatan sikap dari guru."),

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

            const SizedBox(height: 12),

            _buildStat(
              title: "Materi Diselesaikan",
              value: "0",
              color: const Color(0xFF2E7D32),
              label: "Selesai",
              icon: Icons.check_circle,
            ),

            _buildStat(
              title: "Pengajuan Pending",
              value: "0",
              color: const Color(0xFFEF6C00),
              label: "Pending",
              icon: Icons.access_time,
            ),

            _buildStat(
              title: "Materi Hari Ini",
              value: "0",
              color: const Color(0xFF1976D2),
              label: "Hari Ini",
              icon: Icons.calendar_today,
            ),

            _buildStat(
              title: "Materi Revisi",
              value: "0",
              color: const Color(0xFF8E24AA),
              label: "Revisi",
              icon: Icons.refresh,
            ),

            const SizedBox(height: 18),

            // ---------------- PROGRESS AKADEMIK ----------------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(0, 2))
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Progress Akademik",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 14),
                    _progressRow(Colors.indigo.shade700, "Selesai", "0"),
                    const SizedBox(height: 8),
                    _progressRow(Colors.indigo.shade300, "Pending", "0"),
                    const SizedBox(height: 8),
                    _progressRow(Colors.lightBlue.shade200, "Belum", "0"),
                    const SizedBox(height: 8),
                    _progressRow(Colors.teal.shade300, "Hari Ini", "0"),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 18),

                    // ---------------- LIHAT PROGRESS ----------------
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.blue.shade100),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 3,
                  offset: Offset(0, 1),
                )
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ========== TITLE CLICKABLE (BLUE TEXT WITH ARROW) ==========
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProgressBelajarPage(),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Lihat Progress Kamu",
                        style: TextStyle(
                          color: Colors.blue.shade800,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.arrow_right_alt,
                          color: Colors.blue.shade800, size: 26),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // ========== PROGRESS ITEM (SAMA SEPERTI DI FOTO) ==========
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Installasi Postman",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 6),
                      decoration: BoxDecoration(
                        color: const Color(0xFFD1F5D6),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        "Approved",
                        style: TextStyle(
                          color: Color(0xFF2E7D32),
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // ========== LINK LIHAT KOMPETENSI ==========
                GestureDetector(
                  onTap: () {
                    // TODO: Masuk ke halaman Kompetensi
                  },
                  child: Row(
                    children: [
                      Text(
                        "Lihat semua Kompetensi",
                        style: TextStyle(
                          color: Colors.blue.shade900,
                          fontSize: 14,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Icon(Icons.arrow_right_alt,
                          color: Colors.blue.shade900, size: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

            const SizedBox(height: 30),

            // ---------------- FOOTER ----------------
            Container(
              width: double.infinity,
              color: const Color(0xFFE8F0FF),
              padding: const EdgeInsets.symmetric(vertical: 18),
              child: const Center(
                child: Text(
                  "© GEN-28 PPLG SMK Wikrama Bogor. All Rights Reserved.",
                  style: TextStyle(color: Color(0xFF234A93)),
                ),
              ),
            ),
          ],
        ),
      ),

      // ==========================================================
      //                     BOTTOM NAVIGATION BAR
      // ==========================================================
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: Colors.blue.shade800,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined),
            label: "Dashboard",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book_outlined),
            label: "Jurnal",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Profil",
          ),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }

  // ==========================================================
  //                      COMPONENTS
  // ==========================================================

  Widget _buildCard({required String title, required String content}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF1E4AC0), Color(0xFF356DDF)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
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

  Widget _featureMini(
      {required IconData icon,
      required String title,
      required String desc}) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))
        ],
      ),
      child: Column(
        children: [
          Icon(icon, color: const Color(0xFF2A4EB0), size: 32),
          const SizedBox(height: 10),
          Text(title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Text(desc,
              textAlign: TextAlign.center,
              style:
                  const TextStyle(color: Colors.black54, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 3, offset: Offset(0, 2)),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: const Color(0xFF2A4EB0), size: 22),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(subtitle,
                      style: const TextStyle(
                          fontSize: 13, color: Colors.black54)),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios,
                size: 16, color: Colors.black38),
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
        padding:
            const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
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
                          const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 12),
                  Text(value,
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: color,
                      )),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                            color: color, shape: BoxShape.circle),
                      ),
                      const SizedBox(width: 8),
                      Text(label, style: TextStyle(color: color)),
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.12),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 26),
            )
          ],
        ),
      ),
    );
  }

  Widget _progressRow(Color dotColor, String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                    color: dotColor, shape: BoxShape.circle)),
            const SizedBox(width: 12),
            Text(label, style: const TextStyle(fontSize: 15)),
          ],
        ),
        Text(value,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
