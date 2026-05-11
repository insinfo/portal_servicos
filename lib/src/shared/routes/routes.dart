// ignore_for_file: uri_has_not_been_generated

import 'package:ngrouter/ngrouter.dart';

import 'package:portal_sali/src/pages/bem_vindo/bem_vindo_page.template.dart'
    as bem_vindo_page;
import 'package:portal_sali/src/pages/bem_vindo_alt/bem_vindo_alt_page.template.dart'
    as bem_vindo_alt_page;
import 'package:portal_sali/src/pages/login/login_page.template.dart'
    as login_page;
import 'package:portal_sali/src/pages/cadastro/cadastro_page.template.dart'
    as cadastro_page;
import 'package:portal_sali/src/pages/login_govbr/login_govbr_page.template.dart'
    as login_govbr_page;

// Shell privado (contém sidebar + navbar + router-outlet interno)
import 'package:portal_sali/src/pages/main_page/main_page.template.dart'
    as main_page;

// Páginas privadas (renderizadas dentro do main_page)
import 'package:portal_sali/src/pages/servicos/servicos_page.template.dart'
    as servicos_page;
import 'package:portal_sali/src/pages/novo_pedido/novo_pedido_page.template.dart'
    as novo_pedido_page;
import 'package:portal_sali/src/pages/confirmacao/confirmacao_page.template.dart'
    as confirmacao_page;
import 'package:portal_sali/src/pages/meus_pedidos/meus_pedidos_page.template.dart'
    as meus_pedidos_page;
import 'package:portal_sali/src/pages/perfil/perfil_page.template.dart'
    as perfil_page;
import 'package:portal_sali/src/pages/ajuda/ajuda_page.template.dart'
    as ajuda_page;
import 'package:portal_sali/src/pages/home/home_page.template.dart'
    as home_page;
import 'package:portal_sali/src/pages/notificacoes/notificacoes_page.template.dart'
    as notificacoes_page;

import 'route_paths.dart';

class PortalRoutes {
  // ==================== ROTAS PÚBLICAS ====================
  // Renderizadas diretamente pelo app_component (sem sidebar/navbar)

  static final bemVindo = RouteDefinition(
    routePath: PortalRoutePaths.bemVindo,
    component: bem_vindo_page.BemVindoPageComponentNgFactory,
    useAsDefault: true,
  );

  static final bemVindoAlt = RouteDefinition(
    routePath: PortalRoutePaths.bemVindoAlt,
    component: bem_vindo_alt_page.BemVindoAltPageComponentNgFactory,
  );

  static final login = RouteDefinition(
    routePath: PortalRoutePaths.login,
    component: login_page.LoginPageComponentNgFactory,
  );

  static final cadastro = RouteDefinition(
    routePath: PortalRoutePaths.cadastro,
    component: cadastro_page.CadastroPageComponentNgFactory,
  );
  
  static final loginGovBr = RouteDefinition(
    routePath: PortalRoutePaths.loginGovBr,
    component: login_govbr_page.LoginGovbrPageComponentNgFactory,
  );

  static final restrito = RouteDefinition(
    routePath: PortalRoutePaths.restrito,
    component: main_page.MainPageComponentNgFactory,
  );

  // ==================== ROTAS PRIVADAS ====================
  // Renderizadas pelo router-outlet DENTRO do MainPageComponent

  static final home = RouteDefinition(
    routePath: PortalRoutePaths.home,
    component: home_page.HomePageComponentNgFactory,
    useAsDefault: true,
  );

  static final servicos = RouteDefinition(
    routePath: PortalRoutePaths.servicos,
    component: servicos_page.ServicosPageComponentNgFactory,
  );

  static final novoPedido = RouteDefinition(
    routePath: PortalRoutePaths.novoPedido,
    component: novo_pedido_page.NovoPedidoPageComponentNgFactory,
  );

  static final confirmacao = RouteDefinition(
    routePath: PortalRoutePaths.confirmacao,
    component: confirmacao_page.ConfirmacaoPageComponentNgFactory,
  );

  static final meusPedidos = RouteDefinition(
    routePath: PortalRoutePaths.meusPedidos,
    component: meus_pedidos_page.MeusPedidosPageComponentNgFactory,
  );

  static final perfil = RouteDefinition(
    routePath: PortalRoutePaths.perfil,
    component: perfil_page.PerfilPageComponentNgFactory,
  );

  static final ajuda = RouteDefinition(
    routePath: PortalRoutePaths.ajuda,
    component: ajuda_page.AjudaPageComponentNgFactory,
  );

  static final notificacoes = RouteDefinition(
    routePath: PortalRoutePaths.notificacoes,
    component: notificacoes_page.NotificacoesPageComponentNgFactory,
  );

  static final allPublic = <RouteDefinition>[
    bemVindo,
    bemVindoAlt,
    login,
    loginGovBr,
    cadastro,
    restrito,
  ];

  /// Rotas privadas — usadas pelo main_page (nível 2, dentro de "restrito")
  static final allPrivate = <RouteDefinition>[
    home,
    servicos,
    novoPedido,
    confirmacao,
    meusPedidos,
    perfil,
    ajuda,
    notificacoes,
  ];
}
