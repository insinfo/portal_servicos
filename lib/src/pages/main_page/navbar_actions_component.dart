import 'dart:async';

import 'package:limitless_ui/limitless_ui.dart';
import 'package:ngdart/angular.dart';

@Component(
  selector: 'portal-navbar-actions',
  templateUrl: 'navbar_actions_component.html',
  styleUrls: ['navbar_actions_component.css'],
  directives: [
    coreDirectives,
    LiDropdownDirective,
    LiDropdownMenuDirective,
    LiDropdownToggleDirective,
    LiDropdownItemDirective,
    LiDropdownSubmenuDirective,
    LiDropdownSubmenuToggleDirective,
    LiDropdownSubmenuMenuDirective,
  ],
)
class NavbarActionsComponent implements OnDestroy {
  final _layoutChangeController = StreamController<int>.broadcast();
  final _themeChangeController = StreamController<bool>.broadcast();
  final _logoutController = StreamController<void>.broadcast();
  final _notificationsController = StreamController<void>.broadcast();

  @Input()
  bool isLayout6 = false;

  @Input()
  bool isDarkTheme = false;

  @Input()
  String userName = 'Isaque Neves Sant\'Ana';

  @Output()
  Stream<int> get layoutChange => _layoutChangeController.stream;

  @Output()
  Stream<bool> get themeChange => _themeChangeController.stream;

  @Output()
  Stream<void> get logout => _logoutController.stream;

  @Output()
  Stream<void> get notificationsOpen => _notificationsController.stream;

  void setLayout(int layoutId) {
    _layoutChangeController.add(layoutId);
  }

  void setTheme(bool dark) {
    _themeChangeController.add(dark);
  }

  void openNotifications() {
    _notificationsController.add(null);
  }

  void onLogout() {
    _logoutController.add(null);
  }

  @override
  void ngOnDestroy() {
    _layoutChangeController.close();
    _themeChangeController.close();
    _logoutController.close();
    _notificationsController.close();
  }
}
