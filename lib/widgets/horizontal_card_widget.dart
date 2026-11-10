import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_travel_news_app/config/app_theme.dart';
import 'package:flutter_travel_news_app/l10n/app_localizations.dart';
import 'package:flutter_travel_news_app/widgets/network_image_fallback.dart';

class HorizontalCardWidget extends StatelessWidget {
  final String imageUrl;
  const HorizontalCardWidget({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.all(9),
      child: SizedBox(
        width: 208,
        child: Row(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    imageUrl,
                    height: 70,
                    width: 70,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const NetworkImageFallback(),
                  ),
                ),
                IconButton(
                  tooltip: AppLocalizations.of(context)!.playbackUnavailable,
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          AppLocalizations.of(context)!.playbackUnavailable,
                        ),
                      ),
                    );
                  },
                  icon: SvgPicture.asset(
                    'assets/icons/play_icon.svg',
                    height: 24,
                    width: 24,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 11),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.trendingIslandHeadline,
                    style: MyTheme.titleSmall(context),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      // IconButton(
                      //   onPressed: null,
                      //   icon: SvgPicture.asset(
                      //     'assets/icons/eye_icon.svg',
                      //   ),
                      // ),
                      Icon(
                        Icons.remove_red_eye_outlined,
                        color: MyTheme.cursorColor(context),
                        size: 20,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        l10n.articleViews,
                        style: MyTheme.subtitleMedium(context),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
