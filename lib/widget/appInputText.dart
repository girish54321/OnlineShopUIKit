import 'package:flutter/material.dart';

class InputText extends StatefulWidget {
  final String hint;
  final Widget rightIcon;
  final Widget leftIcon;
  final TextEditingController textEditingController;
  final bool password;
  final Function changeFous;
  final FocusNode focusNode;
  final TextInputType textInputType;
  final String errorText;
  final Function onChnaged;
  final FormFieldValidator validator;

  const InputText(
      {Key key,
      this.hint,
      this.rightIcon,
      this.leftIcon,
      this.textEditingController,
      this.password,
      this.changeFous,
      this.focusNode,
      this.textInputType,
      this.errorText,
      this.onChnaged,
      this.validator});

  @override
  _InputTextState createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 18, top: 9),
      decoration: BoxDecoration(),
      child: TextFormField(
        keyboardType: widget.textInputType,
        focusNode: widget.focusNode,
        onChanged: widget.onChnaged,
        onFieldSubmitted: widget.changeFous,
        obscureText: widget.password,
        controller: widget.textEditingController,
        validator: widget.validator,
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
