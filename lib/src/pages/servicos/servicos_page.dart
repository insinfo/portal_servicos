import 'dart:html';
import 'package:ngdart/angular.dart';
import 'package:ngrouter/ngrouter.dart';

import '../../shared/routes/route_paths.dart';

import '../../shared/models/servico_item.dart';

/// Diretiva para aplicar máscara SVG ignorando sanitização restrita do Angular.
@Directive(selector: '[iconMask]')
class IconMaskDirective {
  static const String _iconBasePath = 'assets/icones/lucide-icons-1.14.0';

  final HtmlElement element;
  IconMaskDirective(this.element);

  @Input('iconMask')
  set iconFile(String value) {
    if (value.isEmpty) {
      element.style.removeProperty('-webkit-mask-image');
      element.style.removeProperty('mask-image');
      return;
    }

    final url = "url('$_iconBasePath/$value')";
    element.style.setProperty('-webkit-mask-image', url);
    element.style.setProperty('mask-image', url);
  }
}

@Component(
  selector: 'servicos-page',
  templateUrl: 'servicos_page.html',
  styleUrls: ['servicos_page.css'],
  directives: [coreDirectives, IconMaskDirective],
  exports: [PortalRoutePaths],
)
class ServicosPageComponent {
  final Router _router;

  ServicosPageComponent(this._router);

  String filtro = '';

  final List<ServicoItem> servicos = catalogoServicos;
  List<ServicoItem> servicosFiltrados = catalogoServicos;

  int get totalServicosFiltrados => servicosFiltrados.length;
  int get paginaAtual => 1;
  int get totalPaginas => 1;

  void _aplicarFiltro() {
    if (filtro.trim().isEmpty) {
      servicosFiltrados = servicos;
      return;
    }

    final query = filtro.trim().toLowerCase();
    servicosFiltrados = servicos
        .where((s) =>
            s.titulo.toLowerCase().contains(query) ||
            s.categoria.toLowerCase().contains(query) ||
            s.descricao.toLowerCase().contains(query))
        .toList();
  }

  void solicitarServico(ServicoItem servico) {
    _router.navigate(
      PortalRoutePaths.novoPedido.toUrl(),
      NavigationParams(queryParameters: {'servico': servico.titulo}),
    );
  }

  void onFiltroInput(Event event) {
    final input = event.target as InputElement;
    filtro = input.value ?? '';
    _aplicarFiltro();
  }
}
