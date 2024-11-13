import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rhymes/router/router.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AutoTabsRouter(
      routes: const [
        SearchRoute(),
        FavorivesRoute(),
        HistoryRoute(),
        SettingsRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
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
            currentIndex: tabsRouter.activeIndex,
            onTap: (index) => _openPage(index, tabsRouter),
          ),
        );
      },
    );
  }

  void _openPage(int index, TabsRouter tabsRouter) {
    tabsRouter.setActiveIndex(index);
  }
}
