import 'package:flutter/material.dart';
import 'package:jurnalku/PermintaanSaksi.dart';
import 'pengaturanAkun.dart';
import 'exploreeeeeLogin.dart'; // Changed from exploreeeee.dart
import 'Dashboard.dart';
import 'profile.dart';
import 'jurnalPembiasaan.dart';
import 'ProgresBelajar.dart';
import 'catatan_sikap.dart';
import 'guidePage.dart';
import 'services/api_service.dart';
import 'models/models.dart';
import 'services/user_session.dart';


class CustomNavBar extends StatefulWidget implements PreferredSizeWidget {
  final String userName;
  final String userSubtitle;
  final DataSiswa? studentData; 
  final VoidCallback? onHomeTap;
  final BuildContext? context;

  const CustomNavBar({
    super.key,
    required this.userName,
    required this.userSubtitle,
    this.studentData, // Added to constructor
    this.onHomeTap,
    this.context,
  });

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}


class _CustomNavBarState extends State<CustomNavBar> {
  final GlobalKey<PopupMenuButtonState<String>> _menuKey =
      GlobalKey<PopupMenuButtonState<String>>();

  void _handleMenuSelection(String value, BuildContext context) async{
    switch (value) {
      case 'dashboard':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DashboardPage()),
        );
        break;
        
          case 'profile':
      print('🔍 Profile clicked');
      print('Session data: ${UserSession().studentData}');
      print('Widget data: ${widget.studentData}');
      print('Session idUser: ${UserSession().idUser}');
      
      DataSiswa? targetData = UserSession().studentData ?? widget.studentData;
      
      if (targetData == null) {
        print('⚠️ No data found, fetching from API...');
        
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (c) => const Center(child: CircularProgressIndicator()),
        );

        try {
          print('📡 Calling API...');
          final allStudents = await ApiService().getDataSiswa();
          print('✅ Got ${allStudents.length} students');
          
          // Check if idUser exists
          final userId = UserSession().idUser;
          print('🔑 Looking for user ID: $userId');
          
          if (userId == null) {
            print('❌ User ID is null!');
            if (mounted) {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Session expired. Please login again.')),
              );
            }
            return;
          }
          
