import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_travel_news_app/config/app_router.dart';
import 'package:flutter_travel_news_app/main.dart';
import 'package:share_plus_platform_interface/share_plus_platform_interface.dart';

Widget buildTestApp() {
  return DevicePreview(
    enabled: false,
    builder: (context) => const MyApp(),
  );
}

void main() {
  setUp(() => AppRouter.appRouter.go('/'));

  testWidgets('language menu changes the app locale in place',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildTestApp());
    await tester.pumpAndSettle();

    expect(find.text('Welcome Back!'), findsOneWidget);
    final homeScaffold = tester.element(find.byType(Scaffold).first);
    expect(Theme.of(homeScaffold).brightness, Brightness.light);

    await tester.tap(find.byTooltip('Change language'));
    await tester.pumpAndSettle();
    expect(find.text('English 🇬🇧'), findsOneWidget);
    expect(find.byIcon(Icons.check), findsOneWidget);

    await tester.tap(find.text('Türkçe 🇹🇷'));
    await tester.pumpAndSettle();
    expect(find.text('Tekrar hoş geldiniz!'), findsOneWidget);
    expect(find.byTooltip('Dili değiştir'), findsOneWidget);

    await tester.tap(find.byTooltip('Dili değiştir'));
    await tester.pumpAndSettle();
    expect(find.byIcon(Icons.check), findsOneWidget);
  });

  testWidgets('system brightness selects the matching theme',
      (WidgetTester tester) async {
    tester.platformDispatcher.platformBrightnessTestValue = Brightness.dark;
    await tester.pumpWidget(buildTestApp());
    await tester.pump();

    final scaffold = tester.element(find.byType(Scaffold).first);
    expect(Theme.of(scaffold).brightness, Brightness.dark);
    expect(Theme.of(scaffold).scaffoldBackgroundColor, const Color(0xFF101C2A));

    tester.platformDispatcher.clearPlatformBrightnessTestValue();
  });

  testWidgets('search filters content and the share control invokes sharing',
      (WidgetTester tester) async {
    final previousSharePlatform = SharePlatform.instance;
    final sharePlatform = _TestSharePlatform();
    SharePlatform.instance = sharePlatform;
    addTearDown(() => SharePlatform.instance = previousSharePlatform);

    await tester.pumpWidget(buildTestApp());
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField), 'trending');
    await tester.ensureVisible(find.byTooltip('Search'));
    await tester.tap(find.byTooltip('Search'));
    await tester.pumpAndSettle();

    expect(find.text('Top Trending Islands in 2023'), findsWidgets);
    expect(
        find.text('Feel the thrill at the only surf simulator in the Maldives'),
        findsNothing);

    await tester.enterText(find.byType(TextField), '');
    await tester.ensureVisible(find.byTooltip('Search'));
    await tester.tap(find.byTooltip('Search'));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.byTooltip('Share article').first);
    await tester.tap(find.byTooltip('Share article').first);
    await tester.pumpAndSettle();
    expect(
      sharePlatform.sharedText,
      'Feel the thrill at the only surf simulator in the Maldives',
    );
  });

  testWidgets('bookmark and bottom navigation actions use existing app state',
      (WidgetTester tester) async {
    await tester.binding.setSurfaceSize(const Size(390, 650));
    addTearDown(() => tester.binding.setSurfaceSize(null));
    await tester.pumpWidget(buildTestApp());
    await tester.pumpAndSettle();

    await tester.tap(find
        .text('Feel the thrill at the only surf simulator in the Maldives')
        .first);
    await tester.pumpAndSettle();
    expect(find.text('Unravel the mysteries of the Maldives'), findsOneWidget);

    final detailScroll = tester.state<ScrollableState>(
      find
          .descendant(
            of: find.byType(CustomScrollView),
            matching: find.byWidgetPredicate(
              (widget) =>
                  widget is Scrollable &&
                  widget.axisDirection == AxisDirection.down,
            ),
          )
          .first,
    );
    expect(detailScroll.position.maxScrollExtent, greaterThan(0));
    detailScroll.position.jumpTo(100);
    await tester.pumpAndSettle();
    expect(detailScroll.position.pixels, greaterThan(0));
    await tester.tap(find.byTooltip('Go back'));
    await tester.pumpAndSettle();
    expect(find.text('Welcome Back!'), findsOneWidget);
    await tester.tap(find
        .text('Feel the thrill at the only surf simulator in the Maldives')
        .first);
    await tester.pumpAndSettle();

    await tester.tap(find.byTooltip('Save article'));
    await tester.pumpAndSettle();
    expect(find.text('Article saved.'), findsOneWidget);

    await tester.tap(find.byTooltip('Go back'));
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Bookmarks'));
    await tester.pumpAndSettle();
    expect(find.text('Saved articles'), findsOneWidget);
    expect(find.text("You haven't saved any articles yet."), findsNothing);

    await tester.tap(find.byTooltip('Profile'));
    await tester.pumpAndSettle();
    expect(find.text('Popular From Ivan'), findsOneWidget);

    final notificationButton = tester.widget<IconButton>(
      find
          .ancestor(
            of: find.byTooltip('Notifications'),
            matching: find.byType(IconButton),
          )
          .first,
    );
    notificationButton.onPressed!();
    await tester.pumpAndSettle();
    expect(
      find.text("Notifications aren't available in this app."),
      findsOneWidget,
    );
  });

  testWidgets('home and user post support vertical and horizontal scrolling',
      (WidgetTester tester) async {
    await tester.binding.setSurfaceSize(const Size(390, 650));
    addTearDown(() => tester.binding.setSurfaceSize(null));
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    final homeVerticalScroll = tester
        .widgetList<Scrollable>(find.byType(Scrollable))
        .firstWhere(
            (scrollable) => scrollable.axisDirection == AxisDirection.down);
    final homeScroll =
        tester.state<ScrollableState>(find.byWidget(homeVerticalScroll));
    await tester.ensureVisible(find.text('View All'));
    await tester.tap(find.text('View All'));
    await tester.pumpAndSettle();
    expect(homeScroll.position.pixels, greaterThan(0));
    final homeCardList = find.byType(ListView).at(1);
    await tester.ensureVisible(homeCardList);
    final homeHorizontalScroll = tester.state<ScrollableState>(
      find
          .ancestor(
            of: homeCardList,
            matching: find.byType(Scrollable),
          )
          .first,
    );
    await tester.drag(homeCardList, const Offset(-250, 0));
    await tester.pumpAndSettle();
    expect(homeHorizontalScroll.position.pixels, greaterThan(0));

    await tester.tap(find.byTooltip('Profile'));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.text('View All'));
    await tester.tap(find.text('View All'));
    await tester.pumpAndSettle();
    final userCardList = find.byType(ListView).first;
    final userHorizontalScroll = tester.state<ScrollableState>(
      find
          .ancestor(
            of: userCardList,
            matching: find.byType(Scrollable),
          )
          .first,
    );
    await tester.drag(userCardList, const Offset(-250, 0));
    await tester.pumpAndSettle();
    expect(userHorizontalScroll.position.pixels, greaterThan(0));
    final userVerticalScroll = tester
        .widgetList<Scrollable>(find.byType(Scrollable))
        .firstWhere(
            (scrollable) => scrollable.axisDirection == AxisDirection.down);
    expect(
      tester
          .state<ScrollableState>(find.byWidget(userVerticalScroll))
          .position
          .pixels,
      greaterThan(0),
    );
  });
}

class _TestSharePlatform extends SharePlatform {
  String? sharedText;

  @override
  Future<ShareResult> share(
    String text, {
    String? subject,
    Rect? sharePositionOrigin,
  }) async {
    sharedText = text;
    return const ShareResult('shared', ShareResultStatus.success);
  }
}
