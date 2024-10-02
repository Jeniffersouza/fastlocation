import 'package:fastlocation/src/modules/home/model/address_model.dart';
import 'package:fastlocation/src/http/dio_client.dart';

class AddressRepository {
  final DioClient dioClient = DioClient();

  Future<AddressModel> getAddressByCep(String cep) async {
    final response = await dioClient.dio.get('/$cep/json');
    return AddressModel.fromJson(response.data);
  }
}
