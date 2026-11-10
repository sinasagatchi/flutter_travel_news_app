import 'package:flutter/material.dart';
import 'package:flutter_travel_news_app/l10n/app_localizations.dart';

class NetworkImageFallback extends StatelessWidget {
  const NetworkImageFallback({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ColoredBox(
      color: colors.surfaceContainerHighest,
      child: Semantics(
        label: AppLocalizations.of(context)!.imageUnavailable,
        child: Center(
          child: Icon(
            Icons.broken_image_outlined,
            color: colors.onSurfaceVariant,
          ),
        ),
      ),
    );
  }
}
