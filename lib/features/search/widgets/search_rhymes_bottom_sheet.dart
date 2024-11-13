import 'package:flutter/material.dart';
import 'package:flutter_rhymes/ui/ui.dart';

class SearchRhymesBottomSheet extends StatelessWidget {
  const SearchRhymesBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BaseBottomSheet(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: theme.hintColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide.none),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide.none),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 12),
                        hintText: "Начни вводить слово...",
                        hintStyle: TextStyle(
                          color: theme.hintColor.withOpacity(0.5),
                        ),
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
          Divider(
            height: 1,
            color: theme.primaryColor.withOpacity(0.3),
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) => ListTile(
                      title: Text('Слово из автокомплита $index'),
                    ),
                separatorBuilder: (context, index) => const Divider(
                      height: 1,
                    ),
                itemCount: 15),
          )
        ],
      ),
    );
  }
}
