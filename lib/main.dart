import 'package:flutter/material.dart';
import 'src/routes/app_routes.dart';
import 'src/modules/initial/page/initial_page.dart';
import 'src/shared/colors/app_colors.dart';

// Importando as páginas HomePage e HistoryPage
import 'src/modules/home/page/home_page.dart';
import 'src/modules/history/page/history_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FastLocation',
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
      ),
      initialRoute: AppRoutes.initial,
      routes: {
        AppRoutes.initial: (context) => InitialPage(),
        AppRoutes.home: (context) => HomePage(),  // Certifique-se que HomePage está importada
        AppRoutes.history: (context) => HistoryPage(),  // Certifique-se que HistoryPage está importada
      },
    );
  }
}
