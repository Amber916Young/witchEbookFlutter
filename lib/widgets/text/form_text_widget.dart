import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/app_layout.dart';
import '../../utils/app_styles.dart';

class FormTextField extends StatefulWidget {
  final TextEditingController controller;
  final double ? height;
  final double ? width;
  final double ? padding;
  final double ? borderRadius;
  final String ? labelText;
  final String hintText;
  final bool ? enabled;
  final bool obscure;
  final double ? keyNameWidth;
  final TextInputType textInputType;
  final int ? maxLines;
  final int ? minLines;
  final FocusNode? focusNode;
  final Color ? focusColor;
  final Color ? fillColor;
  final bool? isPassword;
  final Function validator;
  final ValueChanged<String>? handleTextValueChange;
  FormTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.obscure = false,
    this.labelText,
    required this.textInputType,
    this.height = 20,
    this.width = 40,
    this.padding = 20,
    this.maxLines = 1,
    this.minLines = 1,
    this.keyNameWidth = 60,
    this.enabled = true,
    this.borderRadius = 10,
    this.focusNode,
    required this.focusColor ,
    required this.fillColor,
    this.isPassword = false,
    this.handleTextValueChange,
    required this.validator,
  }) : super(key: key);

  @override
  _FormTextFieldState createState() => _FormTextFieldState();



}

class _FormTextFieldState extends State<FormTextField> {
  late FocusNode focusNode;
  Color _color = Styles.whiteColor;
  bool _obscureText = true;
  late final  GlobalKey textKey = GlobalKey();

  TextStyle _hintStyle = Styles.headLine4Style.copyWith(
      fontWeight: FontWeight.bold,
      color: Styles.inputColor1);


  @override
  void initState() {
    super.initState();
    focusNode = widget.focusNode ?? FocusNode();
    _obscureText = widget.obscure;
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          _color = Styles.inputColor1;
          _hintStyle = Styles.headLine4Style.copyWith(
              fontWeight: FontWeight.bold,
              color: Styles.whiteColor);
        });
      } else {
        setState(() {
          _color = Styles.whiteColor;
          _hintStyle = Styles.headLine4Style.copyWith(
              fontWeight: FontWeight.bold,
              color: Styles.inputColor1);
        });
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return
      Padding(

        padding: EdgeInsets.symmetric(
            horizontal: Applayout.getHeight(widget.padding!)),
        child:

        TextFormField(
          keyboardType: widget.textInputType,
          enabled: widget.enabled,
          focusNode: focusNode,
          obscureText: _obscureText,
          onTap: (){
            if(widget.controller.selection == TextSelection.fromPosition(TextPosition(offset: widget.controller.text.length -1))){
              setState(() {
                widget.controller.selection = TextSelection.fromPosition(TextPosition(offset: widget.controller.text.length));
              });
            }
          },
          onFieldSubmitted: (value) {
            FocusScope.of(context).nextFocus();
          },
          onChanged :  widget.handleTextValueChange,
          onEditingComplete: () {
            FocusScope.of(context).nextFocus();
          },
          validator: (value) {
            widget.validator(value);
          },
          controller: widget.controller,
          minLines: widget.minLines,
          maxLines: widget.maxLines,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: _hintStyle,

            suffixIcon: widget.isPassword == true ? IconButton(
                icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                }) : focusNode.hasFocus ?   IconButton(
              icon: Icon(Icons.clear_rounded, color: Styles.mainColor3),
              onPressed: () {
                widget.controller.text = "";
                FocusManager.instance.primaryFocus?.unfocus();
                widget.controller.clear();
              },): null
            ,
            contentPadding: EdgeInsets.symmetric(
                horizontal: Applayout.getWidth(20),
                vertical: Applayout.getHeight(20)),
            filled: true,
            fillColor: _color,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                  Radius.circular(Applayout.getHeight(widget.borderRadius!))),
              borderSide: BorderSide(
                color: Styles.mainColor3,
              ),
            ),

            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                  Radius.circular(Applayout.getHeight(10))),
            ),

            focusedBorder:
            OutlineInputBorder(
              borderRadius: BorderRadius.all(
                  Radius.circular(Applayout.getHeight(widget.borderRadius!))),
              borderSide: BorderSide(
                color: Styles.inputColor1,
              ),
            ),
          ),
        ),
      );
  }
}