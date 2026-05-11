import 'package:ngdart/angular.dart';
import 'package:ngrouter/ngrouter.dart';

import '../../shared/routes/route_paths.dart';

@Component(
  selector: 'bem-vindo-alt-page',
  templateUrl: 'bem_vindo_alt_page.html',
  styleUrls: ['bem_vindo_alt_page.css'],
  directives: [coreDirectives, RouterLink],
  exports: [PortalRoutePaths],
)
class BemVindoAltPageComponent {
  final Router _router;

  BemVindoAltPageComponent(this._router);

  void goToLogin() {
    _router.navigate(PortalRoutePaths.login.toUrl());
  }
}
