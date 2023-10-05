import 'package:bmi/features/discount_code/data/models/details_arguments.dart';
import 'package:bmi/features/discount_code/domain/entities/coupon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../domain/entities/BMIStatus.dart';


class DetailsPage extends StatelessWidget {

  static const routeName = '/Details';
  final DetailsArguments args;
  DetailsPage({
    Key ? key,
    required this.args
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: _buildAppbar(context),
      body: _buildBody(context),
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

  _buildBody(BuildContext context) {
    return Text(args.bmi.toString(), style: TextStyle(fontSize: 35),);
  }

  void _onTap() {
  }
}
