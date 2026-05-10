import 'package:ngdart/angular.dart';
import 'package:ngrouter/ngrouter.dart';
import 'package:ngforms/ngforms.dart';
import '../../shared/routes/route_paths.dart';
import 'dart:html';

@Component(
  selector: 'login-page',
  templateUrl: 'login_page.html',
  styleUrls: ['login_page.css'],
  directives: [coreDirectives, formDirectives],
)
class LoginPageComponent {
  final Router _router;

  LoginPageComponent(this._router);

  void onLoginInterno() {
    _router.navigate(PortalRoutePaths.restrito.toUrl());
  }

  void onLoginGovBr() {
    window.location.href = '/logingov.html';
  }
}
