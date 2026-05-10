import 'package:ngdart/angular.dart';
import 'package:ngrouter/ngrouter.dart';
import '../../shared/routes/route_paths.dart';

@Component(
  selector: 'login-govbr-page',
  templateUrl: 'login_govbr_page.html',
  styleUrls: ['login_govbr_page.css'],
  directives: [coreDirectives],
)
class LoginGovbrPageComponent {
  final Router _router;

  LoginGovbrPageComponent(this._router);

  void onContinue() {
    _router.navigate(PortalRoutePaths.restrito.toUrl());
  }

  void onBack() {
    _router.navigate(PortalRoutePaths.login.toUrl());
  }
}
