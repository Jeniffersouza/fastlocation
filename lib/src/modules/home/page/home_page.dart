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
            color: Colors.white, // Cor branca para contraste
          ),
        ),
        backgroundColor: Colors.blueAccent, // Personaliza a cor do AppBar
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Centraliza na vertical
            //crossAxisAlignment: CrossAxisAlignment.center, // Centraliza na horizontal
            children: [
              Text(
                        'Buscador de CEP',
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                ),
              SizedBox(height: 30),
              TextField(
                controller: _cepController,
                decoration: InputDecoration(
                  labelText: 'Digite o CEP',
                  border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  ), // Estilo da borda do campo
                  labelStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.blueAccent, // Cor personalizada do rótulo
                  ),
                ),
              ),
              SizedBox(height: 16), // Espaçamento entre os widgets
              ElevatedButton(
                onPressed: () {
                  controller.fetchAddress(_cepController.text); // Chama o controller com o CEP digitado
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent, // Cor do botão
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  textStyle: TextStyle(fontSize: 18),
                  foregroundColor: Colors.white,
                ),
                child: Text('Buscar Endereço'),
              ),
              SizedBox(height: 16), // Mais espaçamento para separar o botão do conteúdo

              // Exibe a mensagem de erro, se existir
              Observer(
                builder: (_) {
                  if (controller.isLoading) {
                    return LoadingIndicator(); // Mostra indicador de loading
                  }

                  if (controller.errorMessage.isNotEmpty) {
                    return Text(
                      controller.errorMessage, // Mostra a mensagem de erro
                      style: TextStyle(color: Colors.redAccent, fontSize: 16),
                      textAlign: TextAlign.center, // Centraliza o texto
                    );
                  }

                  return Container(); // Retorna um container vazio se não houver erro ou loading
                },
              ),

              SizedBox(height: 16), // Espaçamento entre o erro e o histórico

              // Exibe o histórico dos 3 últimos endereços
              Observer(
                builder: (_) {
                  if (controller.addressHistory.isNotEmpty) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Histórico de endereços:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blueAccent, width: 1.5),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: SizedBox(
                            height: 100, // Defina uma altura fixa ou limite
                            child: ListView.builder(
                              itemCount: controller.addressHistory.length,
                              itemBuilder: (context, index) {
                                final address = controller.addressHistory[index];
                                return ListTile(
                                  title: Text('${address.street}, ${address.city}'),
                                  subtitle: Text('CEP: ${address.cep}'),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Text(
                      'Nenhum endereço pesquisado ainda.',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
