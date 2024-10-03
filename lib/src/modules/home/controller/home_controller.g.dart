// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on _HomeControllerBase, Store {
  late final _$cepAtom =
      Atom(name: '_HomeControllerBase.cep', context: context);

  @override
  String get cep {
    _$cepAtom.reportRead();
    return super.cep;
  }

  @override
  set cep(String value) {
    _$cepAtom.reportWrite(value, super.cep, () {
      super.cep = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_HomeControllerBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_HomeControllerBase.errorMessage', context: context);

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$addressesAtom =
      Atom(name: '_HomeControllerBase.addresses', context: context);

  @override
  ObservableList<AddressModel> get addresses {
    _$addressesAtom.reportRead();
    return super.addresses;
  }

  @override
  set addresses(ObservableList<AddressModel> value) {
    _$addressesAtom.reportWrite(value, super.addresses, () {
      super.addresses = value;
    });
  }

  late final _$addressHistoryAtom =
      Atom(name: '_HomeControllerBase.addressHistory', context: context);

  @override
  ObservableList<AddressModel> get addressHistory {
    _$addressHistoryAtom.reportRead();
    return super.addressHistory;
  }

  @override
  set addressHistory(ObservableList<AddressModel> value) {
    _$addressHistoryAtom.reportWrite(value, super.addressHistory, () {
      super.addressHistory = value;
    });
  }

  late final _$fetchAddressAsyncAction =
      AsyncAction('_HomeControllerBase.fetchAddress', context: context);

  @override
  Future<void> fetchAddress(String cepInput) {
    return _$fetchAddressAsyncAction.run(() => super.fetchAddress(cepInput));
  }

  late final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase', context: context);

  @override
  void updateHistory(AddressModel address) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.updateHistory');
    try {
      return super.updateHistory(address);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cep: ${cep},
isLoading: ${isLoading},
errorMessage: ${errorMessage},
addresses: ${addresses},
addressHistory: ${addressHistory}
    ''';
  }
}
