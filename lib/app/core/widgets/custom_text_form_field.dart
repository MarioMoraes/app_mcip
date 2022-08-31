import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hint;
  final String? label;
  final bool obscureText;
  final bool? enabled;
  final ValueNotifier<bool> _obscureTextVN;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;

  CustomTextFormField({
    Key? key,
    this.hint,
    this.label,
    this.obscureText = false,
    this.enabled = true,
    this.controller,
    this.validator,
  })  : _obscureTextVN = ValueNotifier(obscureText),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _obscureTextVN,
      builder: (_, obscureTextVNValue, child) {
        return TextFormField(
          enabled: enabled,
          controller: controller,
          validator: validator,
          obscureText: obscureTextVNValue,
          decoration: InputDecoration(
              filled: enabled,
              fillColor:
                  (enabled != null) ? Colors.grey.shade200 : Colors.white,
              isDense: true,
              hintText: hint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: const BorderSide(color: Colors.white),
              ),
              suffixIcon: obscureText
                  ? IconButton(
                      onPressed: () {
                        _obscureTextVN.value = !obscureTextVNValue;
                      },
                      icon: Icon(
                        obscureTextVNValue ? Icons.lock : Icons.lock_open,
                        color: Colors.black,
                      ),
                    )
                  : null),
        );
      },
    );
  }
}
