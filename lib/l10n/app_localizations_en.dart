// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get welcomeBack => 'Welcome Back!';

  @override
  String get homeDate => 'Monday, 3 October';

  @override
  String get changeLanguage => 'Change language';

  @override
  String get english => 'English 🇬🇧';

  @override
  String get turkish => 'Türkçe 🇹🇷';

  @override
  String get searchHint => 'Search for an article...';

  @override
  String get health => 'Health';

  @override
  String get music => 'Music';

  @override
  String get sports => 'Sports';

  @override
  String get technology => 'Technology';

  @override
  String get shortForYou => 'Short For You';

  @override
  String get viewAll => 'View All';

  @override
  String get trendingIslandHeadline => 'Top Trending Islands in 2023';

  @override
  String get articleViews => '40,999';

  @override
  String get featuredHeadline =>
      'Feel the thrill at the only surf simulator in the Maldives';

  @override
  String get featuredAuthor => 'Sang Dong-Min';

  @override
  String get featuredDate => 'May 8, 2023';

  @override
  String get shareArticle => 'Share article';

  @override
  String get detailTitle => 'Unravel the mysteries of the Maldives';

  @override
  String get detailAuthorAndReadTime => 'Keanu Carpent · May 18 · 8 min read';

  @override
  String get articleBody =>
      'The Maldives is a collection of more than a thousand islands scattered across the Indian Ocean. Beyond its clear lagoons and white-sand beaches, each island has its own story, shaped by centuries of seafaring, trade, and local tradition. Explore coral gardens, meet the communities who call these atolls home, and discover why life here moves to the rhythm of the sea.';

  @override
  String get userPostQuote =>
      'Every piece of chocolate I ever ate is getting back at me... desserts are very revengeful...';

  @override
  String get ivansPost => 'Ivan\'s Post';

  @override
  String get popularFromIvan => 'Popular From Ivan';

  @override
  String get followers => 'Followers';

  @override
  String get followersCount => '54.21K';

  @override
  String get posts => 'Posts';

  @override
  String get postsCount => '2.11K';

  @override
  String get following => 'Following';

  @override
  String get followingCount => '36.40K';

  @override
  String get authorAndWriter => 'Author & Writer';

  @override
  String get back => 'Back';

  @override
  String get newsPolitics => 'News: Politics';

  @override
  String get postDate => '16th May';

  @override
  String get eurovisionHeadline =>
      'The most iconic Eurovision performances from night one';

  @override
  String get postTime => '09:32 pm';

  @override
  String get navHome => 'Home';

  @override
  String get navBookmarks => 'Bookmarks';

  @override
  String get navNotifications => 'Notifications';

  @override
  String get navProfile => 'Profile';

  @override
  String get search => 'Search';

  @override
  String get goBack => 'Go back';

  @override
  String get imageUnavailable => 'Image unavailable';

  @override
  String get noSearchResults => 'No articles match your search.';

  @override
  String get savedArticles => 'Saved articles';

  @override
  String get noSavedArticles => 'You haven\'t saved any articles yet.';

  @override
  String get notificationsUnavailable =>
      'Notifications aren\'t available in this app.';

  @override
  String get close => 'Close';

  @override
  String get followActionUnavailable =>
      'Following requires an account service, which isn\'t available.';

  @override
  String get playbackUnavailable =>
      'Video playback isn\'t available for this article.';

  @override
  String get bookmarkArticle => 'Save article';

  @override
  String get removeBookmark => 'Remove saved article';

  @override
  String get articleSaved => 'Article saved.';

  @override
  String get articleRemoved => 'Article removed from saved articles.';

  @override
  String get shareFailed => 'The article couldn\'t be shared.';

  @override
  String searchResults(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count articles found',
      one: '1 article found',
    );
    return '$_temp0';
  }
}
