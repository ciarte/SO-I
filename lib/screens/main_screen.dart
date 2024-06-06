import 'package:flutter/material.dart';

import '../sub_screens/sub_screens.dart';
import 'screens.dart';

class MainScreen extends StatefulWidget {
  final int currentPageIndex;

  const MainScreen({super.key, required this.currentPageIndex});

  @override
  State<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  late int currentPageIndex;

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Agenda(),
    Historial(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    currentPageIndex = widget.currentPageIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _widgetOptions.elementAt(currentPageIndex),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        showUnselectedLabels: false,
        unselectedItemColor: const Color(0xFF172983),
        currentIndex: currentPageIndex,
        onTap: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        items: [
          _buildBottomNavigationBarItem(Icons.home_outlined, "Inicio", 0),
          _buildBottomNavigationBarItem(
              Icons.calendar_today_outlined, "Agendar", 1),
          _buildBottomNavigationBarItem(
              Icons.insert_drive_file_outlined, "Historial", 2),
          _buildBottomNavigationBarItem(
              Icons.person_outline_outlined, "Perfil", 3),
        ],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(
      IconData icon, String label, int index) {
    return BottomNavigationBarItem(
      backgroundColor: Colors.white,
      icon: InkWell(
        onTap: () {
          setState(() {
            currentPageIndex = index;
          });
        },
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: currentPageIndex == index ? const Color(0xFF172983) : null,
            shape: BoxShape.rectangle,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon,
                  color: currentPageIndex == index
                      ? Colors.white
                      : const Color(0xFF172983)),
              currentPageIndex == index
                  ? Text(label, style: const TextStyle(color: Colors.white))
                  : const SizedBox()
            ],
          ),
        ),
      ),
      label: '',
    );
  }
}
