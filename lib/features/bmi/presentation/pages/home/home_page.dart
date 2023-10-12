import 'package:bmi/core/constants/constants.dart';
import 'package:bmi/features/bmi/data/models/details_arguments.dart';
import 'package:bmi/features/bmi/domain/entities/BMIStatus.dart';
import 'package:bmi/features/bmi/domain/entities/coupon.dart';
import 'package:bmi/features/bmi/presentation/pages/details/details_page.dart';
import 'package:bmi/features/bmi/presentation/widgets/coupon_title.dart';
import 'package:bmi/features/bmi/presentation/widgets/gender_button.dart';
import 'package:bmi/features/bmi/presentation/widgets/incremental_component.dart';
import 'package:bmi/features/bmi/presentation/widgets/unit_selector.dart';
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
  double _height = defaultHeight;
  double _weight = defaultWeight;

  double _defaultHeightMin = 100;
  double _defaultHeightMax = 250;

  int _age = defaultAge;
  bool isMaleSelected = true;
  bool isFemaleSelected = false;
  bool isCMSelected = true;

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
            child: Icon(Icons.more_vert),
          ),
        ),
      ],
    );
  }

  _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          _buildHeightSection(context),
          _buildWeightSection(context),
          //_buildWeightAgeSection(context),
          _buildHeader(context),
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

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GenderButton(
          onButtonTapped: (value) =>  _onMaleButtonTapped(value),
          isMale: true,
          isSelected: isMaleSelected,
        ),
        const SizedBox(width: 16),
        GenderButton(
          onButtonTapped: (value) => _onFemaleButtonTapped(value),
          isMale: false,
          isSelected: isFemaleSelected,
        ),
      ],
    );
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
                value: _weight.toInt(),
                onPlusTapped: (value) => _onPlusMinusTapped(value, true),
                onMinusTapped: (value) => _onPlusMinusTapped(value, true),
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
                value: _age,
                onPlusTapped: (value) => _onPlusMinusTapped(value, false),
                onMinusTapped: (value) => _onPlusMinusTapped(value, false),
              )),
        ),
      ],
    );
  }

  _buildHeightSection(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width),
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
                UnitSelector(
                  isCMSelected: isCMSelected,
                  isWeight: false,
                  onButtonTapped: (value) => _onCMButtonTapped(value),
                )
              ],
            ),
            Text(
              _showHeight(_height),
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            Slider(
              activeColor: Colors.grey,
              inactiveColor: Colors.white,
              thumbColor: Colors.limeAccent,
              min: _defaultHeightMin,
              max: _defaultHeightMax,
              value: _height,
              onChanged: (value) {
                setState(() {
                  _height = double.parse((value).toStringAsFixed(1));
                });
              },
            )
          ],
        ),
      ),
    );
  }

  _buildWeightSection(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
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
                  AppLocalizations.of(context)!.weight,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                UnitSelector(
                  isCMSelected: isCMSelected,
                  onButtonTapped: (value) => _onCMButtonTapped(value),
                )
              ],
            ),
            Text(
              "${_showWeight(_weight)}",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            Slider(
              activeColor: Colors.grey,
              inactiveColor: Colors.white,
              thumbColor: Colors.limeAccent,
              min: 45.0,
              max: 200.0,
              value: _weight,
              onChanged: (value) {
                setState(() {
                  _weight = double.parse((value).toStringAsFixed(1));
                });
              },
            )
          ],
        ),
      ),
    );
  }

  _onCMButtonTapped(bool value) {
    setState(() {
      isCMSelected = value;
    });
  }

  _onMaleButtonTapped(bool value) {
    setState(() {
      isMaleSelected = value;
      isFemaleSelected = !value;
    });
  }

  _onFemaleButtonTapped(bool value) {
    setState(() {
      isMaleSelected = !value;
      isFemaleSelected = value;
    });
  }

  _onPlusMinusTapped(int value, bool isWeight) {
    if (isWeight) {
      _weight = value.toDouble();
    } else {
      _age = value;
    }
  }

  _buildCalculateButton(BuildContext context) {
    return GestureDetector(
      onTap: _onCalculatePressed,
      child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: Text(
                  AppLocalizations.of(context)!.calculate,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
          )),
    );
  }

  _onCalculatePressed() {
    double bmi = calculateBMI(_weight.toDouble(), _height.toDouble());
    BMIStatus status = checkBMI(bmi, isMaleSelected);
    Navigator.pushNamed(context, DetailsPage.routeName, arguments: DetailsArguments(bmi, status));
  }

  double calculateBMI(double weightInKilograms, double heightInCentimeter) {
    var heightInMeters = heightInCentimeter / 100;
    var heightxheigth = heightInMeters * heightInMeters;
    return weightInKilograms / heightxheigth;
  }

  BMIStatus checkBMI(double bmi, bool isMale) {
    if (isMale) {
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
      } else {
        return BMIStatus.obesoIII;
      }
    } else {
      if (bmi < 17.50) {
        return BMIStatus.sottopeso;
      } else if (bmi >= 17.50 && bmi < 24) {
        return BMIStatus.intervalloNormale;
      } else if (bmi >= 24 && bmi < 29) {
        return BMIStatus.preobeso;
      } else if (bmi >= 29 && bmi < 34) {
        return BMIStatus.obesoI;
      } else if (bmi >= 34 && bmi < 36.5) {
        return BMIStatus.obesoII;
      } else {
        return BMIStatus.obesoIII;
      }
    }
  }
  
  String _showHeight(double height){
    if(isCMSelected){
      return "$height";
    } else {
      return "${_centimetersToFeeString(height)}";
    }
  }

  String _showWeight(double weight){
    if(isCMSelected){
      return "$weight";
    } else {
      return "${formatLb(kilogramsToPounds(weight))} ";
    }
  }

  String _centimetersToFeeString(double centimeters) {
    var tmp = centimeters / 30.48;
    return tmp.toStringAsFixed(2);
  }

  double _centimetersToFeetDouble(double centimeters) {
    return centimeters / 30.48;
  }

  double _feetToCentimeters(double feet) {
    return feet * 30.48;
  }

  String formatFeet(double feet) {
    return "${feet.toStringAsFixed(2).substring(0,1)}\' ${feet.toStringAsFixed(2).substring(2)}\"";
  }

  double kilogramsToPounds(double kilograms) {
    return kilograms * 2.2046226218488;
  }

  double poundsToKilograms(double pounds) {
    return pounds / 2.2046226218488;
  }

  String formatLb(double lb) {
    return lb.toStringAsFixed(1);
  }

}
