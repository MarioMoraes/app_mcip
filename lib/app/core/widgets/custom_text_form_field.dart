import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hint;
  final bool obscureText;
  final ValueNotifier<bool> _obscureTextVN;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;

  CustomTextFormField({
    Key? key,
    required this.hint,
    this.obscureText = false,
    this.controller,
    this.validator,
  })  : _obscureTextVN = ValueNotifier<bool>(obscureText),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _obscureTextVN,
      builder: (_, obscureTextVNValue, child) {
        return TextFormField(
          controller: controller,
          validator: validator,
          obscureText: obscureTextVNValue,
          decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(color: Colors.black, fontSize: 14.0),
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
