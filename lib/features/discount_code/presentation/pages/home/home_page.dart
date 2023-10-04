import 'package:bmi/config/routes/routes.dart';
import 'package:bmi/features/discount_code/domain/entities/BMIStatus.dart';
import 'package:bmi/features/discount_code/domain/entities/coupon.dart';
import 'package:bmi/features/discount_code/presentation/widgets/coupon_title.dart';
import 'package:bmi/features/discount_code/presentation/widgets/incremental_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// #docregion AppLocalizationsImport
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// #enddocregion AppLocalizationsImport

import '../../../domain/entities/article.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _value = 150;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: _buildBody(context),
    );
  }

  _buildAppbar(BuildContext context) {
    return AppBar(
      title: Text(
        AppLocalizations.of(context)!.appname,
        style: TextStyle(
          fontSize: 30,
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () => _goToSettings(context),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: Icon(Icons.settings),
          ),
        ),
      ],
    );
  }

  _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        _buildHeader(context),
        _buildHeightSection(context),
        _buildWeightAgeSection(context),
        _buildCalculateButton(context)
      ]),
    );
  }

  void _onCouponPressed(BuildContext context, CouponEntity couponEntity) {
    Navigator.pushNamed(context, '/Details', arguments: couponEntity);
  }

  _goToSettings(BuildContext context) {
    Navigator.pushNamed(context, '/Settings');
  }

  _onFloatingButtonTap(BuildContext context) {
    Navigator.pushNamed(context, '/NewCoupon');
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        Container(
          width: (MediaQuery.of(context).size.width - 48) / 2,
          height: MediaQuery.of(context).size.height / 5,
          decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  color: Colors.black,
                  iconSize: 50,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                  ),
                  onPressed: () => _onFloatingButtonTap(context),
                  icon: Icon(Icons.male)),
              Text(AppLocalizations.of(context)!.male)
            ],
          ),
        ),
        SizedBox(width: 16),
        Container(
          width: (MediaQuery.of(context).size.width - 48) / 2,
          height: MediaQuery.of(context).size.height / 5,
          decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  color: Colors.black,
                  iconSize: 50,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                  ),
                  onPressed: () => _onFloatingButtonTap(context),
                  icon: Icon(Icons.female)),
              Text(AppLocalizations.of(context)!.female)
            ],
          ),
        ),
      ],
    );
  }

  double calculateBMI(double weightInKilograms, double heightInCentimeter) {
    var heightInMeters = heightInCentimeter / 100;
    var heightxheigth = heightInMeters * heightInMeters;
    return weightInKilograms / heightxheigth;
  }

  BMIStatus checkBMI(double bmi) {
    if (bmi < 18.50) {
      return BMIStatus.sottopeso;
    } else if (bmi >= 18.50 && bmi < 24.99) {
      return BMIStatus.intervalloNormale;
    } else if (bmi >= 25.00 && bmi < 29.99) {
      return BMIStatus.preobeso;
    } else if (bmi >= 30.00 && bmi < 34.99) {
      return BMIStatus.obesoI;
    } else if (bmi >= 35.00 && bmi < 39.99) {
      return BMIStatus.obesoII;
    }
    return BMIStatus.obesoIII;
  }

  _buildWeightAgeSection(BuildContext context) {
    return Row(
      children: [
        Container(
          width: (MediaQuery.of(context).size.width - 48) / 2,
          height: MediaQuery.of(context).size.height / 5,
          decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: IncrementalComponent(
                title: AppLocalizations.of(context)?.weight,
                unit: "Kg",
                onPlusTapped: _onPlusTapped,
                onMinusTapped: _onPlusTapped,
              )),
        ),
        SizedBox(width: 16),
        Container(
          width: (MediaQuery.of(context).size.width - 48) / 2,
          height: MediaQuery.of(context).size.height / 5,
          decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: IncrementalComponent(
                title: AppLocalizations.of(context)?.age,
                unit: "Kg",
                onPlusTapped: _onPlusTapped,
                onMinusTapped: _onPlusTapped,
              )),
        ),
      ],
    );
  }

  _buildHeightSection(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width - 32),
      decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.height,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipOval(
                      child: Material(
                        color: Colors.grey, // Button color
                        child: InkWell(
                          splashColor: Colors.white, // Splash color
                          onTap: () {},
                          child: SizedBox(
                              width: 40,
                              height: 40,
                              child: Center(child: Text("CM"))),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    ClipOval(
                      child: Material(
                        color: Colors.grey, // Button color
                        child: InkWell(
                          splashColor: Colors.white, // Splash color
                          onTap: () {},
                          child: SizedBox(
                              width: 40,
                              height: 40,
                              child: Center(child: Text("FT"))),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
            Text(
              "$_value",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            Slider(
              activeColor: Colors.black,
              inactiveColor: Colors.white,
              thumbColor: Colors.black,
              min: 100.0,
              max: 250.0,
              value: _value,
              onChanged: (value) {
                setState(() {
                  _value = double.parse((value).toStringAsFixed(1));
                });
              },
            )
          ],
        ),
      ),
    );
  }

  _onPlusTapped() {
    print("***** plus tapped *********");
  }

  _buildCalculateButton(BuildContext context) {
    return Container(
        width: (MediaQuery.of(context).size.width - 32),
        decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
              child: Text(
            "Calculate",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          )),
        ));
  }
}
