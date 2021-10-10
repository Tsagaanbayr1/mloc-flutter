import 'package:flutter/material.dart';
import 'package:mloc/screens/dashboard/bookings/bookings.dart';
import 'package:mloc/screens/dashboard/discover/discover.dart';
import 'package:mloc/screens/dashboard/profile/profile.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  var currentIndex = 0;

  final discover = DiscoverScreen();
  final bookings = BookingsScreen();
  final profile = ProfileScreen();

  late List<Widget> _screens;

  @override
  void initState() {
    _screens = [discover, bookings, profile];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.picture_in_picture_alt_outlined),
            label: 'Bookings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) => setState(() => currentIndex = index),
      ),
    );
  }
}
