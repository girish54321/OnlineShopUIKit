import 'package:flutter/material.dart';

class InputText extends StatefulWidget {
  final String? hint;
  final Widget? rightIcon;
  final Widget? leftIcon;
  final TextEditingController? textEditingController;
  final bool? password;
  final Function(String)? changeFous;
  final FocusNode? focusNode;
  final TextInputType? textInputType;
  final String? errorText;
  final Function(String)? onChanged;
  final FormFieldValidator? validator;
  final bool? enabled;
  final int? maxLength;
  final Function()? onTap;
  final bool? isSmall;
  // ignore: use_key_in_widget_constructors
  const InputText(
      {Key? key,
      this.hint,
      this.rightIcon,
      this.leftIcon,
      this.textEditingController,
      this.password,
      this.changeFous,
      this.focusNode,
      this.textInputType,
      this.errorText,
      this.onChanged,
      this.isSmall,
      this.validator,
      this.enabled,
      this.maxLength,
      this.onTap});

  @override
  _InputTextState createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.isSmall != null && widget.isSmall == true
          ? const EdgeInsets.only(bottom: 9, top: 4)
          : const EdgeInsets.only(bottom: 18, top: 9),
      decoration: const BoxDecoration(),
      child: TextFormField(
        maxLength: widget.maxLength,
        enabled: widget.enabled,
        keyboardType: widget.textInputType,
        focusNode: widget.focusNode,
        onChanged: widget.onChanged,
        onFieldSubmitted: widget.changeFous,
        obscureText: widget.password ?? false,
        controller: widget.textEditingController,
        validator: widget.validator,
        onTap: widget.onTap,
        decoration: InputDecoration(
            labelText: widget.hint,
            errorText: widget.errorText,
            prefixIcon: widget.leftIcon,
            suffixIcon: widget.rightIcon,
            hintText: widget.hint,
            hintStyle: TextStyle(color: Colors.grey[400])),
      ),
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
