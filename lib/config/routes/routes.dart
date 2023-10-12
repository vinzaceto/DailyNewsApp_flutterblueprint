import 'package:bmi/features/bmi/data/models/details_arguments.dart';
import 'package:bmi/features/bmi/domain/entities/BMIStatus.dart';
import 'package:bmi/features/bmi/domain/entities/coupon.dart';
import 'package:bmi/features/bmi/presentation/pages/details/details_page.dart';
import 'package:bmi/features/bmi/presentation/pages/home/home_page.dart';
import 'package:flutter/material.dart';

import '../../features/bmi/presentation/pages/settings/settings_page.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const HomePage());

      case DetailsPage.routeName:
        {
          final args = settings.arguments as DetailsArguments;
          return _materialRoute(DetailsPage(args: args,));
        }
      case '/Settings':
        return _materialRoute(SettingsPage());

      default:
        return _materialRoute(const HomePage());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
