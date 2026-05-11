import 'package:ngrouter/ngrouter.dart';

class PortalRoutePaths {
  /// ---------------- páginas públicas ----------------
  static final bemVindo = RoutePath(path: 'bem-vindo');
  static final bemVindoAlt = RoutePath(path: 'bem-vindo-alt');
  static final login = RoutePath(path: 'login');
  static final loginGovBr = RoutePath(path: 'login-govbr');
  static final cadastro = RoutePath(path: 'cadastro');

  /// ---------------- shell restrito ----------------
  static final restrito = RoutePath(path: 'restrito');

  /// ---------------- páginas privadas (filhas de restrito) ----------------
  static final home = RoutePath(path: 'home', parent: restrito);
  static final servicos = RoutePath(path: 'servicos', parent: restrito);
  static final novoPedido = RoutePath(path: 'novo-pedido', parent: restrito);
  static final confirmacao = RoutePath(path: 'confirmacao', parent: restrito);
  static final meusPedidos = RoutePath(path: 'meus-pedidos', parent: restrito);
  static final perfil = RoutePath(path: 'perfil', parent: restrito);
  static final ajuda = RoutePath(path: 'ajuda', parent: restrito);
  static final notificacoes = RoutePath(path: 'notificacoes', parent: restrito);
}
