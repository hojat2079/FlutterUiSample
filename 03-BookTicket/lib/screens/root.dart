import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:ticket_booking/screens/home/home.dart';
import 'package:ticket_booking/screens/profile/profile.dart';
import 'package:ticket_booking/screens/serach/search.dart';
import 'package:ticket_booking/screens/ticket/ticket.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  static const homePageIndex = 0;
  static const searchPageIndex = 1;
  static const ticketPageIndex = 2;
  static const profilePageIndex = 3;

  int _selectedPageIndex = homePageIndex;

  final pages = [
    const HomeScreen(),
    const SearchScreen(),
    const TicketScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(),
      body: pages[_selectedPageIndex],
    );
  }

  BottomNavigationBar _bottomNavigationBar() {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      elevation: 10,
      selectedItemColor: Colors.blueGrey,
      unselectedItemColor: const Color(0xff526480),
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedPageIndex,
      items: [
        _bottomNavigationBarItem(
          activeIcon: FluentSystemIcons.ic_fluent_home_regular,
          unActiveIcon: FluentSystemIcons.ic_fluent_home_filled,
          label: 'Home',
        ),
        _bottomNavigationBarItem(
          activeIcon: FluentSystemIcons.ic_fluent_search_regular,
          unActiveIcon: FluentSystemIcons.ic_fluent_search_filled,
          label: 'Search',
        ),
        _bottomNavigationBarItem(
          activeIcon: FluentSystemIcons.ic_fluent_ticket_regular,
          unActiveIcon: FluentSystemIcons.ic_fluent_ticket_filled,
          label: 'Ticket',
        ),
        _bottomNavigationBarItem(
          activeIcon: FluentSystemIcons.ic_fluent_person_regular,
          unActiveIcon: FluentSystemIcons.ic_fluent_person_filled,
          label: 'Home',
        ),
      ],
      onTap: (index) {
        setState(() {
          _selectedPageIndex = index;
        });
      },
    );
  }

  BottomNavigationBarItem _bottomNavigationBarItem({
    required IconData activeIcon,
    required IconData unActiveIcon,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: Icon(activeIcon),
      activeIcon: Icon(
        unActiveIcon,
      ),
      label: label,
    );
  }
}
