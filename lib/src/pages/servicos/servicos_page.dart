import 'dart:html';
import 'package:ngdart/angular.dart';
import 'package:ngrouter/ngrouter.dart';

import '../../shared/routes/route_paths.dart';

/// Diretiva para aplicar máscara SVG ignorando sanitização restrita do Angular.
@Directive(selector: '[iconMask]')
class IconMaskDirective {
  final HtmlElement element;
  IconMaskDirective(this.element);

  @Input('iconMask')
  set iconFile(String value) {
    if (value.isNotEmpty) {
      final url = "url('/assets/icones/lucide-icons-1.14.0/$value')";
      element.style.setProperty('-webkit-mask-image', url);
      element.style.setProperty('mask-image', url);
    }
  }
}

/// Catálogo de serviços disponíveis ao cidadão.
class ServicoItem {
  const ServicoItem({
    required this.id,
    required this.titulo,
    required this.descricao,
    required this.iconFile,
    required this.iconColorClass,
    required this.badgeColorClass,
    required this.badgeBgClass,
    required this.categoria,
  });

  final String id;
  final String titulo;
  final String descricao;
  final String iconFile;
  final String iconColorClass;
  final String badgeColorClass;
  final String badgeBgClass;
  final String categoria;
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

  final List<ServicoItem> servicos = const <ServicoItem>[
    ServicoItem(
      id: 'coleta-galhada',
      titulo: 'Coleta de Galhada',
      descricao: 'Solicite a coleta de galhos e resíduos de poda de árvores.',
      iconFile: 'tree-deciduous.svg',
      iconColorClass: 'text-teal',
      badgeColorClass: 'text-success',
      badgeBgClass: 'bg-success',
      categoria: 'Limpeza Urbana',
    ),
    ServicoItem(
      id: 'coleta-inserviveis',
      titulo: 'Coleta de Inservíveis',
      descricao: 'Solicite a coleta de móveis e objetos inservíveis.',
      iconFile: 'armchair.svg',
      iconColorClass: 'text-indigo',
      badgeColorClass: 'text-primary',
      badgeBgClass: 'bg-primary',
      categoria: 'Limpeza Urbana',
    ),
    ServicoItem(
      id: 'iluminacao',
      titulo: 'Iluminação Pública',
      descricao: 'Solicite reparo em iluminação pública com defeito.',
      iconFile: 'lightbulb.svg',
      iconColorClass: 'text-warning',
      badgeColorClass: 'text-warning',
      badgeBgClass: 'bg-warning',
      categoria: 'Infraestrutura',
    ),
    ServicoItem(
      id: 'tapa-buraco',
      titulo: 'Tapa Buraco',
      descricao: 'Solicite o reparo de buracos em vias públicas.',
      iconFile: 'construction.svg',
      iconColorClass: 'text-indigo',
      badgeColorClass: 'text-purple',
      badgeBgClass: 'bg-purple',
      categoria: 'Infraestrutura',
    ),
    ServicoItem(
      id: 'limpeza-boca-lobo',
      titulo: 'Limpeza de Boca de Lobo',
      descricao: 'Solicite a limpeza de bueiros e bocas de lobo.',
      iconFile: 'waves-arrow-down.svg',
      iconColorClass: 'text-indigo',
      badgeColorClass: 'text-info',
      badgeBgClass: 'bg-info',
      categoria: 'Drenagem',
    ),
    ServicoItem(
      id: 'outros',
      titulo: 'Outros Serviços',
      descricao: 'Consulte outros serviços disponíveis para solicitação.',
      iconFile: 'message-circle-more.svg',
      iconColorClass: 'text-purple',
      badgeColorClass: 'text-danger',
      badgeBgClass: 'bg-danger',
      categoria: 'Outros',
    ),
  ];

  List<ServicoItem> get servicosFiltrados {
    if (filtro.trim().isEmpty) return servicos;
    final query = filtro.trim().toLowerCase();
    return servicos
        .where((s) =>
            s.titulo.toLowerCase().contains(query) ||
            s.categoria.toLowerCase().contains(query) ||
            s.descricao.toLowerCase().contains(query))
        .toList();
  }

  void solicitarServico(ServicoItem servico) {
    _router.navigate(PortalRoutePaths.novoPedido.toUrl());
  }

  void onFiltroInput(Event event) {
    final input = event.target as InputElement;
    filtro = input.value ?? '';
  }
}
