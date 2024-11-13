import 'package:flutter/material.dart';
import 'package:flutter_rhymes/ui/ui.dart';

class RhymeHistoryCard extends StatelessWidget {
  const RhymeHistoryCard({
    super.key,
    required this.rhymes,
  });

  final List<String> rhymes;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final String text = rhymes.join(',  ');

    return BaseCard(
      padding: const EdgeInsets.all(16),
      width: 200,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Слово',
            style: theme.textTheme.bodyLarge
                ?.copyWith(fontWeight: FontWeight.w700),
          ),
          Text(
            text,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w800,
                color: theme.hintColor.withOpacity(0.4),
                fontSize: 13),
          ),
        ],
      ),
    );
  }
}