          try {
            targetData = allStudents.firstWhere(
              (student) {
                print('Checking student: ${student.namaSiswa} (idUser: ${student.idUser})');
                return student.idUser == userId;
              },
            );
            
            print('✅ Found student: ${targetData.namaSiswa}');
            UserSession().studentData = targetData;
          } catch (e) {
            print('❌ Student not found: $e');
            if (mounted) {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Data profil tidak ditemukan.')),
              );
            }
            return;
          }
        } catch (e) {
          print('❌ API Error: $e');
          if (mounted) {
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Gagal memuat data: $e')),
            );
          }
          return;
        }

        if (mounted) {
          print('Closing loading dialog...');
          Navigator.of(context).pop();
        }
      }

      print('🚀 Navigating to profile with data: ${targetData?.namaSiswa}');
      
      if (mounted && targetData != null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfileApp(
            studentData: targetData, 
            isLoggedIn: true,
          )),
        );
      } else {
        print('❌ Cannot navigate: mounted=$mounted, targetData=$targetData');
      }
      break;
      
      case 'schedule':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const StudentDirectoryPage()),
        );
        break;
        
      case 'journal':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const JurnalPembiasaanPage()),
        );
        break;
        
      case 'permission':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PermintaanSaksiPage()),
        );
        break;
        
      case 'progress':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ProgressBelajarPage()),
        );
        break;
        
      case 'warning':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CatatanSikapPage()),
        );
        break;
        
      case 'guide':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const GuidePage()),
        );
        break;
        
      case 'settings':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PengaturanAkunPage()),
        );
        break;
        
        case 'logout':
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Konfirmasi Logout'),
                content: const Text('Apakah Anda yakin ingin keluar?'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Batal'),
                  ),
                  TextButton(
                    onPressed: () async {
                      // Clear session
                      UserSession().clear();
                      await ApiService().clearToken();
                      
                      if (context.mounted) {
                        Navigator.pop(context);
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => const ExploreeeePage()),
                          (route) => false,
                        );
                      }
                    },
                    child: const Text(
                      'Logout',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              );
            },
          );
          break;
    }
  }

  @override

  Widget build(BuildContext context) {
      final session = UserSession();
      final displayName = session.studentData?.namaSiswa ?? 
                      session.username ?? 
                      widget.userName;

      final subtitle = session.studentData?.rombel ?? widget.userSubtitle;

    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.home_outlined, color: Colors.grey),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const StudentDirectoryPage()),
              );
            },
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
          
          const Spacer(),
          
          PopupMenuButton<String>(
            key: _menuKey,
            offset: const Offset(0, 60),
            onSelected: (value) => _handleMenuSelection(value, context),
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem<String>(
                value: 'dashboard',
                child: Row(
                  children: [
                    Icon(Icons.home, color: Colors.grey, size: 20),
                    SizedBox(width: 12),
                    Text('Dashboard'),
                  ],
                ),
              ),
              const PopupMenuItem<String>(
                value: 'profile',
                child: Row(
                  children: [
                    Icon(Icons.person, color: Colors.grey, size: 20),
                    SizedBox(width: 12),
                    Text('Profil'),
                  ],
                ),
              ),
              const PopupMenuItem<String>(
                value: 'schedule',
                child: Row(
                  children: [
                    Icon(Icons.explore, color: Colors.grey, size: 20),
                    SizedBox(width: 12),
                    Text('Jelajahi'),
                  ],
                ),
              ),
              const PopupMenuItem<String>(
                value: 'journal',
                child: Row(
                  children: [
                    Icon(Icons.book, color: Colors.grey, size: 20),
                    SizedBox(width: 12),
                    Text('Jurnal Pembiasaan'),
                  ],
                ),
              ),
              const PopupMenuItem<String>(
                value: 'permission',
                child: Row(
                  children: [
                    Icon(Icons.person_add, color: Colors.grey, size: 20),
                    SizedBox(width: 12),
                    Text('Permintaan Saksi'),
                  ],
                ),
              ),
              const PopupMenuItem<String>(
                value: 'progress',
                child: Row(
                  children: [
                    Icon(Icons.bar_chart, color: Colors.grey, size: 20),
                    SizedBox(width: 12),
                    Text('Progress Belajar'),
                  ],
                ),
              ),
              const PopupMenuItem<String>(
                value: 'warning',
                child: Row(
                  children: [
                    Icon(Icons.warning, color: Colors.grey, size: 20),
                    SizedBox(width: 12),
                    Text('Catatan Sikap'),
                  ],
                ),
              ),
              const PopupMenuItem<String>(
                value: 'guide',
                child: Row(
                  children: [
                    Icon(Icons.menu_book, color: Colors.grey, size: 20),
                    SizedBox(width: 12),
                    Text('Panduan Penggunaan'),
                  ],
                ),
              ),
              const PopupMenuItem<String>(
                value: 'settings',
                child: Row(
                  children: [
                    Icon(Icons.settings, color: Colors.grey, size: 20),
                    SizedBox(width: 12),
                    Text('Pengaturan Akun'),
                  ],
                ),
              ),
              const PopupMenuDivider(),
              const PopupMenuItem<String>(
                value: 'logout',
                child: Row(
                  children: [
                    Icon(Icons.logout, color: Colors.red, size: 20),
                    SizedBox(width: 12),
                    Text('Log Out', style: TextStyle(color: Colors.red)),
                  ],
                ),
              ),
            ],
            child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    displayName,  // Use session username
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    widget.userSubtitle,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 12),
                
                CircleAvatar(
                radius: 20,
                backgroundColor: Colors.blue[700],
                child: Text(
                  displayName[0].toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
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

class ExamplePage extends StatelessWidget {
  const ExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomNavBar(
        userName: 'Valen',
        userSubtitle: 'PPLG XII-3',
        onHomeTap: () {
          print('Home tapped');
        },
      ),
      body: const Center(
        child: Text('Your page content here'),
      ),
    );
  }
}

class CustomNavBarAltIcon extends StatelessWidget implements PreferredSizeWidget {
  final String userName;
  final String userSubtitle;
  final Map<String, dynamic>? studentData;
  final VoidCallback? onProfileTap;
  final VoidCallback? onHomeTap;
  final IconData profileIcon;

  const CustomNavBarAltIcon({
    super.key,
    required this.userName,
    required this.userSubtitle,
    this.studentData,
    this.onProfileTap,
    this.onHomeTap,
    this.profileIcon = Icons.account_circle,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.home_outlined, color: Colors.grey),
            onPressed: onHomeTap ?? () {},
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
          
          const Spacer(),
          
          GestureDetector(
            onTap: onProfileTap,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      userName,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      userSubtitle,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 12),
                
                Icon(
                  profileIcon,
                  size: 40,
                  color: Colors.grey[600],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class CustomStyledNavBar extends StatelessWidget implements PreferredSizeWidget {
  final String userName;
  final String userSubtitle;
  final VoidCallback? onProfileTap;
  final VoidCallback? onHomeTap;
  final Color backgroundColor;
  final Color textColor;
  final Color iconColor;

  const CustomStyledNavBar({
    super.key,
    required this.userName,
    required this.userSubtitle,
    this.onProfileTap,
    this.onHomeTap,
    this.backgroundColor = Colors.white,
    this.textColor = Colors.black87,
    this.iconColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 1,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          IconButton(
            icon: Icon(Icons.home_outlined, color: iconColor),
            onPressed: onHomeTap ?? () {},
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
          
          const Spacer(),
          
          GestureDetector(
            onTap: onProfileTap,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      userName,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: textColor,
                      ),
                    ),
                    Text(
                      userSubtitle,
                      style: TextStyle(
                        fontSize: 12,
                        color: textColor.withOpacity(0.7),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 12),
                
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey[300],
                  child: Icon(Icons.person, color: Colors.grey[600], size: 24),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}