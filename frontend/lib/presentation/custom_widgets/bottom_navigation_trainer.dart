import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// ignore: must_be_immutable
class TrainerBottomNavigation extends StatelessWidget {
  int selectedIndex;
  // a list of widgets to be displayed in the bottom navigation bar

  TrainerBottomNavigation({required this.selectedIndex, super.key});

  void _onItemTapped(int index, context) {
    selectedIndex = index;
    if (selectedIndex == 0) {
      GoRouter.of(context).go('/trainer/homePage');
    } else if (selectedIndex == 1) {
      GoRouter.of(context).go('/trainer/profile');
    } else if (selectedIndex == 2) {
      _showDropUpList(context);
    }
  }

  void _showDropUpList(BuildContext context) {
    showModalBottomSheet(
        shape: const ContinuousRectangleBorder(),
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return SizedBox(
            height: 200,
            child: Column(
              children: [
                ListTile(
                  title: const Text('Settings'),
                  onTap: () {
                    context.push("/Settings");
                  },
                ),
                ListTile(
                  title: const Text('Contact Us'),
                  onTap: () {
                    context.push("/ContactUs");
                  },
                ),
                ListTile(
                  title: const Text('About Us'),
                  onTap: () {
                    context.push("/aboutus");
                  },
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.more_vert),
          label: 'More',
        ),
      ],
      currentIndex: selectedIndex,
      // blue color
      selectedItemColor: const Color(0xFF0A568A),
      onTap: (index) => _onItemTapped(index, context),
    );
  }
}
