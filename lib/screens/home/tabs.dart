import 'package:crypto_app/data/tab_button_list.dart';
import 'package:crypto_app/models/tab_button_item.dart';
import 'package:crypto_app/screens/home/crypto_screen.dart';
import 'package:crypto_app/screens/home/gift_card_screen.dart';
import 'package:crypto_app/screens/home/home_screen.dart';
import 'package:crypto_app/screens/home/transaction_screen.dart';
import 'package:flutter/material.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _selectedIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = const HomeScreen();

    switch (_selectedIndex) {
      case 0:
        activePage = const HomeScreen();
      case 1:
        activePage = const CryptoScreen();
      case 2:
        activePage = const GiftCardScreen();
      default:
        activePage = const TransactionScreen();
    }
    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 251, 255, 1),
      bottomNavigationBar: _buildBottomNavigation(),
      body: activePage,
    );
  }

  Widget _buildBottomNavigation() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _selectPage,
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color(0xFF5B00D9),
      unselectedItemColor: Colors.grey,
      selectedFontSize: 12,
      unselectedFontSize: 12,
      items: tabButtonList.asMap().entries.map((entry) {
        int index = entry.key;
        TabButtonItem tabBtn = entry.value;

        return BottomNavigationBarItem(
          icon: Image.asset(
            tabBtn.tabIcon,
            color: _selectedIndex == index
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.onSurface,
          ),
          label: tabBtn.tabLabel,
        );
      }).toList(),
    );
  }
}
