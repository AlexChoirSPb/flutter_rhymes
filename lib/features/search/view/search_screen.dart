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
              onTap: () {
                showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  isScrollControlled: true,
                  elevation: 0,
                  context: context,
                  builder: (context) => Padding(
                    padding: const EdgeInsets.only(top: 60),
                    child: BaseBottomSheet(
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: theme.hintColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const TextField(
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 12),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: theme.primaryColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            height: 48,
                            width: 48,
                            child: const Icon(
                              Icons.search_rounded,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
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
}

class BaseBottomSheet extends StatelessWidget {
  const BaseBottomSheet({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: child,
          ),
        ],
      ),
    );
  }
}
