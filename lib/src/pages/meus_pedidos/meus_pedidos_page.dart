import 'dart:html';

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

  static const List<PedidoItem> _pedidosBase = <PedidoItem>[
    PedidoItem(
      protocolo: '2026.05.0001234',
      servico: 'Coleta de Galhada',
      data: '09/05/2026',
      status: 'Em análise',
      statusClass: 'badge bg-warning bg-opacity-10 text-warning fs-sm',
      iconClass: 'ph ph-tree',
    ),
    PedidoItem(
      protocolo: '2026.04.0000987',
      servico: 'Tapa-Buraco',
      data: '28/04/2026',
      status: 'Em execução',
      statusClass: 'badge bg-info bg-opacity-10 text-info fs-sm',
      iconClass: 'ph ph-road-horizon',
    ),
    PedidoItem(
      protocolo: '2026.04.0000852',
      servico: 'Iluminação Pública',
      data: '15/04/2026',
      status: 'Concluído',
      statusClass: 'badge bg-success bg-opacity-10 text-success fs-sm',
      iconClass: 'ph ph-lightbulb',
    ),
    PedidoItem(
      protocolo: '2026.03.0000614',
      servico: 'Poda de Árvore',
      data: '22/03/2026',
      status: 'Concluído',
      statusClass: 'badge bg-success bg-opacity-10 text-success fs-sm',
      iconClass: 'ph ph-plant',
    ),
    PedidoItem(
      protocolo: '2026.03.0000520',
      servico: 'Coleta de Inservíveis',
      data: '10/03/2026',
      status: 'Cancelado',
      statusClass: 'badge bg-secondary bg-opacity-10 text-secondary fs-sm',
      iconClass: 'ph ph-trash',
    ),
  ];

  final List<PedidoItem> pedidos = _pedidosBase;

  String filtro = '';
  String statusFiltro = '';
  List<PedidoItem> pedidosFiltrados = _pedidosBase;

  int get totalPedidos => pedidosFiltrados.length;
  int get paginaAtual => 1;
  int get totalPaginas => 1;

  void _aplicarFiltros() {
    final query = filtro.trim().toLowerCase();
    pedidosFiltrados = pedidos.where((pedido) {
      final combinaTexto = query.isEmpty ||
          pedido.servico.toLowerCase().contains(query) ||
          pedido.protocolo.toLowerCase().contains(query) ||
          pedido.data.toLowerCase().contains(query);
      final combinaStatus =
          statusFiltro.isEmpty || pedido.status == statusFiltro;
      return combinaTexto && combinaStatus;
    }).toList();
  }

  void onFiltroInput(Event event) {
    final input = event.target as InputElement;
    filtro = input.value ?? '';
    _aplicarFiltros();
  }

  void onStatusFiltroChange(Event event) {
    final select = event.target as SelectElement;
    statusFiltro = select.value ?? '';
    _aplicarFiltros();
  }

  void verDetalhes(PedidoItem pedido) {
    _router.navigate(PortalRoutePaths.confirmacao.toUrl());
  }

  void novoPedido() {
    _router.navigate(PortalRoutePaths.novoPedido.toUrl());
  }
}
