import 'package:flutter/material.dart' hide SearchBar;
import 'package:flutter_travel_news_app/config/app_data.dart';
import 'package:flutter_travel_news_app/config/app_state.dart';
import 'package:flutter_travel_news_app/config/app_theme.dart';
import 'package:flutter_travel_news_app/l10n/app_localizations.dart';
import 'package:flutter_travel_news_app/widgets/widgets.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  static const String name = 'home_screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _shortListKey = GlobalKey();
  String _searchQuery = '';

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _search(String query) {
    setState(() => _searchQuery = query.trim());
    FocusManager.instance.primaryFocus?.unfocus();
  }

  Future<void> _showAllShorts() async {
    final target = _shortListKey.currentContext;
    if (target != null) {
      await Scrollable.ensureVisible(
        target,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
        alignment: 0.15,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isBookmarksView =
        GoRouterState.of(context).uri.queryParameters['view'] == 'bookmarks';
    final hasSavedArticle = AppStateScope.of(context).detailBookmarked;
    final normalizedQuery = _searchQuery.toLowerCase();
    final featuredMatches = normalizedQuery.isEmpty ||
        [
          l10n.featuredHeadline,
          l10n.featuredAuthor,
          l10n.detailTitle,
        ].any((value) => value.toLowerCase().contains(normalizedQuery));
    final trendingMatches = normalizedQuery.isEmpty ||
        l10n.trendingIslandHeadline.toLowerCase().contains(normalizedQuery);
    final showFeatured =
        featuredMatches && (!isBookmarksView || hasSavedArticle);
    final showTrending =
        trendingMatches && !isBookmarksView && normalizedQuery.isNotEmpty;
    final resultCount = (showFeatured ? 1 : 0) + (showTrending ? 1 : 0);
    const listImages = AppData.listNetworkImages;
    final listChips = [
      l10n.health,
      l10n.music,
      l10n.sports,
      l10n.technology,
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const AppBarWidget(),
                const SizedBox(height: 35),
                SearchBar(onSearch: _search),
                if (_searchQuery.isNotEmpty) ...[
                  const SizedBox(height: 10),
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      resultCount == 0
                          ? l10n.noSearchResults
                          : l10n.searchResults(resultCount),
                      style: MyTheme.subtitleMedium(context),
                    ),
                  ),
                ],
                const SizedBox(height: 15),
                SizedBox(
                  height: 30,
                  child: ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: listChips.length,
                    itemBuilder: (context, index) =>
                        ChipContainer(content: '#${listChips[index]}'),
                  ),
                ),
                const SizedBox(height: 30),
                if (isBookmarksView) ...[
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      l10n.savedArticles,
                      style: MyTheme.titleLarge(context),
                    ),
                  ),
                  const SizedBox(height: 10),
                  if (showFeatured)
                    SizedBox(
                      height: 304,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          VerticalCardWidget(imageUrl: listImages.first),
                        ],
                      ),
                    )
                  else
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 36),
                      child: Text(
                        hasSavedArticle
                            ? l10n.noSearchResults
                            : l10n.noSavedArticles,
                        style: MyTheme.subtitleMedium(context),
                      ),
                    ),
                ] else ...[
                  if (showFeatured)
                    SizedBox(
                      height: 304,
                      child: ListView.builder(
                        primary: false,
                        scrollDirection: Axis.horizontal,
                        itemCount: listImages.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsetsDirectional.only(end: 10),
                          child: VerticalCardWidget(
                            imageUrl: listImages[index],
                          ),
                        ),
                      ),
                    ),
                  if (showFeatured) const SizedBox(height: 30),
                  if (showTrending || normalizedQuery.isEmpty)
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            l10n.shortForYou,
                            style: MyTheme.titleLarge(context),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        TextButton(
                          onPressed: _showAllShorts,
                          child: Text(
                            l10n.viewAll,
                            style: MyTheme.textButtonStyleSmall(context),
                          ),
                        ),
                      ],
                    ),
                  if (showTrending || normalizedQuery.isEmpty)
                    const SizedBox(height: 19),
                  if (showTrending || normalizedQuery.isEmpty)
                    SizedBox(
                      key: _shortListKey,
                      height: 88,
                      child: ListView.builder(
                        primary: false,
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: listImages.length,
                        itemBuilder: (context, index) =>
                            HorizontalCardWidget(imageUrl: listImages[index]),
                      ),
                    ),
                ],
                const SizedBox(height: 12),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
