import 'package:ngdart/angular.dart';
import 'package:ngrouter/ngrouter.dart';

import '../../shared/routes/route_paths.dart';

@Component(
  selector: 'notificacoes-page',
  templateUrl: 'notificacoes_page.html',
  directives: [coreDirectives, RouterLink],
  exports: [PortalRoutePaths],
)
class NotificacoesPageComponent {
  NotificacoesPageComponent();
}
