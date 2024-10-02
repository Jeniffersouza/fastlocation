import 'package:mobx/mobx.dart';
import 'package:fastlocation/src/modules/home/model/address_model.dart';

// Parte gerada automaticamente para MobX
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  String cep = '';

  @observable
  bool isLoading = false;

  @observable
  ObservableList<AddressModel> addresses = ObservableList<AddressModel>();

  // Atualize o método para aceitar um parâmetro
  @action
  Future<void> fetchAddress(String cepInput) async {
    cep = cepInput;  // Atribui o valor do CEP passado pelo TextField
    isLoading = true;
    try {
      await Future.delayed(Duration(seconds: 2));

      // Exemplo de um novo endereço
      AddressModel newAddress = AddressModel(
        street: 'Rua Exemplo',
        city: 'Cidade Exemplo',
        cep: cep,
      );

      addresses.add(newAddress);
    } catch (error) {
      // Tratar erros
    } finally {
      isLoading = false;
    }
  }
}
