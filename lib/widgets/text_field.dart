import 'dart:ffi';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatefulWidget {
  CustomTextFormField({
    Key? key,
    required this.lines,
    this.controller,
    required this.label,
    this.hintText,
    this.hPadding = 0,
    this.isPassword = false,
    this.suffixIcon,
    this.requiredField = true,
    this.errorText,
    this.displayLabel = true,
    this.maxLines = 1,
    this.onTap,
    this.initialValue,
    this.filled,
    this.fillColor,
    this.prefixIcon,
    this.keyboardType,
    this.onChange,
    this.readOnly = false,
    this.contentPadding,
    this.autoFocus = false,
    this.onSubmit,
    this.hintStyle,
    this.textInputAction,
    this.textDirection = TextDirection.ltr,
  }) : super(key: key);

  final String? hintText;

  final int lines;
  final String label;
  final TextEditingController? controller;
  final double hPadding;
  final bool isPassword;
  Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool requiredField;
  String? errorText;
  final bool displayLabel;
  final int? maxLines;
  final Function()? onTap;
  final String? initialValue;
  final bool readOnly;
  final Color? fillColor;
  final bool? filled;
  final void Function(String)? onChange;
  final void Function(String)? onSubmit;
  final TextInputType? keyboardType;
  final TextStyle? hintStyle;
  final bool autoFocus;
  final TextInputAction? textInputAction;
  EdgeInsets? contentPadding;
  TextDirection? textDirection;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  Icon eyeIcon = const Icon(Icons.visibility_off,color: Colors.red,);

  bool isVisible = true;

  changeVisibility() {
    if (isVisible) {
      setState(() {
        isVisible = false;
        eyeIcon = const Icon(Icons.visibility,color: Colors.red);
      });
    } else {
      setState(() {
        isVisible = true;
        eyeIcon = const Icon(Icons.visibility_off,color: Colors.red);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isPassword) {
      widget.suffixIcon = InkWell(
        child: eyeIcon,
        onTap: () {
          changeVisibility();
        },
      );
    }
    return Container(
      padding: EdgeInsets.symmetric(horizontal: widget.hPadding, vertical: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (widget.displayLabel) ...[
            Text(
              widget.label,

            ),
            const SizedBox(
              height: 5,
            ),
          ],
          TextFormField(

            cursorColor: Colors.red,
            textAlign: TextAlign.left,
            textDirection: widget.textDirection,
            autofocus: widget.autoFocus,
            controller: widget.controller,
            obscureText: widget.isPassword==true?isVisible:false,
            maxLines: widget.lines,
            onTap: widget.onTap,
            initialValue: widget.initialValue,
            readOnly: widget.readOnly,
            textInputAction: widget.textInputAction,
            validator: widget.requiredField
                ? (value) {
                    if (value == null || value.isEmpty) {
                      return 'please enter your data.';
                    }
                    return null;
                  }
                : null,
            style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).colorScheme.shadow,
                decoration: TextDecoration.none),
            //<-- SEE HERE

            onChanged: (v) {
              if (widget.onChange != null) {
                widget.onChange!(v);
              }

              if (widget.errorText != null) {
                widget.errorText = null;
                setState(() {});
              }
            },
            onFieldSubmitted: (v) {
              if (widget.onSubmit != null) {
                widget.onSubmit!(v);
              }
            },
            keyboardType: widget.keyboardType,
            decoration: InputDecoration(
              hintText: widget.hintText,
              suffixIcon: widget.suffixIcon,
              // errorText: widget.errorText,
              filled: widget.filled,
              fillColor: widget.fillColor,
              prefix: widget.prefixIcon,
              hintStyle: widget.hintStyle,
              errorMaxLines: 10,
              contentPadding: widget.contentPadding,
              border: buildTextFieldBorder(),
              focusedBorder: buildTextFieldBorder(),
              errorBorder: buildTextFieldBorder(borderColor: Colors.red),
              enabledBorder: buildTextFieldBorder(),
              disabledBorder: buildTextFieldBorder(),
            ),
          ),
        ],
      ),
    );
  }

  OutlineInputBorder buildTextFieldBorder(
      {Color? borderColor, double borderRadius = 5}) {
    return OutlineInputBorder(
        borderSide: BorderSide(
          width: .7,
          color: borderColor ?? Colors.grey,
        ),
        borderRadius: BorderRadius.circular(borderRadius));
  }
}
