import 'package:ngdart/angular.dart';
import 'package:ngrouter/ngrouter.dart';

import '../shared/routes/route_paths.dart';
import '../shared/routes/routes.dart';

/// Root component — only renders public routes.
/// The private shell (navbar + sidebar) lives inside MainPageComponent,
/// which is activated by the "restrito" route.
@Component(
  selector: 'my-app',
  templateUrl: 'app_component.html',
  styleUrls: ['app_component.css'],
  directives: [
    coreDirectives,
    RouterOutlet,
  ],
  exports: [PortalRoutePaths, PortalRoutes],
)
class AppComponent {}
