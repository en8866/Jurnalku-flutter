import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jurnalku/Dashboard.dart';
import 'package:jurnalku/exploreeeee.dart';
import 'services/api_service.dart';
import 'services/user_session.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginpageSPate();
}

class _LoginpageSPate extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController(text: 'GuruTest');
  final TextEditingController _passwordController = TextEditingController(text: 'password123');
  final ApiService _apiService = ApiService();
  bool _isPasswordVisible = false;
  bool _isLoading = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

    Future<void> _handleLogin() async {
  if (_usernameController.text.isEmpty || _passwordController.text.isEmpty) {
    _showError('Username dan password harus diisi');
    return;
  }

  setState(() => _isLoading = true);

  try {
    final response = await _apiService.login(
      _usernameController.text,
      _passwordController.text,
    );

    if (mounted) {
      // ✅ Save user session with ID
      print('📝 Login response: username=${response.user.username}, id=${response.user.idUser}');
      UserSession().setUser(response.user.username, response.user.idUser);
      
      // ✅ Verify it was saved
      print('✅ Saved to session: username=${UserSession().username}, idUser=${UserSession().idUser}');
      
      // ✅ Fetch and store student data
      try {
        print('🔍 Fetching student data...');
        final students = await _apiService.getDataSiswa();
        print('📚 Found ${students.length} students');
        
        final studentData = students.firstWhere(
          (s) {
            print('Checking: ${s.namaSiswa} (idUser: ${s.idUser}) == ${response.user.idUser}');
            return s.idUser == response.user.idUser;
          },
          orElse: () => throw Exception('Student data not found for user ID ${response.user.idUser}'),
        );
        
        // Store in session
        UserSession().studentData = studentData;
        print('✅ Student data saved: ${studentData.namaSiswa}');
      } catch (e) {
        print('⚠️ Warning: Could not fetch student data: $e');
        // Continue anyway - the profile will try to fetch it later
      }
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Selamat datang, ${response.user.username}!'),
          backgroundColor: Colors.green,
        ),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DashboardPage()),
      );
    }
  } catch (e) {
    if (mounted) {
      _showError(e.toString());
    }
  } finally {
    if (mounted) {
      setState(() => _isLoading = false);
    }
  }
}

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  Widget _buildFeatureCard({
    required IconData icon,
    required Color iconColor,
    required Color iconBackground,
    required String title,
    required String description,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: iconColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: iconBackground,
              size: 28,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  // Header Image
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color(0xFF0047AB),
                    ),
                    child: Image.asset(
                      'images/Banner-Web.jpg',
                      fit: BoxFit.cover,
                      height: 100,
                    ),
                  ),
                  
                  // Login Form
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title
                        RichText(
                          text: const TextSpan(
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(text: 'Masuk untuk memulai '),
                              TextSpan(
                                text: 'Jurnalku',
                                style: TextStyle(color: Color(0xFF0047AB)),
                              ),
                            ],
                          ),
                        ),
                        
                        const SizedBox(height: 32),
                        
                        // Username Field
                        const Text(
                          'Username atau NIS',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          controller: _usernameController,
                          enabled: !_isLoading,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0xFFF5F7FA),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 14,
                            ),
                          ),
                        ),
                        
                        const SizedBox(height: 24),
                        
                        // Password Field
                        const Text(
                          'Password',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          controller: _passwordController,
                          obscureText: !_isPasswordVisible,
                          enabled: !_isLoading,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color(0xFFF5F7FA),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 14,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isPasswordVisible
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isPasswordVisible = !_isPasswordVisible;
                                });
                              },
                            ),
                          ),
                        ),
                        
                        const SizedBox(height: 24),
                        
                        // Login Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _isLoading ? null : _handleLogin,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF0047AB),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: _isLoading
                                ? const SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 2,
                                    ),
                                  )
                                : const Text(
                                    'Masuk',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                          ),
                        ),
                        
                        const SizedBox(height: 16),
                        
                        // Forgot Password
                        Center(
                          child: TextButton(
                            onPressed: () {},
                            child: RichText(
                              text: const TextSpan(
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black87,
                                ),
                                children: [
                                  TextSpan(text: 'Lupa password? '),
                                  TextSpan(
                                    text: 'Hubungi guru laboran.',
                                    style: TextStyle(
                                      color: Color(0xFF0047AB),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        
                        const SizedBox(height: 48),
                        
                        // Feature Cards
                        const Text(
                          'Menyatukan Upaya untuk Kemajuan Siswa',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Jurnalku adalah aplikasi cerdas yang membantu guru dan siswa dalam memantau dan mengelola kompetensi keahlian siswa secara efektif.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 32),
                        
                        _buildFeatureCard(
                          icon: Icons.school,
                          iconColor: const Color(0xFFFFF3CD),
                          iconBackground: const Color(0xFFFFE69C),
                          title: 'Dirancang untuk Sekolah Kami',
                          description: 'Dikembangkan khusus untuk memenuhi kebutuhan sekolah kami dengan fokus pada kemajuan siswa kami.',
                        ),
                        const SizedBox(height: 16),
                        _buildFeatureCard(
                          icon: Icons.assessment_outlined,
                          iconColor: const Color(0xFFE0CFFC),
                          iconBackground: const Color(0xFFD4BBFC),
                          title: 'Pemantauan yang Terstruktur',
                          description: 'Memudahkan guru dalam menyusun dan memantau daftar kompetensi keahlian yang harus dikuasai siswa.',
                        ),
                        const SizedBox(height: 16),
                        _buildFeatureCard(
                          icon: Icons.self_improvement,
                          iconColor: const Color(0xFFB3E5FC),
                          iconBackground: const Color(0xFF81D4FA),
                          title: 'Fitur Praktis dan Bermanfaat',
                          description: 'Termasuk reminder otomatis, grafik perkembangan, dan analisis mendalam untuk efektivitas belajar.',
                        ),
                      ],
                    ),
                  ),
                  
                  // Footer
                  Container(
                    width: double.infinity,
                    color: const Color(0xFF0047AB),
                    padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(FontAwesomeIcons.whatsapp, color: Colors.white),
                              iconSize: 28,
                            ),
                            const SizedBox(width: 16),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(FontAwesomeIcons.instagram, color: Colors.white),
                              iconSize: 28,
                            ),
                            const SizedBox(width: 16),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(FontAwesomeIcons.linkedinIn, color: Colors.white),
                              iconSize: 28,
                            ),
                            const SizedBox(width: 16),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(FontAwesomeIcons.youtube, color: Colors.white),
                              iconSize: 28,
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          '© GEN-28 PPLG SMK Wikrama Bogor. All Rights Reserved.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
            // Sticky Button
            Positioned(
              right: 16,
              bottom: 16,
              child: FloatingActionButton.extended(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ExploreeeePage()),
                  );
                },
                backgroundColor: const Color(0xFF0047AB),
                icon: const Icon(
                  Icons.edit_outlined,
                  color: Colors.white,
                  size: 20,
                ),
                label: const Text(
                  'Jelajahi siswa',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}