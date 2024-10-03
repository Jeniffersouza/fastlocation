library home_controller; 
import 'package:mobx/mobx.dart';
import 'package:fastlocation/src/modules/home/model/address_model.dart';
import 'package:fastlocation/src/modules/home/service/address_service.dart';

part 'home_controller.g.dart'; 

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  String cep = '';

  @observable
  bool isLoading = false;

  @observable
  String errorMessage = '';  // Mensagem de erro

  @observable
  ObservableList<AddressModel> addresses = ObservableList<AddressModel>(); // Endereços retornados pela pesquisa

  @observable
  ObservableList<AddressModel> addressHistory = ObservableList<AddressModel>(); // Histórico de endereços

  final AddressService _addressService = AddressService(); // Instância do AddressService

  // Atualiza o método para aceitar um parâmetro
  @action
  Future<void> fetchAddress(String cepInput) async {
    cep = cepInput;
    isLoading = true;
    errorMessage = '';  // Limpa a mensagem de erro antes de buscar
    addresses.clear();  // Limpa a lista de endereços antes de buscar o novo

    try {
      final address = await _addressService.fetchAddressByCep(cep);  // Chamada ao serviço

      if (address != null) {
        addresses.add(address);  // Adiciona o endereço se encontrado
        updateHistory(address); // Atualiza o histórico
      } else {
        errorMessage = 'Endereço não encontrado para o CEP: $cep';  // Define a mensagem de erro
        print('Endereço não encontrado para o CEP: $cep'); 
      }
    } catch (e) {
      errorMessage = 'Erro ao buscar endereço: $e'; // Atualiza a mensagem de erro
      print('Erro ao buscar endereço: $e');
    } finally {
      isLoading = false;
    }
  }

  // Método para atualizar o histórico
  @action
  void updateHistory(AddressModel address) {
    // Adiciona o novo endereço ao histórico, se não estiver já presente
    if (!addressHistory.any((element) => element.cep == address.cep)) {
      // Adiciona o endereço ao histórico
      addressHistory.insert(0, address);
      
      // Garante que o histórico tenha no máximo 3 endereços
      if (addressHistory.length > 3) {
        addressHistory.removeLast(); // Remove o mais antigo se houver mais de 3
      }
    }
  }
}
