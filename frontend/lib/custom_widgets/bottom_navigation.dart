import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// ignore: must_be_immutable
class BottomNavigation extends StatefulWidget {
  int selectedIndex;
  BottomNavigation({required this.selectedIndex, super.key});

  @override
  // ignore: no_logic_in_create_state
  State<BottomNavigation> createState() => _BottomNavigationState(selectedIndex: selectedIndex);
}

class _BottomNavigationState extends State<BottomNavigation> {
  
  int selectedIndex;
  _BottomNavigationState({required this.selectedIndex});

  // ignore: empty_constructor_bodies
  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    if(selectedIndex == 1){
      GoRouter.of(context).go('/trainee/trainer_profile');
    }
    else if(selectedIndex == 2){
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
              title: const Text('Choose Trainer'),
              onTap: () {
                GoRouter.of(context).go('/trainee/trainer_profile');
              },
            ),
            ListTile(
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Contact Us'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('About Us'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    }
  );
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
                  icon: Icon(Icons.more),
                  label: 'More',
                ),
              ],
              currentIndex: selectedIndex,
              selectedItemColor: Colors.amber[800],
              onTap: _onItemTapped,
            );
  }
}
