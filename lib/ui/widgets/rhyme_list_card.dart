import 'package:flutter/material.dart';
import 'package:flutter_rhymes/ui/ui.dart';

class RhymeListCard extends StatelessWidget {
  const RhymeListCard({
    super.key,
    this.isFavorite = false,
    required this.rhyme,
    this.sourceWord,
  });

  final bool isFavorite;
  final String rhyme;
  final String? sourceWord;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BaseCard(
      margin: const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 10),
      padding: const EdgeInsets.only(
        left: 12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              if (sourceWord != null) ...[
                Text(
                  sourceWord!,
                  style: theme.textTheme.bodyLarge,
                ),
                const SizedBox(
                  width: 4,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                    color: theme.hintColor.withOpacity(0.4),
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
              ],
              Text(
                rhyme,
                style: theme.textTheme.bodyLarge
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite,
                color: isFavorite
                    ? theme.primaryColor
                    : theme.hintColor.withOpacity(0.2),
              ))
        ],
      ),
    );
  }
}
