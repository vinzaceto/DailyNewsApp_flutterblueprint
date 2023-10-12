import 'package:bmi/features/bmi/data/models/details_arguments.dart';
import 'package:bmi/core/util/sharedpreferences_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:geekyants_flutter_gauges/geekyants_flutter_gauges.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../domain/entities/BMIStatus.dart';

class DetailsPage extends StatefulWidget {
  static const routeName = '/Details';
  final DetailsArguments args;

  const DetailsPage({Key? key, required this.args}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  List<String> history = [];
  String status = "";
  DateTime now = DateTime.now();
  DateFormat formatter = DateFormat('hh:mm dd/MM/yyyy');
  String formattedDate = "";

  @override
  void initState() {
    //_resetShared();
    _loadHistory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    status = _getStatusString(widget.args.status, context);
    formattedDate = formatter.format(now);

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
      actions: [],
    );
  }

  _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          _buildHeader(context),
          _buildStatus(context),
          _buildHistory(context)
        ]),
    );
  }

  void _onTap() {}

  _buildHeader(BuildContext context) {
    return Container(
        width: (MediaQuery.of(context).size.width),
        decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      AppLocalizations.of(context)!.yourBmiIs,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Flex(direction: Axis.horizontal)
                ],
              ),
              Text(
                double.parse((widget.args.bmi).toStringAsFixed(1)).toString(),
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 16,
              ),
              LinearGauge(
                start: 12,
                end: 42,
                rangeLinearGauge: [
                  RangeLinearGauge(
                    start: 12,
                    end: 18,
                    color: Colors.red,
                  ),
                  RangeLinearGauge(
                    start: 18,
                    end: 25,
                    color: Colors.green,
                  ),
                  RangeLinearGauge(
                    start: 25,
                    end: 30,
                    color: Colors.orange,
                  ),
                  RangeLinearGauge(
                    start: 30,
                    end: 42,
                    color: Colors.red,
                  ),
                ],
                pointers: [
                  Pointer(
                    value: _checkBmiForGraph(widget.args.bmi),
                    shape: PointerShape.diamond,
                    color: Colors.black,
                    height: 20,
                  )
                ],
                linearGaugeBoxDecoration:
                    const LinearGaugeBoxDecoration(thickness: 20),
                gaugeOrientation: GaugeOrientation.horizontal,
                rulers: RulerStyle(
                  rulersOffset: 5,
                  labelOffset: 5,
                  inverseRulers: false,
                  rulerPosition: RulerPosition.bottom,
                  showLabel: true,
                ),
              ),
            ],
          ),
        ));
  }

  _buildStatus(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width),
      decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  AppLocalizations.of(context)!.yourStatus,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Flex(direction: Axis.horizontal)
            ],
          ),
          Text(
            _getStatusString(widget.args.status, context),
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
        ]),
      ),
    );
  }

  String _getStatusString(BMIStatus status, BuildContext context) {
    switch (status) {
      case BMIStatus.sottopeso:
        {
          return AppLocalizations.of(context)!.underWeight;
        }
      case BMIStatus.intervalloNormale:
        {
          return AppLocalizations.of(context)!.normal;
        }
      case BMIStatus.preobeso:
        {
          return AppLocalizations.of(context)!.overweight;
        }
      case BMIStatus.obesoI:
        {
          return AppLocalizations.of(context)!.obeseI;
        }
      case BMIStatus.obesoII:
        {
          return AppLocalizations.of(context)!.obeseII;
        }
      case BMIStatus.obesoIII:
        {
          return AppLocalizations.of(context)!.obeseIII;
        }
    }
  }

  _buildHistory(BuildContext context) {
    return Column(
      children: [
        Container(
          width: (MediaQuery.of(context).size.width),
          decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        AppLocalizations.of(context)!.history,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Flex(direction: Axis.horizontal)
                  ],
                ),
              ),
              const Divider(height: 1,thickness: 1,),
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final item = history[index];
                  return Dismissible(
                      key: UniqueKey(),
                      onDismissed: (direction) {
                        setState(() {
                          history.removeAt(index);
                          _saveActualHistory();
                        });
                      },
                      background: Container(
                        color: Colors.red,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(AppLocalizations.of(context)!.delete),
                            Icon(Icons.delete),
                          ],
                        ),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(child: Text("$item")),
                          ),
                          const Divider(height: 1, thickness: 1,)
                        ],
                      ));
                },
                itemCount: history.length,
              ),
            ],
          ),
        )
      ],
    );
  }

  Future<void> _loadHistory() async {
    SharedPreferences sharedPrefs =
        await SharedPreferencesManager.getSharedPreferencesInstance();
    String key = SharedPreferencesManager.bmiRecordKey;
    List<String>? history = sharedPrefs.getStringList(key);
    String bmiToAdd =
        "$formattedDate ${double.parse((widget.args.bmi).toStringAsFixed(1)).toString()} ${status}";
    List<String>? newHistory = [bmiToAdd];
    if (history != null && history.isNotEmpty) {
      newHistory.addAll(history);
    }
    if (newHistory.length > 5) {
      newHistory = newHistory.sublist(0, 5);
    }
    SharedPreferencesManager.saveKV(key, newHistory);
    setState(() {
      this.history = newHistory as List<String>;
    });
  }

  Future<void> _resetShared() async {
    SharedPreferences sharedPrefs =
        await SharedPreferencesManager.getSharedPreferencesInstance();
    SharedPreferencesManager.resetSharedPreferences(
        [SharedPreferencesManager.bmiRecordKey]);
  }

  Future<void> _saveActualHistory() async {
    SharedPreferences sharedPrefs =
        await SharedPreferencesManager.getSharedPreferencesInstance();
    String key = SharedPreferencesManager.bmiRecordKey;
    SharedPreferencesManager.saveKV(key, history);
  }

  double _checkBmiForGraph(double bmi) {
    if (bmi < 12) return 12;
    if (bmi > 42) return 42;
    return bmi;
  }
}
