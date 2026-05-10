import 'dart:html';
import 'package:ngdart/angular.dart';
import 'package:ngrouter/ngrouter.dart';

import '../../shared/routes/route_paths.dart';

/// Catálogo de serviços disponíveis ao cidadão.
class ServicoItem {
  const ServicoItem({
    required this.id,
    required this.titulo,
    required this.descricao,
    required this.iconClass,
    required this.categoria,
  });

  final String id;
  final String titulo;
  final String descricao;
  final String iconClass;
  final String categoria;
}

@Component(
  selector: 'servicos-page',
  templateUrl: 'servicos_page.html',
  styleUrls: ['servicos_page.css'],
  directives: [coreDirectives],
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
      descricao: 'Solicite a coleta de galhos e resíduos vegetais.',
      iconClass: 'ph ph-tree',
      categoria: 'Limpeza Urbana',
    ),
    ServicoItem(
      id: 'tapa-buraco',
      titulo: 'Tapa-Buraco',
      descricao: 'Reporte buracos em vias públicas para reparo.',
      iconClass: 'ph ph-road-horizon',
      categoria: 'Infraestrutura',
    ),
    ServicoItem(
      id: 'iluminacao',
      titulo: 'Iluminação Pública',
      descricao: 'Solicite reparo ou instalação de iluminação.',
      iconClass: 'ph ph-lightbulb',
      categoria: 'Infraestrutura',
    ),
    ServicoItem(
      id: 'coleta-inserviveis',
      titulo: 'Coleta de Inservíveis',
      descricao: 'Agende a retirada de móveis e objetos grandes.',
      iconClass: 'ph ph-trash',
      categoria: 'Limpeza Urbana',
    ),
    ServicoItem(
      id: 'poda-arvore',
      titulo: 'Poda de Árvore',
      descricao: 'Solicite a poda de árvores em área pública.',
      iconClass: 'ph ph-plant',
      categoria: 'Meio Ambiente',
    ),
    ServicoItem(
      id: 'limpeza-terreno',
      titulo: 'Limpeza de Terreno',
      descricao: 'Solicite a limpeza de terreno baldio.',
      iconClass: 'ph ph-broom',
      categoria: 'Limpeza Urbana',
    ),
    ServicoItem(
      id: 'drenagem',
      titulo: 'Drenagem / Bueiros',
      descricao: 'Reporte problemas em bueiros ou rede de drenagem.',
      iconClass: 'ph ph-drop',
      categoria: 'Infraestrutura',
    ),
    ServicoItem(
      id: 'sinalizacao',
      titulo: 'Sinalização Viária',
      descricao: 'Solicite instalação ou reparo de placas e semáforos.',
      iconClass: 'ph ph-traffic-sign',
      categoria: 'Trânsito',
    ),
    ServicoItem(
      id: 'calcada',
      titulo: 'Reparo de Calçada',
      descricao: 'Solicite conserto de calçadas danificadas.',
      iconClass: 'ph ph-footprints',
      categoria: 'Infraestrutura',
    ),
    ServicoItem(
      id: 'agua-esgoto',
      titulo: 'Água e Esgoto',
      descricao: 'Reporte vazamentos ou problemas na rede.',
      iconClass: 'ph ph-waves',
      categoria: 'Saneamento',
    ),
    ServicoItem(
      id: 'ouvidoria',
      titulo: 'Ouvidoria',
      descricao: 'Envie sugestões, reclamações ou elogios.',
      iconClass: 'ph ph-megaphone-simple',
      categoria: 'Atendimento',
    ),
    ServicoItem(
      id: 'alvara',
      titulo: 'Alvará e Licenças',
      descricao: 'Solicite alvarás e licenças de funcionamento.',
      iconClass: 'ph ph-file-text',
      categoria: 'Documentação',
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
