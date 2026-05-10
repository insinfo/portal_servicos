import 'package:ngdart/angular.dart';
import 'package:ngforms/ngforms.dart';
import 'package:ngrouter/ngrouter.dart';

import '../../shared/routes/route_paths.dart';

@Component(
  selector: 'novo-pedido-page',
  templateUrl: 'novo_pedido_page.html',
  styleUrls: ['novo_pedido_page.css'],
  directives: [coreDirectives, formDirectives],
  exports: [PortalRoutePaths],
)
class NovoPedidoPageComponent {
  final Router _router;

  NovoPedidoPageComponent(this._router);

  int currentStep = 0;

  // Step 1 – Serviço
  String servicoSelecionado = 'Coleta de Galhada';

  // Step 2 – Endereço
  String cep = '';
  String logradouro = '';
  String numero = '';
  String complemento = '';
  String bairro = '';
  String referencia = '';

  // Step 3 – Detalhes
  String descricaoProblema = '';
  String urgencia = 'normal';

  bool get canAdvance {
    switch (currentStep) {
      case 0:
        return servicoSelecionado.isNotEmpty;
      case 1:
        return logradouro.isNotEmpty && numero.isNotEmpty && bairro.isNotEmpty;
      case 2:
        return descricaoProblema.trim().isNotEmpty;
      default:
        return false;
    }
  }

  void nextStep() {
    if (currentStep < 2 && canAdvance) {
      currentStep++;
    }
  }

  void prevStep() {
    if (currentStep > 0) {
      currentStep--;
    }
  }

  void enviarPedido() {
    _router.navigate(PortalRoutePaths.confirmacao.toUrl());
  }

  void cancelar() {
    _router.navigate(PortalRoutePaths.servicos.toUrl());
  }
}
