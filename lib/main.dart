import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFFF82B10);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: primaryColor,
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFEFF1F3),
      ),
      home: const HomeScreen(),
    );
  }
}

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
        children: [
          SearchScreen(),
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
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(70),
            child: SearchButton(),
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
          itemBuilder: (context, index) => const RhymeListCard(),
        )
      ],
    );
  }
}

class RhymeHistoryCard extends StatelessWidget {
  const RhymeHistoryCard({
    super.key,
    required this.rhymes,
  });

  final List<String> rhymes;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
          Wrap(
            children: rhymes
                .map((e) => Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: Text(e),
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}

class BaseCard extends StatelessWidget {
  const BaseCard(
      {super.key, required this.child, this.width, this.margin, this.padding});

  final Widget child;
  final double? width;
  final EdgeInsets? margin;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
        width: width ?? double.infinity,
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
            color: theme.cardColor, borderRadius: BorderRadius.circular(8)),
        child: child);
  }
}

class RhymeListCard extends StatelessWidget {
  const RhymeListCard({
    super.key,
  });

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
          Text(
            'Рифма',
            style: theme.textTheme.bodyLarge,
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite,
                color: theme.hintColor.withOpacity(0.2),
              ))
        ],
      ),
    );
  }
}

class SearchButton extends StatelessWidget {
  const SearchButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: theme.hintColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16)),
        child: Row(
          children: [
            const Icon(Icons.search_outlined),
            const SizedBox(
              width: 12,
            ),
            Text(
              "Поиск",
              style: TextStyle(
                  fontSize: 18,
                  color: theme.hintColor.withOpacity(0.5),
                  fontWeight: FontWeight.w500),
            ),
          ],
        ));
  }
}
