import 'package:ngdart/angular.dart';
import 'package:ngforms/ngforms.dart';
import 'package:ngrouter/ngrouter.dart';

import '../../shared/routes/route_paths.dart';

@Component(
  selector: 'cadastro-page',
  templateUrl: 'cadastro_page.html',
  styleUrls: ['cadastro_page.css'],
  directives: [coreDirectives, formDirectives],
  exports: [PortalRoutePaths],
)
class CadastroPageComponent {
  final Router _router;

  CadastroPageComponent(this._router);

  String nomeCompleto = '';
  String cpf = '';
  String email = '';
  String telefone = '';
  String senha = '';
  String confirmarSenha = '';
  bool aceitaTermos = false;
  bool isLoading = false;

  void onCadastrar() {
    if (nomeCompleto.isEmpty || cpf.isEmpty || email.isEmpty || senha.isEmpty) {
      return;
    }
    isLoading = true;

    Future<void>.delayed(const Duration(milliseconds: 1000), () {
      isLoading = false;
      _router.navigate(PortalRoutePaths.home.toUrl());
    });
  }

  void goToLogin() {
    _router.navigate(PortalRoutePaths.login.toUrl());
  }
}
