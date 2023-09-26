import 'package:discountcodes/features/discount_code/domain/entities/coupon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class DetailsPage extends StatelessWidget {

  final CouponEntity ? coupon;
  final void Function(CouponEntity article) ? onCouponPressed;

  const DetailsPage({
    Key ? key,
    this.coupon,
    this.onCouponPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: _buildBody(),
    );
  }

  _buildAppbar(BuildContext context) {
    return AppBar(
      title: Text(AppLocalizations.of(context)!.details),
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 14),
          child: Icon(Icons.arrow_back),
        ),
      ),
      actions: [

      ],
    );
  }

  _buildBody() {
    return Placeholder();
  }

  void _onTap() {
    if (onCouponPressed != null) {
      onCouponPressed!(coupon!);
    }
  }
}
