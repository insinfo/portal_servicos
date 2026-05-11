import 'package:ngdart/angular.dart';
import 'package:ngforms/ngforms.dart';
import 'package:ngrouter/ngrouter.dart';

import '../../shared/routes/route_paths.dart';

import '../../shared/models/servico_item.dart';
import '../servicos/servicos_page.dart' show IconMaskDirective;

@Component(
  selector: 'novo-pedido-page',
  templateUrl: 'novo_pedido_page.html',
  styleUrls: ['novo_pedido_page.css'],
  directives: [coreDirectives, formDirectives, IconMaskDirective],
  exports: [PortalRoutePaths],
)
class NovoPedidoPageComponent implements OnActivate {
  final Router _router;

  NovoPedidoPageComponent(this._router);

  ServicoItem? servicoSelecionado;

  ServicoItem get servico => servicoSelecionado!;

  // Formulário
  String endereco = '';
  String referencia = '';
  String descricaoProblema = '';

  @override
  void onActivate(RouterState? previous, RouterState current) {
    final tituloParam = current.queryParameters['servico'];
    if (tituloParam != null && tituloParam.isNotEmpty) {
      try {
        servicoSelecionado = catalogoServicos.firstWhere(
            (s) => s.titulo == tituloParam);
      } catch (e) {
        // Se não encontrar, pode voltar para lista ou usar um default
      }
    }
  }

  bool get canAdvance {
    return endereco.trim().isNotEmpty && descricaoProblema.trim().isNotEmpty;
  }

  void enviarPedido() {
    _router.navigate(PortalRoutePaths.confirmacao.toUrl());
  }

  void cancelar() {
    _router.navigate(PortalRoutePaths.servicos.toUrl());
  }
}

