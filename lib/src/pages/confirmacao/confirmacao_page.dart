import 'package:ngdart/angular.dart';
import 'package:ngrouter/ngrouter.dart';

import '../../shared/routes/route_paths.dart';

@Component(
  selector: 'confirmacao-page',
  templateUrl: 'confirmacao_page.html',
  styleUrls: ['confirmacao_page.css'],
  directives: [coreDirectives],
  exports: [PortalRoutePaths],
)
class ConfirmacaoPageComponent {
  final Router _router;

  ConfirmacaoPageComponent(this._router);

  final String protocolo = '2026.05.0001234';
  final String servico = 'Coleta de Galhada';
  final String prazoEstimado = '5 dias úteis';

  void verMeusPedidos() {
    _router.navigate(PortalRoutePaths.meusPedidos.toUrl());
  }

  void novoPedido() {
    _router.navigate(PortalRoutePaths.novoPedido.toUrl());
  }

  void voltarInicio() {
    _router.navigate(PortalRoutePaths.home.toUrl());
  }
}
