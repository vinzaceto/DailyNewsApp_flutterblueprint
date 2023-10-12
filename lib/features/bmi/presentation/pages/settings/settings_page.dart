import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: _buildBody(),
    );
  }

  _buildAppbar(BuildContext context) {
    return AppBar(
      title: Text(
        AppLocalizations.of(context)!.about,
      ),
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 14),
          child: Icon(Icons.arrow_back,),
        ),
      ),
      centerTitle: false,
      actions: [

      ],
    );
  }

  _buildBody() {
    return TextButton(
      onPressed: () => throw Exception(),
      child: const Text("Throw Test Exception"),
    );
  }
}
