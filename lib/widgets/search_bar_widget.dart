import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_travel_news_app/l10n/app_localizations.dart';

import '../config/app_theme.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({
    super.key,
    required this.onSearch,
  });

  final ValueChanged<String> onSearch;

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final l10n = AppLocalizations.of(context)!;
    return Container(
      height: 49,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: colors.surfaceContainerHighest,
        boxShadow: [
          BoxShadow(
            color: colors.shadow.withValues(alpha: 0.16),
            blurRadius: 10,
            spreadRadius: 0,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13.0),
              child: TextField(
                controller: _controller,
                textInputAction: TextInputAction.search,
                onSubmitted: widget.onSearch,
                style: MyTheme.subtitleMedium(context),
                cursorColor: MyTheme.cursorColor(context),
                decoration: InputDecoration(
                    hintText: l10n.searchHint,
                    hintStyle: MyTheme.subtitleMedium(context),
                    border: InputBorder.none),
              ),
            ),
          ),
          Container(
            height: 49,
            width: 47,
            decoration: BoxDecoration(
                color: MyTheme.buttonBackground(context),
                borderRadius: BorderRadius.circular(15)),
            child: IconButton(
              onPressed: () => widget.onSearch(_controller.text),
              tooltip: l10n.search,
              icon: ColorFiltered(
                colorFilter:
                    ColorFilter.mode(colors.onPrimary, BlendMode.srcIn),
                child: SvgPicture.asset(
                  'assets/icons/search_icon.svg',
                  height: 20,
                  width: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
