import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:fastlocation/src/routes/app_routes.dart';

class InitialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(seconds: 2), () {
        Navigator.pushReplacementNamed(context, AppRoutes.home);
      });
    });

    return Scaffold(
      body: Center(
        child: Text('FastLocation'),
      ),
    );
  }
}
