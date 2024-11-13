import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rhymes/features/search/search.dart';
import 'package:flutter_rhymes/ui/ui.dart';

@RoutePage()
class SearchScreen extends StatelessWidget {
  const SearchScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          snap: true,
          floating: true,
          pinned: true,
          title: const Text("Phymer"),
          elevation: 0,
          surfaceTintColor: Colors.transparent,
          backgroundColor: theme.cardColor,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(70),
            child: SearchButton(
              onTap: () => _showSearchBottomSheet(context),
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 16,
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 100,
            child: ListView.separated(
              padding: const EdgeInsets.only(left: 16),
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                final rhymes = List.generate(4, (index) => 'Рифма $index');
                return RhymeHistoryCard(rhymes: rhymes);
              },
              separatorBuilder: (context, index) => const SizedBox(
                width: 16,
              ),
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 16,
          ),
        ),
        SliverList.builder(
          itemBuilder: (context, index) => const RhymeListCard(
            rhyme: "Рифма",
          ),
        )
      ],
    );
  }

  Future<dynamic> _showSearchBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      elevation: 0,
      context: context,
      builder: (context) => const Padding(
        padding: EdgeInsets.only(top: 60),
        child: SearchRhymesBottomSheet(),
      ),
    );
  }
}
