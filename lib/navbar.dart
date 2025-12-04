import 'package:flutter/material.dart';
import 'pengaturanAkun.dart';
import 'exploreeeee.dart';
import 'Dashboard.dart';

// Main Navbar Widget with Dropdown
class CustomNavBar extends StatefulWidget implements PreferredSizeWidget {
  final String userName;
  final String userSubtitle;
  final VoidCallback? onHomeTap;
  final BuildContext? context;

  const CustomNavBar({
    super.key,
    required this.userName,
    required this.userSubtitle,
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

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          // Home Icon - Navigate to Explore
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
          
          // User Info Section with Dropdown
          PopupMenuButton<String>(
            key: _menuKey,
            onSelected: (value) {
              // open Dashboard for "Dashboard" menu item
              if (value == 'dashboard') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DashboardPage()),
                );
                return;
              }
              
              // open StudentDirectoryPage for "Jelajahi"
              if (value == 'schedule') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const StudentDirectoryPage()),
                );
                return;
              }

              if (value == 'profile') {
                Navigator.pushNamed(context, '/profile');
              } else if (value == 'settings') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PengaturanAkunPage(),
                  ),
                );
              } else if (value == 'logout') {
                Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
              }
            },
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
                    Icon(Icons.schedule, color: Colors.grey, size: 20),
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
                    Text('Progress'),
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
                      widget.userName,
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
                
                // Profile Icon
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
}

// Example Usage Page
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
          // Navigator.pushNamed(context, '/home');
        },
      ),
      body: const Center(
        child: Text('Your page content here'),
      ),
    );
  }
}

// Alternative: Navbar with different icon style
class CustomNavBarAltIcon extends StatelessWidget implements PreferredSizeWidget {
  final String userName;
  final String userSubtitle;
  final VoidCallback? onProfileTap;
  final VoidCallback? onHomeTap;
  final IconData profileIcon;

  const CustomNavBarAltIcon({
    super.key,
    required this.userName,
    required this.userSubtitle,
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

// Example with multiple pages using the same navbar
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomNavBar(
        userName: 'Molldy Apriansyah',
        userSubtitle: 'PPLG XII-3',
        onHomeTap: () {
          // Already on home
        },
      ),
      body: const Center(child: Text('Home Page')),
    );
  }
}

class ProfilePageExample extends StatelessWidget {
  const ProfilePageExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomNavBar(
        userName: 'Molldy Apriansyah',
        userSubtitle: 'PPLG XII-3',
        onHomeTap: () {
          Navigator.pop(context);
        },
      ),
      body: const Center(child: Text('Profile Page')),
    );
  }
}

// If you want to use it with a custom color scheme:
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