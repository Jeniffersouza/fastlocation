import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fastlocation/src/modules/home/controller/home_controller.dart';
import 'package:fastlocation/src/shared/components/loading_indicator.dart';

class HomePage extends StatelessWidget {
  final HomeController controller = HomeController();
  final TextEditingController _cepController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'FastLocation',
          style: TextStyle(
            fontFamily: 'Arial', // Escolha a fonte de sua preferência
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,  // Cor branca para contraste
          ),
        ),
        backgroundColor: Colors.blueAccent, // Personaliza a cor do AppBar
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,  // Centraliza na vertical
            crossAxisAlignment: CrossAxisAlignment.center,  // Centraliza na horizontal
            children: [
              TextField(
                controller: _cepController,
                decoration: InputDecoration(
                  labelText: 'Digite o CEP',
                  border: OutlineInputBorder(),  // Estilo da borda do campo
                  labelStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.blueAccent,  // Cor personalizada do rótulo
                  ),
                ),
              ),
              SizedBox(height: 16),  // Espaçamento entre os widgets
              ElevatedButton(
                onPressed: () {
                  controller.fetchAddress(_cepController.text);  // Chama o controller com o CEP digitado
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,  // Cor do botão
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  textStyle: TextStyle(fontSize: 18),
                ),
                child: Text('Buscar Endereço'),
              ),
              SizedBox(height: 16),  // Mais espaçamento para separar o botão do conteúdo
              Observer(
                builder: (_) {
                  if (controller.isLoading) {
                    return LoadingIndicator();  // Mostra indicador de loading
                  }

                  if (controller.addresses.isEmpty) {
                    return Text(
                      'Nenhum endereço encontrado.',
                      style: TextStyle(color: Colors.redAccent),
                    );
                  }

                  return Expanded(
                    child: ListView.builder(
                      itemCount: controller.addresses.length,
                      itemBuilder: (context, index) {
                        final address = controller.addresses[index];
                        return ListTile(
                          title: Text('${address.street}, ${address.city}'),
                          subtitle: Text('CEP: ${address.cep}'),
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
