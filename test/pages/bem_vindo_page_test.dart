// ignore_for_file: library_annotations

@TestOn('browser')


import 'package:test/test.dart';
import 'package:ngtest/ngtest.dart';
import 'package:portal_sali/src/pages/bem_vindo/bem_vindo_page.dart';

import 'package:portal_sali/src/pages/bem_vindo/bem_vindo_page.template.dart' as ng;

void main() {
  tearDown(disposeAnyRunningTest);

  // A API do ngtest^5.0.0-dev.3 usa NgTestBed diretamente
  final testBed = NgTestBed<BemVindoPageComponent>(
    ng.BemVindoPageComponentNgFactory,
  );

  test('renderiza a pagina inicial e exibe o titulo de bem-vindo', () async {
    final fixture = await testBed.create();
    
    // Verifica se os textos cruciais da tela de Bem-vindo foram renderizados.
    expect(fixture.text, contains('Bem-vindo(a) ao'));
    expect(fixture.text, contains('Portal de Serviços'));
  });

  test('renderiza botao do gov.br', () async {
    final fixture = await testBed.create();
    
    // Verifica se o botão do Gov.br está na tela
    final button = fixture.rootElement.querySelector('.btn-light');
    expect(button, isNotNull);
    expect(button!.text, contains('ENTRAR COM GOV.BR'));
  });
}
