import 'package:ngdart/angular.dart';
import 'package:ngforms/ngforms.dart';
import 'package:ngrouter/ngrouter.dart';

import '../../shared/routes/route_paths.dart';

@Component(
  selector: 'consulta-processos-page',
  templateUrl: 'consulta_processos_page.html',
  styleUrls: ['consulta_processos_page.css'],
  directives: [coreDirectives, formDirectives],
  exports: [PortalRoutePaths],
)
class ConsultaProcessosPageComponent implements OnActivate {
  final Router _router;

  ConsultaProcessosPageComponent(this._router);

  final List<String> exercicios = <String>[
    '2026',
    '2025',
    '2024',
    '2023',
    '2022',
  ];

  String processo = '';
  String exercicio = '2026';
  bool resultadoVisivel = false;

  String processoFormatado = '';
  String ultimoTramite = 'PTC - Procuradoria de Tutela Coletiva';
  String dataUltimoTramite = '30/01/2026 17:29';
  String situacao = 'Em andamento, recebido';

  @override
  void onActivate(RouterState? previous, RouterState current) {
    final numeroParam = current.queryParameters['processo'];
    final exercicioParam = current.queryParameters['exercicio'];
    final isResultado = current.routePath == PortalRoutePaths.visualizaProcesso;

    if (exercicioParam != null && exercicioParam.isNotEmpty) {
      exercicio = exercicioParam;
    }

    if (numeroParam != null && numeroParam.isNotEmpty) {
      processo = numeroParam;
      _mostrarResultado();
      return;
    }

    resultadoVisivel = isResultado && processo.trim().isNotEmpty;
  }

  void consultar() {
    if (processo.trim().isEmpty) return;

    _mostrarResultado();
    _router.navigate(
      PortalRoutePaths.visualizaProcesso.toUrl(),
      NavigationParams(
        queryParameters: <String, String>{
          'exercicio': exercicio,
          'processo': processo.trim(),
        },
      ),
    );
  }

  void novaConsulta() {
    processo = '';
    resultadoVisivel = false;
    _router.navigate(PortalRoutePaths.consultaProcessos.toUrl());
  }

  void _mostrarResultado() {
    processoFormatado = '${processo.trim()}/$exercicio';
    resultadoVisivel = true;
  }
}
