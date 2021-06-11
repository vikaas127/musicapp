import 'package:flutter/material.dart';

class EntryField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String image;
  final String initialValue;
  final bool readOnly;
  final TextInputType keyboardType;
  final int maxLength;
  final int maxLines;
  final String hint;
  final Widget prefix;
  final Widget suffixIcon;
  final Function onTap;
  final TextCapitalization textCapitalization;
  final bool noBorder;

  EntryField({
    this.controller,
    this.label,
    this.image,
    this.initialValue,
    this.readOnly,
    this.keyboardType,
    this.maxLength,
    this.hint,
    this.prefix,
    this.maxLines,
    this.suffixIcon,
    this.onTap,
    this.textCapitalization,
    this.noBorder,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enableInteractiveSelection: false,
      textCapitalization: textCapitalization ?? TextCapitalization.sentences,
      cursorColor: Theme.of(context).primaryColor,
      onTap: onTap,
      autofocus: false,
      controller: controller,
      initialValue: initialValue,
      readOnly: readOnly ?? false,
      keyboardType: keyboardType,
      minLines: 1,
      maxLength: maxLength,
      maxLines: maxLines,
      decoration: InputDecoration(
        prefixIcon: prefix,
        suffixIcon: suffixIcon,
        labelText: label,
        labelStyle: Theme.of(context)
            .textTheme
            .subtitle1
            .copyWith(color: Theme.of(context).unselectedWidgetColor),
        hintText: hint,
        hintStyle: TextStyle(color: Theme.of(context).hintColor),
        counter: Offstage(),
        icon: (image != null)
            ? ImageIcon(
                AssetImage(image),
                color: Theme.of(context).primaryColor,
                size: 20.0,
              )
            : null,
        border: noBorder?OutlineInputBorder(
          borderSide: BorderSide.none
        ):UnderlineInputBorder(),
        ),
    );
  }
}
