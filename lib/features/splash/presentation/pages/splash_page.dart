import 'package:flutter/material.dart';
import 'package:uniqcast/core/domain/router/pages.dart';

class SplashPage extends StatelessWidget {
  static const routeName = Pages.splash;
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Splash Page'),
      ),
    );
  }
}
