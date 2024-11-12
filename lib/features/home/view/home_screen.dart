import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rhymes/features/favorites/favorites.dart';
import 'package:flutter_rhymes/features/history/history.dart';
import 'package:flutter_rhymes/features/search/search.dart';
import 'package:flutter_rhymes/features/settings/settings.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedPageIndex = 0;
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (value) {
          setState(() {
            _selectedPageIndex = value;
          });
        },
        children: const [
          SearchScreen(),
          FavorivesScreen(),
          HistoryScreen(),
          SettingsScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Поиск",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Избранное",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: "История",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Настройки",
          ),
        ],
        unselectedItemColor: theme.hintColor,
        selectedItemColor: theme.primaryColor,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        currentIndex: _selectedPageIndex,
        onTap: _openPage,
      ),
    );
  }

  void _openPage(int index) {
    setState(() {
      _selectedPageIndex = index;
      _pageController.animateToPage(index,
          duration: const Duration(microseconds: 300), curve: Curves.linear);
    });
  }
}
