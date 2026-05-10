import 'dart:html';
import 'package:ngdart/angular.dart';
import 'package:ngrouter/ngrouter.dart';

import '../../shared/routes/route_paths.dart';
import '../../shared/routes/routes.dart';
import 'navbar_actions_component.dart';
import 'package:limitless_ui/limitless_ui.dart';

/// Shell privado — contém navbar + sidebar + router-outlet para rotas privadas.
/// Este componente é ativado pela rota "restrito" no nível 1 (app_component).
@Component(
  selector: 'main-page',
  templateUrl: 'main_page.html',
  styleUrls: ['main_page.css'],
  directives: [
    coreDirectives,
    RouterLink,
    RouterLinkActive,
    RouterOutlet,
    NavbarActionsComponent,
    liPageHeaderDirectives,
    LiDropdownDirective,
    LiDropdownMenuDirective,
    LiDropdownToggleDirective,
    LiDropdownItemDirective,
  ],
  exports: [PortalRoutePaths, PortalRoutes],
)
class MainPageComponent implements CanReuse {
  final Router _router;

  MainPageComponent(this._router);

  bool isMobileSidebarOpen = false;
  String userName = 'Isaque Sant\'Ana';

  /// Página ativa para highlight do sidebar.
  String currentPage = 'home';

  final List<SidebarNavItem> navItems = <SidebarNavItem>[
    SidebarNavItem(
      id: 'home',
      label: 'Início',
      iconClass: 'ph-house',
      routePath: PortalRoutePaths.home.toUrl(),
    ),
    SidebarNavItem(
      id: 'meus-pedidos',
      label: 'Minhas solicitações',
      iconClass: 'ph-clipboard-text',
      routePath: PortalRoutePaths.meusPedidos.toUrl(),
    ),
    SidebarNavItem(
      id: 'novo-pedido',
      label: 'Nova solicitação',
      iconClass: 'ph-plus-circle',
      routePath: PortalRoutePaths.novoPedido.toUrl(),
    ),
    SidebarNavItem(
      id: 'servicos',
      label: 'Serviços',
      iconClass: 'ph-squares-four',
      routePath: PortalRoutePaths.servicos.toUrl(),
    ),
    SidebarNavItem(
      id: 'perfil',
      label: 'Perfil',
      iconClass: 'ph-user-circle',
      routePath: PortalRoutePaths.perfil.toUrl(),
    ),
    SidebarNavItem(
      id: 'ajuda',
      label: 'Ajuda e suporte',
      iconClass: 'ph-question',
      routePath: PortalRoutePaths.ajuda.toUrl(),
    ),
  ];

  String get userInitials {
    final parts = userName.split(' ');
    if (parts.length >= 2) {
      return '${parts.first[0]}${parts.last[0]}'.toUpperCase();
    }
    return userName.isNotEmpty ? userName[0].toUpperCase() : 'U';
  }

  String get currentPageLabel {
    for (final item in navItems) {
      if (item.id == currentPage) return item.label;
    }
    return 'Início';
  }

  bool get isNavigationMenuActive => currentPage != 'home';

  List<SidebarNavItem> get layout6MenuItems =>
      navItems.where((item) => item.id != 'home').toList(growable: false);

  void toggleMobileSidebar() {
    isMobileSidebarOpen = !isMobileSidebarOpen;
  }

  void closeMobileSidebar() {
    isMobileSidebarOpen = false;
  }

  void setCurrentPage(String page) {
    currentPage = page;
    closeMobileSidebar();
  }

  void onLogout() {
    _router.navigate(PortalRoutePaths.bemVindo.toUrl());
  }

  bool isDarkTheme = false;
  bool isLayout6 = false;

  void setTheme(bool dark) {
    isDarkTheme = dark;
    document.documentElement
        ?.setAttribute('data-color-theme', isDarkTheme ? 'dark' : 'light');
  }

  void setLayout(int layoutId) {
    isLayout6 = (layoutId == 6);
  }

  void goToNotifications() {
    _router.navigate(PortalRoutePaths.notificacoes.toUrl());
  }

  @override
  Future<bool> canReuse(RouterState current, RouterState next) async {
    return true;
  }
}

class SidebarNavItem {
  const SidebarNavItem({
    required this.id,
    required this.label,
    required this.iconClass,
    required this.routePath,
  });

  final String id;
  final String label;
  final String iconClass;
  final String routePath;
}
