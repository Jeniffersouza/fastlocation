import 'package:hive/hive.dart';
import 'package:fastlocation/src/modules/home/model/address_model.dart';

class HiveStorage {
  static Box? _box;

  static Future<void> init() async {
    _box = await Hive.openBox('addressHistory');
  }

  static List<AddressModel> getHistory() {
    return _box!.values.cast<AddressModel>().toList();
  }

  static void addAddress(AddressModel address) {
    _box!.add(address);
  }
}
