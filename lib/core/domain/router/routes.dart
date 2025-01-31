import 'package:uniqcast/core/domain/router/pages.dart';
import 'package:uniqcast/features/home/presentations/pages/home_page.dart';
import 'package:uniqcast/features/program/domain/entities/program.dart';
import 'package:uniqcast/features/program_details/presentations/pages/program_details_page.dart';
import 'package:uniqcast/features/splash/presentation/pages/splash_page.dart';
import 'package:flutter/material.dart';

final routes = {
  Pages.splash: (context) => SplashPage(),
  Pages.home: (context) => HomePage(),
  Pages.programDetailsPage: (context) {
    final arg =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final program = arg['program'] as Program;
    return ProgramDetailsPage(program);
  },
};
