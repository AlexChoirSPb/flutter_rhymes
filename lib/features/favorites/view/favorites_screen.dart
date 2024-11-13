import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rhymes/ui/ui.dart';

@RoutePage()
class FavorivesScreen extends StatelessWidget {
  const FavorivesScreen({
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
            title: const Text("Избранное"),
            elevation: 0,
            surfaceTintColor: Colors.transparent,
            backgroundColor: theme.cardColor,
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 16,
            ),
          ),
          SliverList.builder(
            itemBuilder: (context, index) => const RhymeListCard(
              isFavorite: true,
            ),
          )
        ],
      ),
    );
  }
}
