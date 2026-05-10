import 'package:ngdart/angular.dart';
import 'package:ngrouter/ngrouter.dart';

import '../../shared/routes/route_paths.dart';

class PedidoItem {
  const PedidoItem({
    required this.protocolo,
    required this.servico,
    required this.data,
    required this.status,
    required this.statusClass,
    required this.iconClass,
  });

  final String protocolo;
  final String servico;
  final String data;
  final String status;
  final String statusClass;
  final String iconClass;
}

@Component(
  selector: 'meus-pedidos-page',
  templateUrl: 'meus_pedidos_page.html',
  styleUrls: ['meus_pedidos_page.css'],
  directives: [coreDirectives],
  exports: [PortalRoutePaths],
)
class MeusPedidosPageComponent {
  final Router _router;

  MeusPedidosPageComponent(this._router);

  final List<PedidoItem> pedidos = const <PedidoItem>[
    PedidoItem(
      protocolo: '2026.05.0001234',
      servico: 'Coleta de Galhada',
      data: '09/05/2026',
      status: 'Em análise',
      statusClass: 'bg-warning bg-opacity-10 text-warning',
      iconClass: 'ph ph-tree',
    ),
    PedidoItem(
      protocolo: '2026.04.0000987',
      servico: 'Tapa-Buraco',
      data: '28/04/2026',
      status: 'Em execução',
      statusClass: 'bg-info bg-opacity-10 text-info',
      iconClass: 'ph ph-road-horizon',
    ),
    PedidoItem(
      protocolo: '2026.04.0000852',
      servico: 'Iluminação Pública',
      data: '15/04/2026',
      status: 'Concluído',
      statusClass: 'bg-success bg-opacity-10 text-success',
      iconClass: 'ph ph-lightbulb',
    ),
    PedidoItem(
      protocolo: '2026.03.0000614',
      servico: 'Poda de Árvore',
      data: '22/03/2026',
      status: 'Concluído',
      statusClass: 'bg-success bg-opacity-10 text-success',
      iconClass: 'ph ph-plant',
    ),
    PedidoItem(
      protocolo: '2026.03.0000520',
      servico: 'Coleta de Inservíveis',
      data: '10/03/2026',
      status: 'Cancelado',
      statusClass: 'bg-secondary bg-opacity-10 text-secondary',
      iconClass: 'ph ph-trash',
    ),
  ];

  void verDetalhes(PedidoItem pedido) {
    _router.navigate(PortalRoutePaths.confirmacao.toUrl());
  }

  void novoPedido() {
    _router.navigate(PortalRoutePaths.novoPedido.toUrl());
  }
}
