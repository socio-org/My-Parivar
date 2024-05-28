import 'package:flutter/material.dart';
import 'package:mera_pariwar/components/home_components/bottom_nav_bar.dart';
import 'package:mera_pariwar/screens/church_org/church.dart';
import 'package:mera_pariwar/screens/posts/posts_page.dart';
import 'package:mera_pariwar/screens/search/search.dart';
import 'package:mera_pariwar/themes/themes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final pages = [
    const PostPage(),
    const PostPage(),
    const PostPage(),
    const Church()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.white,
        itemColor: AppTheme.navClickColor,
        selectedItemColor: AppTheme.navColor,
        items: [
          BottomNavItem(
            iconpath: 'assets/icons/home.svg',
            text: 'Home',
            onClick: () {
              setState(() {
                _currentIndex = 0;
              });
            },
          ),
          BottomNavItem(
            iconpath: 'assets/icons/search.svg',
            text: 'Search',
            onClick: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchPage()),
              );
              setState(() {
                _currentIndex = 0;
              });
            },
          ),
          BottomNavItem(
            iconpath: 'assets/icons/events.svg',
            text: 'Calender',
            onClick: () {
              setState(() {
                _currentIndex = 2;
              });
            },
          ),
          BottomNavItem(
            iconpath: 'assets/icons/profile.svg',
            text: 'Church',
            onClick: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Church()),
              );
              setState(() {
                _currentIndex = 0;
              });
            },
          ),
        ],
      ),
    );
  }
}
