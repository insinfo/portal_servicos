import 'package:ngdart/angular.dart';
import 'package:ngrouter/ngrouter.dart';

import '../../shared/routes/route_paths.dart';

@Component(
  selector: 'home-page',
  templateUrl: 'home_page.html',
  styleUrls: ['home_page.css'],
  directives: [coreDirectives, RouterLink],
  exports: [PortalRoutePaths],
)
class HomePageComponent {
  final Router _router;

  HomePageComponent(this._router);

  void irParaNovoPedido() {
    _router.navigate(PortalRoutePaths.novoPedido.toUrl());
  }

  void irParaMeusPedidos() {
    _router.navigate(PortalRoutePaths.meusPedidos.toUrl());
  }

  void irParaServicos() {
    _router.navigate(PortalRoutePaths.servicos.toUrl());
  }
}
