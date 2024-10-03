import 'package:dio/dio.dart';
import 'package:fastlocation/src/modules/home/model/address_model.dart';

class AddressService {
  final Dio _dio = Dio();

  Future<AddressModel?> fetchAddressByCep(String cep) async {
    try {
      final response = await _dio.get('https://viacep.com.br/ws/$cep/json/');

      // Verifique se a resposta foi bem-sucedida e se o CEP existe
      if (response.statusCode == 200) {
        final data = response.data;
        if (data != null && data['erro'] == null) {
          // Retorna o modelo AddressModel com os dados da API
          return AddressModel(
            street: data['logradouro'] ?? '',
            city: data['localidade'] ?? '',
            cep: data['cep'] ?? '',
          );
        } else {
          return null;  // CEP não encontrado ou erro
        }
      } else {
        return null;  // Resposta inválida
      }
    } catch (e) {
      print('Erro ao buscar CEP: $e');
      return null;  // Erro na requisição
    }
  }
}
