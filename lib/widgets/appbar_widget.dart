import 'package:flutter/material.dart';
import 'package:flutter_travel_news_app/config/app_locale.dart';
import 'package:flutter_travel_news_app/l10n/app_localizations.dart';

import '../config/app_theme.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final selectedLanguage = Localizations.localeOf(context).languageCode;
    return Row(
      children: [
        Container(
          height: 51,
          width: 51,
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
                l10n.welcomeBack,
                style: MyTheme.titleLarge(context),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                l10n.homeDate,
                style: MyTheme.subtitleMedium(context),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ),
        PopupMenuButton<Locale>(
          tooltip: l10n.changeLanguage,
          icon: Icon(
            Icons.language,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          onSelected: AppLocaleScope.of(context).setLocale,
          itemBuilder: (context) => [
            PopupMenuItem(
              value: const Locale('en'),
              child: Row(
                children: [
                  Expanded(child: Text(l10n.english)),
                  if (selectedLanguage == 'en')
                    Icon(
                      Icons.check,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                ],
              ),
            ),
            PopupMenuItem(
              value: const Locale('tr'),
              child: Row(
                children: [
                  Expanded(child: Text(l10n.turkish)),
                  if (selectedLanguage == 'tr')
                    Icon(
                      Icons.check,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
