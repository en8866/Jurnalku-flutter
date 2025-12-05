import 'package:flutter/material.dart';

class CatatanSikapPage extends StatelessWidget {
  const CatatanSikapPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen width to determine if mobile or tablet/desktop
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    
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
                            '0',
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
                              '0',
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
                
                // Table Section - Make scrollable on mobile
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color(0xFFE5E7EB)),
                  ),
                  child: Column(
                    children: [
                      // Table Header
                      if (!isMobile) _buildDesktopTableHeader(),
                      if (isMobile) _buildMobileTableHeader(),
                      
                      // Empty State
                      Container(
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
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


 
  PreferredSizeWidget _buildDesktopAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      toolbarHeight: 70,
      leading: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: IconButton(
          icon: const Icon(Icons.home_outlined, color: Colors.black54, size: 24),
          onPressed: () {},
        ),
      ),
      title: Row(
        children: const [
          Icon(Icons.chevron_right, color: Colors.black26, size: 20),
          SizedBox(width: 4),
          Text(
            'Catatan Sikap',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 14,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text(
                    'Valensio Christian Samuel',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'PPLG XII-3',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 12),
              const CircleAvatar(
                backgroundColor: Colors.red,
                radius: 20,
                child: Icon(Icons.person, color: Colors.white, size: 24),
              ),
              const SizedBox(width: 8),
              PopupMenuButton<String>(
                icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black54, size: 24),
                offset: const Offset(0, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 8,
                itemBuilder: (BuildContext context) => [
                  _buildPopupMenuItem('dashboard', Icons.home_outlined, 'Dashboard'),
                  _buildPopupMenuItem('profil', Icons.person_outline, 'Profil'),
                  _buildPopupMenuItem('jelajahi', Icons.explore_outlined, 'Jelajahi'),
                  const PopupMenuDivider(height: 1),
                  _buildPopupMenuItem('jurnal', Icons.menu_book_outlined, 'Jurnal Pembiasaan'),
                  _buildPopupMenuItem('permintaan', Icons.people_outline, 'Permintaan Saksi'),
                  _buildPopupMenuItem('progress', Icons.bar_chart_outlined, 'Progress'),
                  _buildPopupMenuItem('catatan', Icons.warning_amber_outlined, 'Catatan Sikap'),
                  const PopupMenuDivider(height: 1),
                  _buildPopupMenuItem('panduan', Icons.menu_book_outlined, 'Panduan Penggunaan'),
                  _buildPopupMenuItem('pengaturan', Icons.settings_outlined, 'Pengaturan Akun'),
                  _buildPopupMenuItem('logout', Icons.logout, 'Log Out'),
                ],
                onSelected: (value) {
                  print('Selected: $value');
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  PopupMenuItem<String> _buildPopupMenuItem(String value, IconData icon, String label) {
    return PopupMenuItem<String>(
      value: value,
      height: 48,
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF64748B), size: 20),
          const SizedBox(width: 12),
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFF64748B),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopTableHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: const BoxDecoration(
        color: Color(0xFFFAFAFA),
        border: Border(bottom: BorderSide(color: Color(0xFFE5E7EB))),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      child: Row(
        children: const [
          SizedBox(
            width: 50,
            child: Text(
              'NO',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 11,
                color: Color(0xFF6B7280),
                letterSpacing: 0.5,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'KATEGORI',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 11,
                color: Color(0xFF6B7280),
                letterSpacing: 0.5,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              'CATATAN',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 11,
                color: Color(0xFF6B7280),
                letterSpacing: 0.5,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'STATUS',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 11,
                color: Color(0xFF6B7280),
                letterSpacing: 0.5,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'DILAPORKAN',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 11,
                color: Color(0xFF6B7280),
                letterSpacing: 0.5,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'UPDATE TERAKHIR',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 11,
                color: Color(0xFF6B7280),
                letterSpacing: 0.5,
              ),
            ),
          ),
          SizedBox(
            width: 80,
            child: Text(
              'AKSI',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 11,
                color: Color(0xFF6B7280),
                letterSpacing: 0.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileTableHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        color: Color(0xFFFAFAFA),
        border: Border(bottom: BorderSide(color: Color(0xFFE5E7EB))),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      child: const Center(
        child: Text(
          'DAFTAR CATATAN SIKAP',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 11,
            color: Color(0xFF6B7280),
            letterSpacing: 0.5,
          ),
        ),
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