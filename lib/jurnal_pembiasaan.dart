import 'package:flutter/material.dart';

class JurnalPembiasaanPage extends StatelessWidget {
  const JurnalPembiasaanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            const Text(
              "Jurnal Pembiasaan",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF212121),
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              "DESEMBER - 2025",
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF666666),
              ),
            ),
            const SizedBox(height: 20),

            // Bulan Sebelumnya Button
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.arrow_back, size: 18),
              label: const Text(
                "Bulan\nSebelumnya",
                style: TextStyle(fontSize: 13, height: 1.2),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1565C0),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // A. Pembiasaan harian
            const Text(
              "A. Pembiasaan harian",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF212121),
              ),
            ),
            const SizedBox(height: 16),

            // Legend
            Row(
              children: [
                _buildLegend(Colors.green, "Sudah diisi"),
                const SizedBox(width: 16),
                _buildLegend(Colors.grey, "Belum diisi"),
                const SizedBox(width: 16),
                _buildLegend(Colors.red, "Tidak diisi"),
              ],
            ),

            const SizedBox(height: 20),

            // Calendar Grid
            _buildCalendar(),

            const SizedBox(height: 30),

            // B. Pekerjaan yang dilakukan
            const Text(
              "B. Pekerjaan yang dilakukan",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF212121),
              ),
            ),
            const SizedBox(height: 16),

            _buildTableSection(
              headers: ["Pekerjaan", "Tgl", "Saksi"],
              emptyMessage: "Belum ada pekerjaan yang diinput.",
              addButtonText: "+ Tambah Pekerjaan",
            ),

            const SizedBox(height: 30),

            // C. Materi yang dipelajari
            const Text(
              "C. Materi yang dipelajari",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF212121),
              ),
            ),
            const SizedBox(height: 16),

            _buildTableSection(
              headers: ["Materi", "Sts", "Tgl"],
              emptyMessage: "Belum ada materi yang diinput.",
              addButtonText: "+ Tambah Materi",
            ),

            const SizedBox(height: 20),

            // Status Legend
            Row(
              children: [
                _buildStatusLegend(Colors.green, "A : Approved"),
                const SizedBox(width: 16),
                _buildStatusLegend(Colors.orange, "P : Pending"),
                const SizedBox(width: 16),
                _buildStatusLegend(Colors.red, "R : Revisi"),
              ],
            ),

            const SizedBox(height: 30),

            // D. Poin
            const Text(
              "D. Poin",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF212121),
              ),
            ),
            const SizedBox(height: 16),

            _buildPoinTable(),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildLegend(Color color, String text) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 6),
        Text(
          text,
          style: const TextStyle(
            fontSize: 13,
            color: Color(0xFF666666),
          ),
        ),
      ],
    );
  }

  Widget _buildStatusLegend(Color color, String text) {
    return Row(
      children: [
        Container(
          width: 14,
          height: 14,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 6),
        Text(
          text,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF666666),
          ),
        ),
      ],
    );
  }

  Widget _buildCalendar() {
    final days = [
      {'day': '01', 'status': 'empty'},
      {'day': '02', 'status': 'empty'},
      {'day': '03', 'status': 'empty'},
      {'day': '04', 'status': 'empty'},
      {'day': '05', 'status': 'empty'},
      {'day': '08', 'status': 'empty'},
      {'day': '09', 'status': 'empty'},
      {'day': '10', 'status': 'empty'},
      {'day': '11', 'status': 'empty'},
      {'day': '12', 'status': 'empty'},
      {'day': '15', 'status': 'empty'},
      {'day': '16', 'status': 'empty'},
      {'day': '17', 'status': 'empty'},
      {'day': '18', 'status': 'empty'},
      {'day': '19', 'status': 'empty'},
      {'day': '22', 'status': 'empty'},
      {'day': '23', 'status': 'empty'},
      {'day': '24', 'status': 'empty'},
      {'day': '25', 'status': 'empty'},
      {'day': '26', 'status': 'empty'},
      {'day': '29', 'status': 'empty'},
      {'day': '30', 'status': 'empty'},
      {'day': '31', 'status': 'empty'},
    ];

    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: days.map((dayData) {
        return _buildDayBox(dayData['day']!, dayData['status']!);
      }).toList(),
    );
  }

  Widget _buildDayBox(String day, String status) {
    Color bgColor;
    Color? iconColor;
    IconData? icon;

    switch (status) {
      case 'filled':
        bgColor = const Color(0xFFE8F5E9);
        iconColor = Colors.green;
        icon = Icons.check_circle;
        break;
      case 'not_filled':
        bgColor = const Color(0xFFFFEBEE);
        iconColor = Colors.red;
        icon = Icons.cancel;
        break;
      default:
        bgColor = const Color(0xFFE0E0E0);
        iconColor = null;
        icon = null;
    }

    return Container(
      width: 68,
      height: 50,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          Center(
            child: Text(
              day,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xFF424242),
              ),
            ),
          ),
          if (icon != null)
            Positioned(
              top: 4,
              right: 4,
              child: Icon(
                icon,
                size: 16,
                color: iconColor,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildTableSection({
    required List<String> headers,
    required String emptyMessage,
    required String addButtonText,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE0E0E0)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          // Header Row
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFFE8EAF6),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            child: Row(
              children: headers.map((header) {
                return Expanded(
                  flex: header == headers[0] ? 3 : 1,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border(
                        right: header != headers.last
                            ? const BorderSide(color: Color(0xFFE0E0E0))
                            : BorderSide.none,
                      ),
                    ),
                    child: Text(
                      header,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF424242),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

          // Empty Message
          Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Color(0xFFE0E0E0)),
              ),
            ),
            child: Text(
              emptyMessage,
              style: const TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                color: Color(0xFF9E9E9E),
              ),
            ),
          ),

          // Add Button
          InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(14),
              width: double.infinity,
              child: Text(
                addButtonText,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF1565C0),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPoinTable() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE0E0E0)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          // Header Row
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFFE8EAF6),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      border: Border(
                        right: BorderSide(color: Color(0xFFE0E0E0)),
                      ),
                    ),
                    child: const Text(
                      "Kategori Poin",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF424242),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    alignment: Alignment.center,
                    child: const Text(
                      "Jumlah Poin",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF424242),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Sub-header for Jumlah Poin
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFFF5F5F5),
              border: Border(
                bottom: BorderSide(color: Color(0xFFE0E0E0)),
              ),
            ),
            child: Row(
              children: [
                const Expanded(flex: 3, child: SizedBox()),
                ...['M1', 'M2', 'M3', 'M4'].map((month) {
                  return Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: const BoxDecoration(
                        border: Border(
                          left: BorderSide(color: Color(0xFFE0E0E0)),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        month,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF666666),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ],
            ),
          ),

          // Data Rows
          _buildPoinRow(
            "(5) mengerjakan project/adanya update progress belajar",
            ['0', '0', '0', '0'],
          ),
          _buildPoinRow(
            "(1 - 5) poin dari pertanyaan atau laporan pengetahuan materi",
            ['0', '0', '0', '0'],
          ),
          _buildPoinRow(
            "Jumlah poin minggu ini",
            ['0', '0', '0', '0'],
            isBold: true,
            isLast: false,
          ),
          _buildMergedPoinRow(
            "Jumlah poin ceklist pembiasaan",
            '1',
            isLast: false,
          ),
          _buildMergedPoinRow(
            "Jumlah keseluruhan poin",
            '1',
            isLast: true,
          ),
        ],
      ),
    );
  }

  Widget _buildPoinRow(String label, List<String> values,
      {bool isBold = false, bool isLast = false}) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: !isLast
              ? const BorderSide(color: Color(0xFFE0E0E0))
              : BorderSide.none,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                border: Border(
                  right: BorderSide(color: Color(0xFFE0E0E0)),
                ),
              ),
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 13,
                  color: const Color(0xFF616161),
                  fontWeight: isBold ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
            ),
          ),
          ...values.map((value) {
            return Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: const BoxDecoration(
                  border: Border(
                    left: BorderSide(color: Color(0xFFE0E0E0)),
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  value,
                  style: TextStyle(
                    fontSize: 14,
                    color: value == '1'
                        ? const Color(0xFF1565C0)
                        : const Color(0xFF666666),
                    fontWeight:
                        isBold || value == '1' ? FontWeight.w600 : FontWeight.normal,
                  ),
                ),
              ),
            );
          }).toList(),
        ],
      ),
    );
  }

  Widget _buildMergedPoinRow(String label, String value,
      {bool isLast = false}) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: !isLast
              ? const BorderSide(color: Color(0xFFE0E0E0))
              : BorderSide.none,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              decoration: const BoxDecoration(
                border: Border(
                  right: BorderSide(color: Color(0xFFE0E0E0)),
                ),
              ),
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 13,
                  color: Color(0xFF616161),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(color: Color(0xFFE0E0E0)),
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                value,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF1565C0),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}