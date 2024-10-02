import 'package:mobx/mobx.dart';
import 'package:fastlocation/src/modules/home/model/address_model.dart';
import 'package:fastlocation/src/shared/storage/hive_storage.dart';

part 'history_controller.g.dart';

class HistoryController = _HistoryControllerBase with _$HistoryController;

abstract class _HistoryControllerBase with Store {
  @observable
  ObservableList<AddressModel> history = ObservableList<AddressModel>();

  @action
  void loadHistory() {
    history.addAll(HiveStorage.getHistory());
  }
}
