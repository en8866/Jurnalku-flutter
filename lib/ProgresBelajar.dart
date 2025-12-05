import 'package:flutter/material.dart';
import 'navbar.dart';

class ProgressBelajarPage extends StatefulWidget {
  const ProgressBelajarPage({super.key});

  @override
  State<ProgressBelajarPage> createState() => _ProgressBelajarPageState();
}

class _ProgressBelajarPageState extends State<ProgressBelajarPage> {
  Map<String, bool> expanded = {};

  Widget buildStatCard({
    required String title,
    required int value,
    required String label,
    required Color color,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF374151),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                value.toString(),
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              Row(
                children: [
                  Icon(Icons.circle, color: color, size: 10),
                  const SizedBox(width: 5),
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 14,
                      color: color,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: color.withOpacity(0.12),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 28, color: color),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // CARD KOMPETENSI
  // ============================================================
  Widget buildCompetencyCard({
    required String title,
    required String subtitle,
  }) {
    expanded.putIfAbsent(title, () => false);

    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                expanded[title] = !expanded[title]!;
              });
            },
            behavior: HitTestBehavior.opaque,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1F2937),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF6B7280),
                      ),
                    ),
                  ],
                ),
                AnimatedRotation(
                  turns: expanded[title]! ? 0.5 : 0,
                  duration: const Duration(milliseconds: 200),
                  child: const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 28,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 14),

          AnimatedCrossFade(
            firstChild: const SizedBox.shrink(),
            secondChild: buildExpandedContent(),
            crossFadeState: expanded[title]!
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 250),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // EXPANDED — UDAH DIUBAH SESUAI PERINTAH
  // ============================================================
  Widget buildExpandedContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),

        // HEADER TABEL (TETAP ADA)
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: const [
              _HeaderCell("KOMPETENSI", width: 110),
              _HeaderCell("GURU", width: 80),
              _HeaderCell("TANGGAL", width: 90),
              _HeaderCell("STATUS", width: 80),
              _HeaderCell("Catatan Guru", width: 140),
              _HeaderCell("Catatan Siswa", width: 140),
            ],
          ),
        ),

        const SizedBox(height: 20),

        // ===========================
        //   DIGANTI -> BELUM ADA MATERI
        // ===========================
        const Center(
          child: Text(
            "Belum ada materi",
            style: TextStyle(
              fontSize: 14,
              color: Colors.black54,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),

        const SizedBox(height: 12),
      ],
    );
  }

  // ============================================================
  // SUPPORT WIDGETS
  // ============================================================
  Widget buildRowProgress(String text, Color color, int value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.circle, size: 12, color: color),
              const SizedBox(width: 10),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xFF374151),
                ),
              ),
            ],
          ),
          Text(
            value.toString(),
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF374151),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  String _getCurrentDate() {
    final now = DateTime.now();
    final days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
    final months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];

    final dayName = days[now.weekday - 1];
    final monthName = months[now.month - 1];

    return '$dayName, ${now.day} $monthName ${now.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomNavBar(
        userName: 'Valen',
        userSubtitle: 'PPLG XII-3',
      ),
      backgroundColor: const Color(0xFFF6F7FB),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Progress Belajar",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: Color(0xFF1F2937),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Pantau perkembangan kompetensi dan materi pembelajaran Anda",
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF6B7280),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              _getCurrentDate(),
              style: const TextStyle(
                fontSize: 14,
                color: Colors.blue,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 24),

            buildStatCard(
              title: "Total Pengajuan",
              value: 1,
              label: "Semua status",
              color: Colors.blue,
              icon: Icons.check_circle_outline,
            ),
            buildStatCard(
              title: "Halaman Ini",
              value: 0,
              label: "Data ditampilkan",
              color: Colors.green,
              icon: Icons.description_outlined,
            ),
            buildStatCard(
              title: "Status Pending",
              value: 0,
              label: "Perlu validasi",
              color: Colors.orange,
              icon: Icons.access_time,
            ),
            buildStatCard(
              title: "Total Halaman",
              value: 1,
              label: "Navigasi tersedia",
              color: Colors.purple,
              icon: Icons.layers_outlined,
            ),

            const SizedBox(height: 20),

            buildCompetencyCard(
              title: "Project Work",
              subtitle: "Kompetensi dan materi pembelajaran",
            ),
            buildCompetencyCard(
              title: "Mobile Apps",
              subtitle: "Kompetensi dan materi pembelajaran",
            ),
            buildCompetencyCard(
              title: "UKK (Uji Kompetensi Keahlian)",
              subtitle: "Kompetensi dan materi pembelajaran",
            ),
            buildCompetencyCard(
              title: "GIM",
              subtitle: "Kompetensi dan materi pembelajaran",
            ),

            const SizedBox(height: 40),
            const Center(
              child: Text(
                "© GEN-28 PPLG SMK Wikrama Bogor. All Rights Reserved.",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// SUB WIDGET
// ============================================================

class _HeaderCell extends StatelessWidget {
  final String title;
  final double width;

  const _HeaderCell(this.title, {this.width = 100, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(vertical: 6),
      alignment: Alignment.center,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 11,
          color: Color(0xFF9CA3AF),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _DataCell extends StatelessWidget {
  final String text;
  final double width;

  const _DataCell(this.text, {this.width = 100, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(vertical: 8),
      alignment: Alignment.center,
      child: Text(
        text,
        style: const TextStyle(fontSize: 12),
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final String text;
  final Color color;

  const _StatusBadge(this.text, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(50),
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
