import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GenderButton extends StatefulWidget {
  bool isMale;
  bool isSelected;
  final void Function(bool value)? onButtonTapped;

  GenderButton(
      {Key? key,
      this.isMale = true,
      this.isSelected = false,
      this.onButtonTapped})
      : super(key: key);

  @override
  State<GenderButton> createState() => _GenderButtonState();
}

class _GenderButtonState extends State<GenderButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onButtonTap(),
      child: Container(
        width: (MediaQuery.of(context).size.width - 16) / 2,
        height: MediaQuery.of(context).size.height / 5,
        decoration: BoxDecoration(
            color: widget.isSelected ? Colors.grey : Colors.grey[300],
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              widget.isMale ? Icons.male : Icons.female,
              color: widget.isSelected ? Colors.limeAccent : Colors.black,
              size: 50,
            ),
            Text(
              widget.isMale
                  ? AppLocalizations.of(context)!.male
                  : AppLocalizations.of(context)!.female,
              style: TextStyle(
                color: widget.isSelected ? Colors.limeAccent : Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onButtonTap() {
    if (widget.onButtonTapped != null) {
      setState(() {
        widget.isSelected = true;
        widget.onButtonTapped!(widget.isSelected);
      });
    }
  }
}
