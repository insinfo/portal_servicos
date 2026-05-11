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

final List<ServicoItem> catalogoServicos = const <ServicoItem>[
  ServicoItem(
    id: 'coleta-galhada',
    titulo: 'Coleta de Galhada',
    descricao: 'Solicite a coleta de galhos e resíduos de poda de árvores.',
    iconFile: 'tree-deciduous.svg',
    iconColorClass: 'text-success',
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
    iconColorClass: 'text-info',
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
