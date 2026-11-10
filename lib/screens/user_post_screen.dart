import 'package:flutter/material.dart';
import 'package:flutter_travel_news_app/config/app_theme.dart';
import 'package:flutter_travel_news_app/config/custom_icons.dart';
import 'package:flutter_travel_news_app/l10n/app_localizations.dart';
import 'package:flutter_travel_news_app/widgets/widgets.dart';
import 'package:go_router/go_router.dart';

import '../config/app_data.dart';

class UserPostScreen extends StatefulWidget {
  static const String name = 'user_post_screen';
  const UserPostScreen({super.key});

  @override
  State<UserPostScreen> createState() => _UserPostScreenState();
}

class _UserPostScreenState extends State<UserPostScreen> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _postsKey = GlobalKey();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _showAllPosts() async {
    final target = _postsKey.currentContext;
    if (target != null) {
      await Scrollable.ensureVisible(
        target,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
        alignment: 0.1,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    const List<String> listImages = AppData.listNetworkImages;
    final size = MediaQuery.of(context).size;
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: MyTheme.scafoldBackgroundColor(context),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Padding(
            padding:
                const EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppBarWidget(),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(right: 45),
                  child: Text(
                    l10n.userPostQuote,
                    style: MyTheme.subtitleMedium(context),
                  ),
                ),
                const SizedBox(height: 20),
                const FollowersWidget(),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(l10n.ivansPost, style: MyTheme.titleLarge(context)),
                    const Spacer(),
                    TextButton(
                      onPressed: _showAllPosts,
                      child: Text(
                        l10n.viewAll,
                        style: MyTheme.textButtonStyleSmall(context),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                // USER POSTS
                SizedBox(
                  key: _postsKey,
                  height: 130,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: listImages.length,
                    itemBuilder: (BuildContext context, int index) {
                      return HorizontalPostCardWidget(
                        imageUrl: listImages[index],
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Text(l10n.popularFromIvan, style: MyTheme.titleLarge(context)),
                const SizedBox(height: 20),

                // POPULARS LISTVIEW
                SizedBox(
                  height: 220,
                  child: ListView.builder(
                    primary: false,
                    scrollDirection: Axis.horizontal,
                    itemCount: listImages.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: SizedBox(
                          width: size.width * 0.7,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              listImages[index],
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  const NetworkImageFallback(),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pop();
        },
        tooltip: l10n.goBack,
        child: Icon(
          CustomIcons.arrow_back_icon,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
    );
  }
}

class FollowersWidget extends StatelessWidget {
  const FollowersWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      constraints: const BoxConstraints(minHeight: 95),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: colors.surfaceContainerHighest,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Text(
                  l10n.followersCount,
                  style: MyTheme.titleFollowers(context),
                ),
                Text(l10n.followers, style: MyTheme.subtitleFollowers(context)),
              ],
            ),
          ),
          const FollowerDivider(),
          Expanded(
            child: Column(
              children: [
                Text(l10n.postsCount, style: MyTheme.titleFollowers(context)),
                Text(l10n.posts, style: MyTheme.subtitleFollowers(context)),
              ],
            ),
          ),
          const FollowerDivider(),
          Expanded(
            child: Column(
              children: [
                Text(
                  l10n.followingCount,
                  style: MyTheme.titleFollowers(context),
                ),
                Text(l10n.following, style: MyTheme.subtitleFollowers(context)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FollowerDivider extends StatelessWidget {
  const FollowerDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      width: 9,
      alignment: Alignment.center,
      child: Container(
        height: 38,
        width: 1,
        color: Theme.of(context).colorScheme.outline,
      ),
    );
  }
}

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Row(
      children: [
        Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: SizedBox(
            child: Image.asset('assets/images/user1.png'),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ivan Saul',
                style: MyTheme.titleLarge(context),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                l10n.authorAndWriter,
                style: MyTheme.titleSmall(context),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ),
        const SizedBox(width: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Material(
            color: MyTheme.buttonBackground(context),
            child: InkWell(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(l10n.followActionUnavailable)),
                );
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 13, horizontal: 12),
                child: Text(
                  l10n.following,
                  style: MyTheme.filledtButtonTextSmall(context),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
