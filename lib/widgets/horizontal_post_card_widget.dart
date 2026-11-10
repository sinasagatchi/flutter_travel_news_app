import 'package:flutter/material.dart';
import 'package:flutter_travel_news_app/config/app_theme.dart';
import 'package:flutter_travel_news_app/config/custom_icons.dart';
import 'package:flutter_travel_news_app/l10n/app_localizations.dart';
import 'package:flutter_travel_news_app/widgets/network_image_fallback.dart';

class HorizontalPostCardWidget extends StatelessWidget {
  final String imageUrl;
  const HorizontalPostCardWidget({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: SizedBox(
        width: size.width * 0.7,
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    imageUrl,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const NetworkImageFallback(),
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Icon(
                      CustomIcons.calendar_icon,
                      color: MyTheme.cursorColor(context),
                      size: 20,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      l10n.postDate,
                      style: MyTheme.subtitleMedium(context),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.newsPolitics,
                    style: MyTheme.subtitleMedium(context),
                  ),
                  const Spacer(),
                  Text(
                    l10n.eurovisionHeadline,
                    style: MyTheme.titleMedium(context),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Icon(
                        CustomIcons.time_icon,
                        color: MyTheme.cursorColor(context),
                        size: 20,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        l10n.postTime,
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
