import 'package:flutter/material.dart';

class CustomTextFormFieldWithHint extends StatelessWidget {
  final String hint;
  final bool obscureText;
  final bool? enabled;
  final ValueNotifier<bool> _obscureTextVN;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;

  CustomTextFormFieldWithHint({
    Key? key,
    required this.hint,
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
          keyboardType: TextInputType.number,
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
              label: Text(hint),
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
