import 'package:flutter/material.dart';

class CatatanSikapPage extends StatefulWidget {
  const CatatanSikapPage({super.key});

  @override
  State<CatatanSikapPage> createState() => _CatatanSikapPageState();
}

class _CatatanSikapPageState extends State<CatatanSikapPage> {

  @override
  Widget build(BuildContext context) {
    // Get screen width to determine if mobile or tablet/desktop
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    
    // Sample data - replace with actual data
    final List<Map<String, dynamic>> catatanList = [
      // Empty list for now - when you have data, uncomment below
      // {
      //   'no': 1,
      //   'kategori': 'Kedisiplinan',
      //   'catatan': 'Terlambat masuk kelas',
      //   'status': 'Dalam Perbaikan',
      //   'dilaporkan': '12 Nov 2024',
      //   'updateTerakhir': '15 Nov 2024',
      // },
    ];
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color: const Color(0xFFF9FAFB),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(isMobile ? 16.0 : 32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Catatan Sikap Saya',
                  style: TextStyle(
                    fontSize: isMobile ? 24 : 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Lihat catatan sikap dan perilaku yang telah dilaporkan',
                  style: TextStyle(
                    fontSize: isMobile ? 13 : 15,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 20),
                
                // Warning Box
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFBEB),
                    border: Border.all(color: const Color(0xFFFEF3C7)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.warning_amber_rounded,
                        color: Color(0xFFF59E0B),
                        size: 22,
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Perhatian',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF92400E),
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Jika Anda merasa ada catatan yang tidak sesuai atau keliru, silakan hubungi guru jurusan untuk mengajukan klarifikasi.',
                              style: TextStyle(
                                color: const Color(0xFF92400E),
                                fontSize: isMobile ? 12 : 13,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 20),
                
                // Stats Cards - Responsive Grid
                isMobile
                    ? Column(
                        children: [
                          _buildStatCard(
                            'Total Catatan',
                            '${catatanList.length}',
                            Icons.description_outlined,
                            const Color(0xFFEFF6FF),
                            const Color(0xFF3B82F6),
                            isMobile: true,
                          ),
                          const SizedBox(height: 12),
                          _buildStatCard(
                            'Dalam Perbaikan',
                            '0',
                            Icons.bolt_outlined,
                            const Color(0xFFFFFBEB),
                            const Color(0xFFF59E0B),
                            isMobile: true,
                          ),
                          const SizedBox(height: 12),
                          _buildStatCard(
                            'Sudah Berubah',
                            '0',
                            Icons.check_circle_outline,
                            const Color(0xFFF0FDF4),
                            const Color(0xFF22C55E),
                            isMobile: true,
                          ),
                        ],
                      )
                    : Row(
                        children: [
                          Expanded(
                            child: _buildStatCard(
                              'Total Catatan',
                              '${catatanList.length}',
                              Icons.description_outlined,
                              const Color(0xFFEFF6FF),
                              const Color(0xFF3B82F6),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: _buildStatCard(
                              'Dalam Perbaikan',
                              '0',
                              Icons.bolt_outlined,
                              const Color(0xFFFFFBEB),
                              const Color(0xFFF59E0B),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: _buildStatCard(
                              'Sudah Berubah',
                              '0',
                              Icons.check_circle_outline,
                              const Color(0xFFF0FDF4),
                              const Color(0xFF22C55E),
                            ),
                          ),
                        ],
                      ),
                
                const SizedBox(height: 24),
                
                // Expansion Tiles Section with Dropdown
                _buildCatatanSikapSection(catatanList, isMobile),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCatatanSikapSection(List<Map<String, dynamic>> catatanList, bool isMobile) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Theme(
        data: ThemeData(
          dividerColor: Colors.transparent,
        ),
        child: ExpansionTile(
          initiallyExpanded: false,
          tilePadding: EdgeInsets.symmetric(
            horizontal: isMobile ? 16 : 20,
            vertical: 12,
          ),
          backgroundColor: const Color(0xFFFAFAFA),
          collapsedBackgroundColor: const Color(0xFFFAFAFA),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
          ),
          collapsedShape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          title: Text(
            'DAFTAR CATATAN SIKAP',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: isMobile ? 11 : 12,
              color: const Color(0xFF6B7280),
              letterSpacing: 0.5,
            ),
          ),
          children: [
            // Content - Either expansion tiles or empty state
            catatanList.isEmpty
                ? _buildEmptyState(isMobile)
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: catatanList.length,
                    itemBuilder: (context, index) {
                      final catatan = catatanList[index];
                      return _buildExpansionTile(catatan, index, isMobile);
                    },
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildExpansionTile(Map<String, dynamic> catatan, int index, bool isMobile) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xFFE5E7EB)),
        ),
      ),
      child: Theme(
        data: ThemeData(
          dividerColor: Colors.transparent,
        ),
        child: ExpansionTile(
          tilePadding: EdgeInsets.symmetric(
            horizontal: isMobile ? 16 : 20,
            vertical: 4,
          ),
          childrenPadding: EdgeInsets.fromLTRB(
            isMobile ? 16 : 20,
            0,
            isMobile ? 16 : 20,
            16,
          ),
          title: Text(
            'Catatan ${index + 1}',
            style: TextStyle(
              fontSize: isMobile ? 14 : 15,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF3B82F6),
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              catatan['kategori'] ?? '-',
              style: TextStyle(
                fontSize: isMobile ? 12 : 13,
                color: const Color(0xFF6B7280),
              ),
            ),
          ),
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFF9FAFB),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDetailRow('No', '${catatan['no']}', isMobile),
                  const SizedBox(height: 12),
                  _buildDetailRow('Kategori', catatan['kategori'], isMobile),
                  const SizedBox(height: 12),
                  _buildDetailRow('Catatan', catatan['catatan'], isMobile),
                  const SizedBox(height: 12),
                  _buildDetailRow('Status', catatan['status'], isMobile, 
                    statusColor: _getStatusColor(catatan['status'])),
                  const SizedBox(height: 12),
                  _buildDetailRow('Dilaporkan', catatan['dilaporkan'], isMobile),
                  const SizedBox(height: 12),
                  _buildDetailRow('Update Terakhir', catatan['updateTerakhir'], isMobile),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, bool isMobile, {Color? statusColor}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: isMobile ? 120 : 140,
          child: Text(
            label,
            style: TextStyle(
              fontSize: isMobile ? 12 : 13,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF374151),
            ),
          ),
        ),
        const Text(
          ': ',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Color(0xFF374151),
          ),
        ),
        Expanded(
          child: statusColor != null
              ? Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    value,
                    style: TextStyle(
                      fontSize: isMobile ? 12 : 13,
                      fontWeight: FontWeight.w500,
                      color: statusColor,
                    ),
                  ),
                )
              : Text(
                  value,
                  style: TextStyle(
                    fontSize: isMobile ? 12 : 13,
                    color: const Color(0xFF6B7280),
                  ),
                ),
        ),
      ],
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Dalam Perbaikan':
        return const Color(0xFFF59E0B);
      case 'Sudah Berubah':
        return const Color(0xFF22C55E);
      default:
        return const Color(0xFF3B82F6);
    }
  }

  Widget _buildEmptyState(bool isMobile) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 40 : 60,
        horizontal: 20,
      ),
      child: Column(
        children: [
          Container(
            width: isMobile ? 80 : 100,
            height: isMobile ? 80 : 100,
            decoration: BoxDecoration(
              color: const Color(0xFFF3F4F6),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFFE5E7EB),
                width: 2,
              ),
            ),
            child: Icon(
              Icons.check_circle_outline,
              size: isMobile ? 40 : 50,
              color: const Color(0xFF9CA3AF),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Tidak ada catatan',
            style: TextStyle(
              fontSize: isMobile ? 16 : 18,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Belum ada catatan sikap yang dilaporkan',
            style: TextStyle(
              fontSize: isMobile ? 13 : 14,
              color: Colors.black54,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(
    String label,
    String value,
    IconData icon,
    Color bgColor,
    Color iconColor, {
    bool isMobile = false,
  }) {
    return Container(
      padding: EdgeInsets.all(isMobile ? 16 : 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: isMobile ? 12 : 13,
                    color: const Color(0xFF6B7280),
                    height: 1.4,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(isMobile ? 8 : 10),
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  size: isMobile ? 18 : 22,
                  color: iconColor,
                ),
              ),
            ],
          ),
          SizedBox(height: isMobile ? 8 : 12),
          Text(
            value,
            style: TextStyle(
              fontSize: isMobile ? 28 : 32,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              height: 1,
            ),
          ),
        ],
      ),
    );
  }
}