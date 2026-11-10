import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_travel_news_app/screens/screens.dart';
import 'package:flutter_travel_news_app/l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colors = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 53),
      height: 82,
      color: colors.surface,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _NavigationIcon(
            asset: 'assets/icons/home_selected_icon.svg',
            label: l10n.navHome,
            color: colors.secondary,
            onTap: () => context.go('/'),
          ),
          _NavigationIcon(
            asset: 'assets/icons/bookmark_unselected_icon.svg',
            label: l10n.navBookmarks,
            color: colors.onSurfaceVariant,
            onTap: () => context.go('/?view=bookmarks'),
          ),
          _NavigationIcon(
            asset: 'assets/icons/notification_unselected_icon.svg',
            label: l10n.navNotifications,
            color: colors.onSurfaceVariant,
            onTap: () => showDialog<void>(
              context: context,
              builder: (context) => AlertDialog(
                content: Text(l10n.notificationsUnavailable),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text(l10n.close),
                  ),
                ],
              ),
            ),
          ),
          _NavigationIcon(
            asset: 'assets/icons/profile_unselected_icon.svg',
            label: l10n.navProfile,
            color: colors.onSurfaceVariant,
            onTap: () => context.goNamed(UserPostScreen.name),
          ),
        ],
      ),
    );
  }
}

class _NavigationIcon extends StatelessWidget {
  const _NavigationIcon({
    required this.asset,
    required this.label,
    required this.color,
    required this.onTap,
  });

  final String asset;
  final String label;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: label,
      button: true,
      child: IconButton(
        tooltip: label,
        onPressed: onTap,
        icon: ColorFiltered(
          colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
          child: SvgPicture.asset(asset, width: 24, height: 24),
        ),
      ),
    );
  }
}
