import 'package:flutter/material.dart';

class ProgressBelajarPage extends StatelessWidget {
  const ProgressBelajarPage({super.key});

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

          /// ICON BULAT
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      appBar: AppBar(
        title: const Text(
          "Progress Belajar",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "STATISTIK KOMPETENSI",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: Color(0xFF1F2937),
              ),
            ),
            const SizedBox(height: 20),

            /// 📌 CARD : Materi Diselesaikan
            buildStatCard(
              title: "Materi Diselesaikan",
              value: 0,
              label: "Selesai",
              color: Colors.green,
              icon: Icons.check_circle,
            ),

            /// 📌 CARD : Pending
            buildStatCard(
              title: "Pengajuan Pending",
              value: 0,
              label: "Pending",
              color: Colors.orange,
              icon: Icons.access_time,
            ),

            /// 📌 CARD : Materi Hari Ini
            buildStatCard(
              title: "Materi Hari Ini",
              value: 0,
              label: "Hari Ini",
              color: Colors.blue,
              icon: Icons.calendar_today,
            ),

            /// 📌 CARD : Revisi
            buildStatCard(
              title: "Materi Revisi",
              value: 0,
              label: "Revisi",
              color: Colors.purple,
              icon: Icons.refresh,
            ),

            const SizedBox(height: 10),
            const Divider(height: 40),

            const Text(
              "Progress Akademik",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: Color(0xFF1F2937),
              ),
            ),
            const SizedBox(height: 20),

            /// 📌 TABEL PROGRESS AKADEMIK
            Container(
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Column(
                children: [
                  buildRowProgress("Selesai", Colors.blue, 0),
                  buildRowProgress("Pending", Colors.deepPurple, 0),
                  buildRowProgress("Belum", Colors.blueGrey, 0),
                  buildRowProgress("Hari Ini", Colors.teal, 0),
                ],
              ),
            ),

            const SizedBox(height: 25),

            /// 📌 LIHAT PROGRESS
            Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Lihat Progress Kamu",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.blue,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Icon(Icons.arrow_forward, color: Colors.blue),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Belum ada kompetensi / progress",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.blue,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: const [
                      Text(
                        "Lihat semua Kompetensi ",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black87,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      Icon(Icons.arrow_forward, size: 18),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),
            const Center(
              child: Text(
                "© GEN-28 PPLG SMK Wikrama Bogor. All Rights Reserved.",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

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
}
