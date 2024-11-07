import 'package:flutter/material.dart';
import 'package:hostel_management/features/main_tab_enum.dart';
import 'package:hostel_management/features/room_manage/room_manage_screen.dart';
import 'package:lazy_load_indexed_stack/lazy_load_indexed_stack.dart';

import '../gen/assets.gen.dart';
import '../theme/colors.dart';
import 'home/screens/home_screen.dart';

class MainTab extends StatefulWidget {
  const MainTab({Key? key}) : super(key: key);

  @override
  createState() => _MainTabState();
}

class _MainTabState extends State<MainTab> {
  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTextStyle.merge(
        style: const TextStyle(letterSpacing: -0.5),
        child: LazyLoadIndexedStack(
          index: _selectedTabIndex,
          children: _navigatorKeys
              .map(
                (key) => Navigator(
                  key: key,
                  onGenerateRoute: (settings) {
                    return MaterialPageRoute(
                      builder: (context) => [
                        const HomeScreen(),
                        const RoomManageScreen(),
                      ][_selectedTabIndex],
                    );
                  },
                ),
              )
              .toList(),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedTabIndex,
        onTap: (index) => _handleOnBottomTabTapped(index),
        items: [
          _barItem(MainTabEnum.home),
          _barItem(MainTabEnum.manage),
        ],
      ),
    );
  }

  _barItem(MainTabEnum tabEnum) {
    return BottomNavigationBarItem(
      label: tabEnum.title,
      icon: tabEnum.icon,
      activeIcon: tabEnum.activeIcon,
    );
  }

  void _handleOnBottomTabTapped(int selectedIndex) {
    // if (selectedTabIndex == tab.index) {
    //   _navigatorKeys[selectedTabIndex]
    //       .currentState
    //       ?.popUntil((route) => route.isFirst);
    // }

    setState(() {
      _selectedTabIndex = selectedIndex;
    });

    // if (tab == BottomTab.home) {
    //   ref.invalidate(selectedDateProvider);
    //   ref.invalidate(messagesProvider);
    //   // VirtualWalkingNavigatorを表示
    //   _showVirtualWalkingNavigator();
    // }
  }
}
