// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get welcomeBack => 'Tekrar hoş geldiniz!';

  @override
  String get homeDate => '3 Ekim Pazartesi';

  @override
  String get changeLanguage => 'Dili değiştir';

  @override
  String get english => 'English 🇬🇧';

  @override
  String get turkish => 'Türkçe 🇹🇷';

  @override
  String get searchHint => 'Makale ara...';

  @override
  String get health => 'Sağlık';

  @override
  String get music => 'Müzik';

  @override
  String get sports => 'Spor';

  @override
  String get technology => 'Teknoloji';

  @override
  String get shortForYou => 'Size Özel Kısa Haberler';

  @override
  String get viewAll => 'Tümünü Gör';

  @override
  String get trendingIslandHeadline => '2023\'ün en popüler adaları';

  @override
  String get articleViews => '40.999';

  @override
  String get featuredHeadline =>
      'Maldivler\'deki tek sörf simülatöründe heyecanı yaşayın';

  @override
  String get featuredAuthor => 'Sang Dong-Min';

  @override
  String get featuredDate => '8 Mayıs 2023';

  @override
  String get shareArticle => 'Makaleyi paylaş';

  @override
  String get detailTitle => 'Maldivler\'in gizemlerini keşfedin';

  @override
  String get detailAuthorAndReadTime =>
      'Keanu Carpent · 18 Mayıs · 8 dakikalık okuma';

  @override
  String get articleBody =>
      'Maldivler, Hint Okyanusu\'na dağılmış binden fazla adadan oluşur. Berrak lagünlerin ve beyaz kumsalların ötesinde her adanın, yüzyıllar boyunca denizcilik, ticaret ve yerel geleneklerle şekillenmiş kendine özgü bir hikâyesi vardır. Mercan bahçelerini keşfedin, bu atollere yuva diyen topluluklarla tanışın ve burada yaşamın neden denizin ritmine göre aktığını görün.';

  @override
  String get userPostQuote =>
      'Yediğim her çikolatanın acısı şimdi benden çıkıyor... Tatlılar intikamını fena alıyor...';

  @override
  String get ivansPost => 'Ivan\'ın Gönderileri';

  @override
  String get popularFromIvan => 'Ivan\'dan Popülerler';

  @override
  String get followers => 'Takipçi';

  @override
  String get followersCount => '54,21 B';

  @override
  String get posts => 'Gönderi';

  @override
  String get postsCount => '2,11 B';

  @override
  String get following => 'Takip';

  @override
  String get followingCount => '36,40 B';

  @override
  String get authorAndWriter => 'Yazar';

  @override
  String get back => 'Geri';

  @override
  String get newsPolitics => 'Haberler: Siyaset';

  @override
  String get postDate => '16 Mayıs';

  @override
  String get eurovisionHeadline =>
      'İlk gecenin en unutulmaz Eurovision performansları';

  @override
  String get postTime => '21.32';

  @override
  String get navHome => 'Ana Sayfa';

  @override
  String get navBookmarks => 'Yer İşaretleri';

  @override
  String get navNotifications => 'Bildirimler';

  @override
  String get navProfile => 'Profil';

  @override
  String get search => 'Ara';

  @override
  String get goBack => 'Geri dön';

  @override
  String get imageUnavailable => 'Görsel yüklenemedi';

  @override
  String get noSearchResults => 'Aramanızla eşleşen makale yok.';

  @override
  String get savedArticles => 'Kaydedilen makaleler';

  @override
  String get noSavedArticles => 'Henüz makale kaydetmediniz.';

  @override
  String get notificationsUnavailable =>
      'Bu uygulamada bildirimler kullanılamıyor.';

  @override
  String get close => 'Kapat';

  @override
  String get followActionUnavailable =>
      'Takip etmek için uygulamada bulunmayan bir hesap hizmeti gerekiyor.';

  @override
  String get playbackUnavailable =>
      'Bu makale için video oynatma kullanılamıyor.';

  @override
  String get bookmarkArticle => 'Makaleyi kaydet';

  @override
  String get removeBookmark => 'Kaydedilen makaleyi kaldır';

  @override
  String get articleSaved => 'Makale kaydedildi.';

  @override
  String get articleRemoved => 'Makale kaydedilenlerden kaldırıldı.';

  @override
  String get shareFailed => 'Makale paylaşılamadı.';

  @override
  String searchResults(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count makale bulundu',
      one: '1 makale bulundu',
    );
    return '$_temp0';
  }
}
