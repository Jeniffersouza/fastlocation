class AddressModel {
  final String cep;
  final String street;
  final String city;
  
  AddressModel({required this.cep, required this.street, required this.city});

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      cep: json['cep'],
      street: json['logradouro'],
      city: json['localidade'],
    );
  }
}
