import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter_travel_news_app/screens/screens.dart';
import 'package:flutter_travel_news_app/l10n/app_localizations.dart';
import 'package:flutter_travel_news_app/widgets/network_image_fallback.dart';
import 'package:go_router/go_router.dart';

import '../config/app_theme.dart';

class VerticalCardWidget extends StatelessWidget {
  final String imageUrl;
  const VerticalCardWidget({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colors = Theme.of(context).colorScheme;
    return SizedBox(
      width: 255,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          top: 10,
          right: 10,
          bottom: 12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                imageUrl,
                height: 164,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    const NetworkImageFallback(),
              ),
            ),
            const SizedBox(height: 18),
            GestureDetector(
              onTap: () {
                context.pushNamed(DetailScreen.name);
              },
              child: Text(
                l10n.featuredHeadline,
                style: MyTheme.titleMedium(context),
                textAlign: TextAlign.start,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                ClipOval(
                  child: Image.network(
                    'https://i.imgur.com/hQ5xaVn.jpg',
                    width: 38,
                    height: 38,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const NetworkImageFallback(),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      context.pushNamed(UserPostScreen.name);
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l10n.featuredAuthor,
                          style: MyTheme.titleSmall(context),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          l10n.featuredDate,
                          style: MyTheme.subtitleMedium(context),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  height: 37,
                  width: 37,
                  decoration: BoxDecoration(
                    color: colors.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: IconButton(
                    tooltip: l10n.shareArticle,
                    onPressed: () async {
                      try {
                        final result = await Share.share(l10n.featuredHeadline);
                        if (result.status == ShareResultStatus.unavailable &&
                            context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(l10n.shareFailed)),
                          );
                        }
                      } on PlatformException {
                        if (!context.mounted) return;
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(l10n.shareFailed)),
                        );
                      } on MissingPluginException {
                        if (!context.mounted) return;
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(l10n.shareFailed)),
                        );
                      }
                    },
                    icon: ColorFiltered(
                      colorFilter:
                          ColorFilter.mode(colors.secondary, BlendMode.srcIn),
                      child: SvgPicture.asset('assets/icons/share_icon.svg'),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
