import 'package:ngdart/angular.dart';

@Component(
  selector: 'ajuda-page',
  templateUrl: 'ajuda_page.html',
  styleUrls: ['ajuda_page.css'],
  directives: [coreDirectives],
)
class AjudaPageComponent {
  final List<FaqItem> faqs = const <FaqItem>[
    FaqItem(
      pergunta: 'Como faço para solicitar um serviço?',
      resposta: 'Acesse a seção "Serviços" no menu lateral, escolha o serviço desejado, '
          'preencha o formulário com as informações solicitadas e envie sua solicitação. '
          'Você receberá um número de protocolo para acompanhamento.',
    ),
    FaqItem(
      pergunta: 'Como acompanho o status da minha solicitação?',
      resposta: 'Acesse a seção "Minhas Solicitações" no menu lateral. Lá você encontrará '
          'o status atualizado, o protocolo e o histórico de cada pedido aberto.',
    ),
    FaqItem(
      pergunta: 'Qual o prazo para atendimento?',
      resposta: 'O prazo varia de acordo com o tipo de serviço solicitado. Em geral, '
          'serviços de infraestrutura têm prazo de 5 a 10 dias úteis, enquanto serviços '
          'de limpeza urbana são atendidos em até 5 dias úteis.',
    ),
    FaqItem(
      pergunta: 'Posso cancelar uma solicitação?',
      resposta: 'Sim, você pode cancelar uma solicitação em análise. Acesse "Minhas Solicitações", clique no item e selecione a opção de cancelamento.',
    ),
    FaqItem(
      pergunta: 'Preciso de login do gov.br para usar o portal?',
      resposta: 'O login via gov.br é recomendado para garantir a segurança dos seus dados. '
          'Você também pode criar uma conta diretamente no portal.',
    ),
    FaqItem(
      pergunta: 'Como entro em contato com a Prefeitura?',
      resposta: 'Você pode utilizar a Ouvidoria disponível na seção de Serviços, '
          'ou ligar para o telefone 0800-123-4567 de segunda a sexta, das 8h às 17h.',
    ),
  ];

  String? expandedFaq;

  void toggleFaq(String pergunta) {
    if (expandedFaq == pergunta) {
      expandedFaq = null;
    } else {
      expandedFaq = pergunta;
    }
  }
}

class FaqItem {
  const FaqItem({required this.pergunta, required this.resposta});

  final String pergunta;
  final String resposta;
}
