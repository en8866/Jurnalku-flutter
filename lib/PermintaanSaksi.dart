import 'package:flutter/material.dart';

class PermintaanSaksiPage extends StatelessWidget {
  const PermintaanSaksiPage({super.key});

  @override
  Widget build(BuildContext context) {
    final requests = [
      PermintaanSaksi(
        nama: 'Molldy Apriansyah',
        deskripsi: 'Permintaan saksi',
        tanggal: '15 Des 2025',
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            // Home Icon
            IconButton(
              icon: const Icon(Icons.home_outlined, color: Colors.grey),
              onPressed: () {
                Navigator.pop(context);
              },
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
            
            const Spacer(),
            
            // User Info Section
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Valen',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      'PPLG XII-3',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 12),
                
                // Profile Icon
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey[300],
                  child: Icon(Icons.person, color: Colors.grey[600], size: 24),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Permintaan Saksi',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            const Text(
              'Kelola permintaan menjadi saksi dari siswa lain',
              style: TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 16),

            // DATE BADGE
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFFEFF6FF),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'Monday, 15 December 2025',
                style: TextStyle(color: Color(0xFF2563EB)),
              ),
            ),

            const SizedBox(height: 24),

            // CARD
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFE5E7EB)),
              ),
              child: Column(
                children: [
                  _tableHeader(),
                  ...requests.map(
                    (e) => PermintaanSaksiItem(data: e),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tableHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: const BoxDecoration(
        color: Color(0xFFFAFAFA),
        border: Border(bottom: BorderSide(color: Color(0xFFE5E7EB))),
      ),
      child: Row(
        children: const [
          Expanded(
            child: Text('PENGIRIM',
                style: TextStyle(fontSize: 11, color: Color(0xFF6B7280))),
          ),
          SizedBox(
            width: 100,
            child: Center(
              child: Text('KONFIRMASI',
                  style: TextStyle(fontSize: 11, color: Color(0xFF6B7280))),
            ),
          ),
        ],
      ),
    );
  }
}

/// =======================================================
/// MODEL
/// =======================================================

class PermintaanSaksi {
  final String nama;
  final String deskripsi;
  final String tanggal;

  PermintaanSaksi({
    required this.nama,
    required this.deskripsi,
    required this.tanggal,
  });
}

/// =======================================================
/// ROW ITEM (DROPDOWN FIXED)
/// =======================================================

class PermintaanSaksiItem extends StatefulWidget {
  final PermintaanSaksi data;

  const PermintaanSaksiItem({super.key, required this.data});

  @override
  State<PermintaanSaksiItem> createState() => _PermintaanSaksiItemState();
}

class _PermintaanSaksiItemState extends State<PermintaanSaksiItem> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // PROFIL + NAMA
              Expanded(
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.black12,
                      child: Icon(Icons.person, color: Colors.white),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.data.nama,
                              style:
                                  const TextStyle(fontWeight: FontWeight.w600)),
                          const SizedBox(height: 2),
                          Text(widget.data.deskripsi,
                              style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF64748B))),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 16),

              // KONFIRMASI (ICON ONLY)
              SizedBox(
                width: 100,
                child: Center(
                  child: IconButton(
                    icon: Icon(
                      expanded
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: Colors.black54,
                    ),
                    onPressed: () {
                      setState(() => expanded = !expanded);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),

        // DROPDOWN ACTION
        if (expanded)
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // TANGGAL
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEFF6FF),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(widget.data.tanggal,
                      style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF2563EB))),
                ),
                Row(
                  children: [
                    OutlinedButton(
                      onPressed: () {},
                      child: const Text('Tolak'),
                    ),
                    const SizedBox(width: 12),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.check, size: 18),
                      label: const Text('Setujui'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF16A34A),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

        const Divider(height: 1),
      ],
    );
  }
}