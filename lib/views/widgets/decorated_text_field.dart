import 'package:flutter/material.dart';
import 'package:goals/views/utils/app_styles.dart';

class DecoratedTextField extends StatelessWidget {
  final String? title;
  final int maxLine;
  final bool autoFocus;
  const DecoratedTextField({
    Key? key,
    this.title,
    this.maxLine = 1,
    this.autoFocus = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          color: AppStyles.backgroundColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
          child: TextFormField(
            autofocus: autoFocus,
            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: title ?? ' ',
            ),
            maxLines: maxLine,
          ),
        ),
      ),
    );
  }
}
