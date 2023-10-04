import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class IncrementalComponent extends StatefulWidget {

  final void Function() ? onPlusTapped;
  final void Function() ? onMinusTapped;
  final String ? title;
  final String ? unit;
  int value;

  IncrementalComponent({
    Key ? key,
    this.title,
    this.onPlusTapped,
    this.onMinusTapped,
    this.unit,
    this.value = 0
  }): super(key: key);

  @override
  State<IncrementalComponent> createState() => _IncrementalComponentState();
}

class _IncrementalComponentState extends State<IncrementalComponent> {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              widget.title!,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        _buildCounter(context),
        Text(
          widget.unit!,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  _buildCounter(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ClipOval(
          child: Material(
            color: Colors.grey, // Button color
            child: InkWell(
              splashColor: Colors.white, // Splash color
              onTap: _onMinusTap,
              child: SizedBox(width: 40, height: 40, child: Center(child: Icon(Icons.remove))),
            ),
          ),
        ),
        Text(
          widget.value.toString(),
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        ClipOval(
          child: Material(
            color: Colors.grey, // Button color
            child: InkWell(
              splashColor: Colors.white, // Splash color
              onTap: _onPlusTap,
              child: SizedBox(width: 40, height: 40, child: Center(child: Icon(Icons.add))),
            ),
          ),
        ),
      ],
    );
  }

  void _onPlusTap() {
    if (widget.onPlusTapped != null) {
      setState(() {
        widget.value = widget.value + 1;
      });
    }
  }

  void _onMinusTap() {
    if (widget.onMinusTapped != null) {
      setState(() {
        widget.value = widget.value - 1;
      });
    }
  }
}