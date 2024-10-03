import 'package:mobx/mobx.dart';
import 'package:fastlocation/src/modules/home/model/address_model.dart';
import 'package:fastlocation/src/modules/home/service/address_service.dart';  // Atualização para usar o AddressService

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

  final AddressService _addressService = AddressService();  // Instância do AddressService


  // Atualize o método para aceitar um parâmetro
  @action
   Future<void> fetchAddress(String cepInput) async {
    cep = cepInput;
    isLoading = true;

    try {
      final address = await _addressService.fetchAddressByCep(cep);  // Chamada ao serviço

      if (address != null) {
        addresses.add(address);  // Adiciona o endereço se encontrado
      } else {
        // Lógica de erro, se necessário (CEP inválido ou não encontrado)
        print('Endereço não encontrado para o CEP: $cep');
      }
    } catch (e) {
      print('Erro ao buscar endereço: $e');
    } finally {
      isLoading = false;
    }
  }
}
