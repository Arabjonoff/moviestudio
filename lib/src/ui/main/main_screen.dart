import 'package:flutter/material.dart';
import 'package:moviestudio/src/ui/main/home/home_screen.dart';
import 'package:moviestudio/src/ui/main/profile/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  List<Widget> screen = [
    HomeScreen(),
    Container(),
    ProfileScreen(),
  ];
  int currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: screen[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (i){
          currentIndex = i;
          setState(() {

          });
        },
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.category),label: "Category"),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile"),
        ],
      ),
    );
  }
}
