import 'package:bmi/features/bmi/domain/entities/unit.dart';
import 'package:flutter/material.dart';

class UnitSelector extends StatefulWidget {
  bool isWeight = true;
  bool isCMSelected = true;
  final void Function(bool value)? onButtonTapped;

  UnitSelector({
    Key? key,
    this.isCMSelected = true,
    this.isWeight = true,
    this.onButtonTapped
  }) : super(key: key);

  @override
  State<UnitSelector> createState() => _UnitSelectorState();
}

class _UnitSelectorState extends State<UnitSelector> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipOval(
          child: Material(
            color: widget.isCMSelected ? Colors.grey : Colors.grey[300],
            // Button color
            child: InkWell(
              splashColor: Colors.white, // Splash color
              onTap: () => _onButtonTap(),
              child: SizedBox(
                  width: 40,
                  height: 40,
                  child: Center(
                    child: Text(
                      widget.isWeight ? "kg" : "cm",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: widget.isCMSelected
                              ? Colors.limeAccent
                              : Colors.black),
                    ),
                  )),
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        ClipOval(
          child: Material(
            color: !widget.isCMSelected
                ? Colors.grey
                : Colors.grey[300], // Button color
            child: InkWell(
              splashColor: Colors.white, // Splash color
              onTap: () => _onButtonTap(),
              child: SizedBox(
                  width: 40,
                  height: 40,
                  child: Center(
                    child: Text(
                      widget.isWeight ? "lb" : "ft",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: !widget.isCMSelected
                              ? Colors.limeAccent
                              : Colors.black),
                    ),
                  )),
            ),
          ),
        )
      ],
    );
  }

  void _onButtonTap() {
    if (widget.onButtonTapped != null) {
      setState(() {
        widget.isCMSelected = !widget.isCMSelected;
        widget.onButtonTapped!(widget.isCMSelected);
      });
    }
  }
}
