import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BorderedInput extends StatelessWidget {
  const BorderedInput(
      {super.key,
      required this.placeholder,
      this.isSecure = false,
      this.onChanged,
      this.controller,
      this.focusNode,
      this.onSubmited,
      this.inputFormatters = const <TextInputFormatter>[],
      this.initialValue,
      this.backgroundColor = Colors.transparent,
      this.prefixIcon,
      this.errorText,
      this.onSaved,
      this.sufixIcon,
      this.validator,
      this.maxLines = 1,
      this.margin = const EdgeInsets.fromLTRB(0, 16, 0, 4)});

  final String placeholder;
  final bool isSecure;
  final void Function(String?)? onChanged;
  final VoidCallback? onSubmited;
  final List<TextInputFormatter> inputFormatters;
  final String? initialValue;
  final Color backgroundColor;
  final String? errorText;
  final Icon? prefixIcon;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final IconButton? sufixIcon;
  final EdgeInsets margin;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: margin,
        child: TextFormField(
          controller: controller,
          focusNode: focusNode,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator,
          onSaved: onSaved,
          autofillHints: null,
          initialValue: initialValue,
          obscureText: isSecure,
          autocorrect: false,
          enableSuggestions: false,
          keyboardType: TextInputType.name,
          smartDashesType: SmartDashesType.disabled,
          enableIMEPersonalizedLearning: false,
          style: const TextStyle(color: Colors.white),
          maxLines: maxLines,
          decoration: InputDecoration(
              prefixIcon: prefixIcon,
              suffixIcon: sufixIcon,
              filled: true,
              fillColor: backgroundColor,
              errorText: errorText,
              label: _BorderedInputDecorationLabel(placeholder),
              contentPadding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      color: CustomColors.applicationColorMain, width: 1)),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: CustomColors.gray, width: 0)),
              border: const OutlineInputBorder(),
              hintText: placeholder,
              hintStyle:
                  const TextStyle(color: CustomColors.gray, fontSize: 15)),
          onChanged: onChanged,
          inputFormatters: inputFormatters,
          onFieldSubmitted: (value) => {
            if (onSubmited != null) {onSubmited!()}
          },
        ));
  }
}

class _BorderedInputDecorationLabel extends StatelessWidget {
  const _BorderedInputDecorationLabel(this.text);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          WidgetSpan(
            child: Text(
              text,
              style: const TextStyle(color: CustomColors.gray),
            ),
          ),
        ],
      ),
    );
  }
}
