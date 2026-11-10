import 'package:flutter/material.dart';

class AppStateController extends ChangeNotifier {
  bool _detailBookmarked = false;

  bool get detailBookmarked => _detailBookmarked;

  void toggleDetailBookmark() {
    _detailBookmarked = !_detailBookmarked;
    notifyListeners();
  }
}

class AppStateScope extends InheritedNotifier<AppStateController> {
  const AppStateScope({
    super.key,
    required AppStateController controller,
    required super.child,
  }) : super(notifier: controller);

  static AppStateController of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<AppStateScope>();
    assert(scope != null, 'AppStateScope is missing from the widget tree.');
    return scope!.notifier!;
  }
}
