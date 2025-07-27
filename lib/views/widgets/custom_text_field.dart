import 'package:flutter/material.dart';
import 'package:notes_app/constsnts.dart';

class CustomTextField extends StatelessWidget {
   CustomTextField({super.key, this.hintText, this.maxLines = 1,this.onSaved});
  final hintText;
  final maxLines;

  void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Field is required';
        }
        return null;
      },
      cursorColor: KPrimaryColor,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: KPrimaryColor),

        border: buildBorder(),

        enabledBorder: buildBorder(),

        focusedBorder: buildBorder(KPrimaryColor),
      ),
    );
  }

  OutlineInputBorder buildBorder([Color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
      borderSide: BorderSide(color: Color ?? Colors.white),
    );
  }
}
