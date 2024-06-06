import 'package:flutter/material.dart';

class CustomInputs extends StatelessWidget {
  final IconData? icon;
  final String name;
  final String? hint;
  final TextEditingController? controller;
  final String? errorText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;

  const CustomInputs({
    super.key,
    this.icon,
    this.hint,
    this.errorText,
    this.validator,
    this.onChanged,
    this.keyboardType,
    required this.name,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(14), topRight: Radius.circular(14)));

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(name),
      TextFormField(
          maxLength: 15,
          controller: controller,
          keyboardType: keyboardType,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              suffixIcon: errorText?.isEmpty != null
                  ? const Icon(Icons.error)
                  : Icon(icon),
              border: border,
              focusedBorder: border.copyWith(
                  borderSide: const BorderSide(color: Colors.green)),
              errorBorder: border.copyWith(
                  borderSide: const BorderSide(color: Colors.red)),
              focusedErrorBorder: border.copyWith(
                  borderSide: const BorderSide(color: Colors.red)),
              hintText: hint,
              errorText: errorText),
          onChanged: onChanged,
          validator: validator),
    ]);
    // );
  }
}
