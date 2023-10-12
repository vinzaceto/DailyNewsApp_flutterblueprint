import 'package:bmi/features/bmi/domain/entities/BMIStatus.dart';

class DetailsArguments {
  final double bmi;
  final BMIStatus status;

  DetailsArguments(this.bmi, this.status);
}