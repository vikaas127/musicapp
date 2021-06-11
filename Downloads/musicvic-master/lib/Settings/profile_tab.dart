import 'package:flutter/material.dart';
import 'package:musicvic/Components/entry_field.dart';
import 'package:musicvic/Locale/locale.dart';

class ProfileTab extends StatefulWidget {
  @override
  _ProfileTabState createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 5),
      child: Column(
        children: [
          buildEntryField(
              context: context,
              // controller: downloadsController,
              label: locale.fullName,
              initialValue: 'Samantha Smith',
              suffixIconEnabled: false),
          buildEntryField(
              context: context,
              // controller: downloadsController,
              label: locale.emailAddress,
              initialValue: 'samanthasmith@mail.com',
              suffixIconEnabled: false),
          buildEntryField(
              context: context,
              // controller: downloadsController,
              label: locale.phoneNumber,
              initialValue: '+1 987 654 3210',
              suffixIconEnabled: false),
        ],
      ),
    );
  }

  Padding buildEntryField({
    BuildContext context,
    TextEditingController controller,
    String label,
    List<PopupMenuItem> items,
    bool suffixIconEnabled = true,
    String initialValue,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: EntryField(
        initialValue: initialValue ?? initialValue,
        controller: controller,
        label: label,
        readOnly: true,
        noBorder: true,
        suffixIcon: suffixIconEnabled
            ? Icon(
                Icons.keyboard_arrow_down,
                color: Theme.of(context).primaryColor,
              )
            : null,
        onTap: () async {},
      ),
    );
  }
}
