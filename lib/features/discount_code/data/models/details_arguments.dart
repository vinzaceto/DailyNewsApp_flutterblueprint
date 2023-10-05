import 'package:bmi/features/discount_code/domain/entities/BMIStatus.dart';

class DetailsArguments {
  final double bmi;
  final BMIStatus status;

  DetailsArguments(this.bmi, this.status);
}