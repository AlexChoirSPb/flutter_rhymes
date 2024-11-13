import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rhymes/features/settings/settings.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            snap: true,
            floating: true,
            pinned: true,
            title: const Text("Настройки"),
            elevation: 0,
            surfaceTintColor: Colors.transparent,
            backgroundColor: theme.cardColor,
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 16,
            ),
          ),
          SliverToBoxAdapter(
            child: SettingsToggleCard(
              title: 'Тёмная тема',
              value: false,
              onChanged: (value) {},
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 8,
            ),
          ),
          SliverToBoxAdapter(
            child: SettingsToggleCard(
              title: 'Уведомления',
              value: true,
              onChanged: (value) {},
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 8,
            ),
          ),
          SliverToBoxAdapter(
            child: SettingsToggleCard(
              title: 'Разрешить аналитику',
              value: true,
              onChanged: (value) {},
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 24,
            ),
          ),
          SliverToBoxAdapter(
            child: SettingsActionCard(
              title: "Очистить историю",
              iconData: Icons.delete_sweep_outlined,
              iconColor: theme.primaryColor,
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 8,
            ),
          ),
          const SliverToBoxAdapter(
            child: SettingsActionCard(
              title: "Поддержка",
              iconData: Icons.message_outlined,
            ),
          ),
        ],
      ),
    );
  }
}
