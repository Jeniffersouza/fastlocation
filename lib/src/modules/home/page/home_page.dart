import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fastlocation/src/modules/home/controller/home_controller.dart';
import 'package:fastlocation/src/shared/components/loading_indicator.dart';

class HomePage extends StatelessWidget {
  final HomeController controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FastLocation')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Digite o CEP'),
              // Aqui está correto passar o valor para o método fetchAddress
              onSubmitted: (value) => controller.fetchAddress(value),
            ),
            Observer(
              builder: (_) {
                if (controller.isLoading) {
                  return LoadingIndicator();
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
    );
  }
}
