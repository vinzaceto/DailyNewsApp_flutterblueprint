import 'package:bmi/features/discount_code/domain/entities/coupon.dart';
import 'package:bmi/features/discount_code/presentation/pages/details/details_page.dart';
import 'package:bmi/features/discount_code/presentation/pages/home/home_page.dart';
import 'package:flutter/material.dart';

import '../../features/discount_code/presentation/pages/settings/settings_page.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const HomePage());

      case '/Details':
        return _materialRoute(DetailsPage(coupon: settings.arguments as CouponEntity));

      case '/NewCoupon':
        return _materialRoute(DetailsPage());

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
