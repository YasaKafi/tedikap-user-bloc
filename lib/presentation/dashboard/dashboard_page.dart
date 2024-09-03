import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../common/constant.dart';
import '../../common/theme.dart';
import '../pages/home_page/home_page_view.dart';
import '../pages/menu_page/menu_page_view.dart';
import '../pages/order_page/order_page_view.dart';
import '../pages/profile_page/profile_page_view.dart';


class DashboardPage extends StatefulWidget {
  final int pageIndex;

  const DashboardPage({Key? key, required this.pageIndex}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int? _selectedIndex;

  final List<Widget> _pages = [
    const HomePage(),
    const MenuPage(),
    const OrderPage(),
    const ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.pageIndex;
  }


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baseColor,
      body: _pages[_selectedIndex ?? 0],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: baseColor,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex ?? 0,
        unselectedLabelStyle: txtThirdSubTitle.copyWith(fontWeight: FontWeight.w600, color: primaryColor),
        selectedLabelStyle: txtThirdSubTitle.copyWith(fontWeight: FontWeight.w600, color: grey),
        unselectedItemColor: grey,
        selectedItemColor: primaryColor,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              icHome,
              width: 24,
              height: 24,
            ),
            label: 'Home',
            activeIcon: SvgPicture.asset(
              icHomeActive,
              width: 24,
              height: 24,
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              icMenu,
              width: 24,
              height: 24,
            ),
            label: 'Menu',
            activeIcon: SvgPicture.asset(
              icMenuActive,
              width: 24,
              height: 24,
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              icOrder,
              width: 24,
              height: 24,
            ),
            label: 'Order',
            activeIcon: SvgPicture.asset(
              icOrderActive,
              width: 24,
              height: 24,
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              icProfile,
              width: 24,
              height: 24,
            ),
            label: 'Profile',
            activeIcon: SvgPicture.asset(
              icProfileActive,
              width: 24,
              height: 24,
            ),
          ),
        ],
      ),
    );
  }
}
