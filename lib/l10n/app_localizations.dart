import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_tr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('tr')
  ];

  /// No description provided for @welcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back!'**
  String get welcomeBack;

  /// No description provided for @homeDate.
  ///
  /// In en, this message translates to:
  /// **'Monday, 3 October'**
  String get homeDate;

  /// No description provided for @changeLanguage.
  ///
  /// In en, this message translates to:
  /// **'Change language'**
  String get changeLanguage;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English 🇬🇧'**
  String get english;

  /// No description provided for @turkish.
  ///
  /// In en, this message translates to:
  /// **'Türkçe 🇹🇷'**
  String get turkish;

  /// No description provided for @searchHint.
  ///
  /// In en, this message translates to:
  /// **'Search for an article...'**
  String get searchHint;

  /// No description provided for @health.
  ///
  /// In en, this message translates to:
  /// **'Health'**
  String get health;

  /// No description provided for @music.
  ///
  /// In en, this message translates to:
  /// **'Music'**
  String get music;

  /// No description provided for @sports.
  ///
  /// In en, this message translates to:
  /// **'Sports'**
  String get sports;

  /// No description provided for @technology.
  ///
  /// In en, this message translates to:
  /// **'Technology'**
  String get technology;

  /// No description provided for @shortForYou.
  ///
  /// In en, this message translates to:
  /// **'Short For You'**
  String get shortForYou;

  /// No description provided for @viewAll.
  ///
  /// In en, this message translates to:
  /// **'View All'**
  String get viewAll;

  /// No description provided for @trendingIslandHeadline.
  ///
  /// In en, this message translates to:
  /// **'Top Trending Islands in 2023'**
  String get trendingIslandHeadline;

  /// No description provided for @articleViews.
  ///
  /// In en, this message translates to:
  /// **'40,999'**
  String get articleViews;

  /// No description provided for @featuredHeadline.
  ///
  /// In en, this message translates to:
  /// **'Feel the thrill at the only surf simulator in the Maldives'**
  String get featuredHeadline;

  /// No description provided for @featuredAuthor.
  ///
  /// In en, this message translates to:
  /// **'Sang Dong-Min'**
  String get featuredAuthor;

  /// No description provided for @featuredDate.
  ///
  /// In en, this message translates to:
  /// **'May 8, 2023'**
  String get featuredDate;

  /// No description provided for @shareArticle.
  ///
  /// In en, this message translates to:
  /// **'Share article'**
  String get shareArticle;

  /// No description provided for @detailTitle.
  ///
  /// In en, this message translates to:
  /// **'Unravel the mysteries of the Maldives'**
  String get detailTitle;

  /// No description provided for @detailAuthorAndReadTime.
  ///
  /// In en, this message translates to:
  /// **'Keanu Carpent · May 18 · 8 min read'**
  String get detailAuthorAndReadTime;

  /// No description provided for @articleBody.
  ///
  /// In en, this message translates to:
  /// **'The Maldives is a collection of more than a thousand islands scattered across the Indian Ocean. Beyond its clear lagoons and white-sand beaches, each island has its own story, shaped by centuries of seafaring, trade, and local tradition. Explore coral gardens, meet the communities who call these atolls home, and discover why life here moves to the rhythm of the sea.'**
  String get articleBody;

  /// No description provided for @userPostQuote.
  ///
  /// In en, this message translates to:
  /// **'Every piece of chocolate I ever ate is getting back at me... desserts are very revengeful...'**
  String get userPostQuote;

  /// No description provided for @ivansPost.
  ///
  /// In en, this message translates to:
  /// **'Ivan\'s Post'**
  String get ivansPost;

  /// No description provided for @popularFromIvan.
  ///
  /// In en, this message translates to:
  /// **'Popular From Ivan'**
  String get popularFromIvan;

  /// No description provided for @followers.
  ///
  /// In en, this message translates to:
  /// **'Followers'**
  String get followers;

  /// No description provided for @followersCount.
  ///
  /// In en, this message translates to:
  /// **'54.21K'**
  String get followersCount;

  /// No description provided for @posts.
  ///
  /// In en, this message translates to:
  /// **'Posts'**
  String get posts;

  /// No description provided for @postsCount.
  ///
  /// In en, this message translates to:
  /// **'2.11K'**
  String get postsCount;

  /// No description provided for @following.
  ///
  /// In en, this message translates to:
  /// **'Following'**
  String get following;

  /// No description provided for @followingCount.
  ///
  /// In en, this message translates to:
  /// **'36.40K'**
  String get followingCount;

  /// No description provided for @authorAndWriter.
  ///
  /// In en, this message translates to:
  /// **'Author & Writer'**
  String get authorAndWriter;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @newsPolitics.
  ///
  /// In en, this message translates to:
  /// **'News: Politics'**
  String get newsPolitics;

  /// No description provided for @postDate.
  ///
  /// In en, this message translates to:
  /// **'16th May'**
  String get postDate;

  /// No description provided for @eurovisionHeadline.
  ///
  /// In en, this message translates to:
  /// **'The most iconic Eurovision performances from night one'**
  String get eurovisionHeadline;

  /// No description provided for @postTime.
  ///
  /// In en, this message translates to:
  /// **'09:32 pm'**
  String get postTime;

  /// No description provided for @navHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// No description provided for @navBookmarks.
  ///
  /// In en, this message translates to:
  /// **'Bookmarks'**
  String get navBookmarks;

  /// No description provided for @navNotifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get navNotifications;

  /// No description provided for @navProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get navProfile;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @goBack.
  ///
  /// In en, this message translates to:
  /// **'Go back'**
  String get goBack;

  /// No description provided for @imageUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Image unavailable'**
  String get imageUnavailable;

  /// No description provided for @noSearchResults.
  ///
  /// In en, this message translates to:
  /// **'No articles match your search.'**
  String get noSearchResults;

  /// No description provided for @savedArticles.
  ///
  /// In en, this message translates to:
  /// **'Saved articles'**
  String get savedArticles;

  /// No description provided for @noSavedArticles.
  ///
  /// In en, this message translates to:
  /// **'You haven\'t saved any articles yet.'**
  String get noSavedArticles;

  /// No description provided for @notificationsUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Notifications aren\'t available in this app.'**
  String get notificationsUnavailable;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @followActionUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Following requires an account service, which isn\'t available.'**
  String get followActionUnavailable;

  /// No description provided for @playbackUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Video playback isn\'t available for this article.'**
  String get playbackUnavailable;

  /// No description provided for @bookmarkArticle.
  ///
  /// In en, this message translates to:
  /// **'Save article'**
  String get bookmarkArticle;

  /// No description provided for @removeBookmark.
  ///
  /// In en, this message translates to:
  /// **'Remove saved article'**
  String get removeBookmark;

  /// No description provided for @articleSaved.
  ///
  /// In en, this message translates to:
  /// **'Article saved.'**
  String get articleSaved;

  /// No description provided for @articleRemoved.
  ///
  /// In en, this message translates to:
  /// **'Article removed from saved articles.'**
  String get articleRemoved;

  /// No description provided for @shareFailed.
  ///
  /// In en, this message translates to:
  /// **'The article couldn\'t be shared.'**
  String get shareFailed;

  /// No description provided for @searchResults.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 article found} other{{count} articles found}}'**
  String searchResults(num count);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'tr':
      return AppLocalizationsTr();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
