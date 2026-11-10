import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_travel_news_app/config/app_data.dart';
import 'package:flutter_travel_news_app/config/app_theme.dart';
import 'package:flutter_travel_news_app/config/app_state.dart';
import 'package:flutter_travel_news_app/config/custom_icons.dart';
import 'package:flutter_travel_news_app/l10n/app_localizations.dart';
import 'package:flutter_travel_news_app/widgets/bottom_navbar.dart';
import 'package:flutter_travel_news_app/widgets/network_image_fallback.dart';
import 'package:go_router/go_router.dart';

class DetailScreen extends StatelessWidget {
  static const String name = 'detail_screen';

  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final l10n = AppLocalizations.of(context)!;
    final colors = Theme.of(context).colorScheme;
    const List<String> listImages = AppData.listNetworkImages;
    return Scaffold(
      body: SafeArea(
        top: false,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: MyTheme.buttonBackground(context),
              automaticallyImplyLeading: false,
              // toolbarHeight: 70,
              pinned: true,
              // floating: true,
              title: Row(
                children: [
                  const SizedBox(width: 10),
                  CustomButton(
                    iconData: CustomIcons.arrow_back_icon,
                    tooltip: l10n.goBack,
                    onPressed: () => context.pop(),
                  ),
                  const Spacer(),
                  CustomButton(
                    iconData: AppStateScope.of(context).detailBookmarked
                        ? CustomIcons.bookmark_selected_icon
                        : CustomIcons.bookmark_white_icon,
                    tooltip: AppStateScope.of(context).detailBookmarked
                        ? l10n.removeBookmark
                        : l10n.bookmarkArticle,
                    onPressed: () {
                      final state = AppStateScope.of(context);
                      state.toggleDetailBookmark();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            state.detailBookmarked
                                ? l10n.articleSaved
                                : l10n.articleRemoved,
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 10),
                ],
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(50),
                child: Container(
                  height: 30,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: colors.surface,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                ),
              ),
              expandedHeight: size.height * 0.4,
              flexibleSpace: FlexibleSpaceBar(
                background: Swiper(
                  autoplay: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Image.network(
                      listImages[index],
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const NetworkImageFallback(),
                    );
                  },
                  itemCount: listImages.length,
                  pagination: const SwiperPagination(
                      margin: EdgeInsets.only(bottom: 60)),

                  // viewportFraction: 0.8,
                  // scale: 0.9,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        l10n.detailTitle,
                        style: MyTheme.titleExtraLarge(context),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 10,
                      ),
                      height: 54,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context).dividerColor,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/user2.png'),
                          ),
                          const SizedBox(width: 13),
                          Expanded(
                            child: Text(
                              l10n.detailAuthorAndReadTime,
                              style: MyTheme.subtitleMedium(context),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      l10n.articleBody,
                      style: MyTheme.contentMedium(context),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData iconData;
  final String tooltip;
  final VoidCallback onPressed;
  const CustomButton({
    super.key,
    required this.iconData,
    required this.tooltip,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.onPrimary,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: IconButton(
        tooltip: tooltip,
        onPressed: onPressed,
        icon: Icon(
          iconData,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
    );
  }
}
