import 'package:ngdart/angular.dart';
import 'package:ngforms/ngforms.dart';

@Component(
  selector: 'perfil-page',
  templateUrl: 'perfil_page.html',
  styleUrls: ['perfil_page.css'],
  directives: [coreDirectives, formDirectives],
)
class PerfilPageComponent {
  String nome = 'Maria Sant\'Ana';
  String cpf = '111.111.111-11';
  String email = 'maria.santana@email.com';
  String telefone = '(22) 99888-7766';
  String dataNascimento = '15/03/1985';
  String endereco = 'Rua das Flores, 123 – Centro – Rio das Ostras/RJ';

  bool isEditing = false;
  bool isSaving = false;

  void toggleEdit() {
    isEditing = !isEditing;
  }

  void salvar() {
    isSaving = true;
    Future<void>.delayed(const Duration(milliseconds: 800), () {
      isSaving = false;
      isEditing = false;
    });
  }
}
