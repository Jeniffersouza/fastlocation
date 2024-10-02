import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fastlocation/src/modules/history/controller/history_controller.dart';

class HistoryPage extends StatelessWidget {
  final HistoryController controller = HistoryController();

  @override
  Widget build(BuildContext context) {
    controller.loadHistory();
    
    return Scaffold(
      appBar: AppBar(title: Text('Histórico')),
      body: Observer(
        builder: (_) {
          return ListView.builder(
            itemCount: controller.history.length,
            itemBuilder: (context, index) {
              final address = controller.history[index];
              return ListTile(
                title: Text('${address.street}, ${address.city}'),
                subtitle: Text('CEP: ${address.cep}'),
              );
            },
          );
        },
      ),
    );
  }
}
