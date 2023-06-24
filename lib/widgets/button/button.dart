import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/app_layout.dart';
import '../../utils/app_styles.dart';

class CustomButton extends StatefulWidget {
  final void Function() onPressed;
  final bool?  isRequest;
  final String title;
  final double ? minWidth;
  final double ? minHeight;
  final double ? maxWidth;
  final double ? maxHeight;
  final double ? borderRadius;
  final Color ? foregroundColor;
  final Color ? backgroundColor;
  final IconData? iconData;
  final bool? isShowIcon;
  final bool? isShowText;

  const CustomButton({
  super.key,
  required this.onPressed,
  required this.title,
  this.minWidth,
  this.maxWidth ,
  this.minHeight,
  this.maxHeight,
  this.foregroundColor,
  this.backgroundColor,
  this.iconData,
  this.isShowIcon = false,
  this.isShowText = false,
  this.isRequest = true,
  this.borderRadius = 10,
  });


  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  late final double _minWidth;
  late final double _minHeight;
  late final double _maxWidth;
  late final double _maxHeight;
  late final Color _backgroundColor;
  late final Color _foregroundColor;
  static int clickSpaceTime = 1500;
  bool bCanPress = true;

  @override
  void initState() {
    _minWidth = widget.minWidth ?? 100;
    _minHeight = widget.minHeight ?? 50;
    _maxWidth = widget.maxWidth ?? 300;
    _maxHeight = widget.maxHeight ?? 100;
    _foregroundColor = widget.foregroundColor ?? Styles.whiteColor;
    _backgroundColor = widget.backgroundColor ?? Styles.mainColor1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
      ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(_minWidth, _minHeight),
            maximumSize: Size(_maxWidth, _maxHeight),
            foregroundColor: _foregroundColor,
            backgroundColor: _backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(Applayout.getHeight(widget.borderRadius!)),
              ),
            ),
          ),
          onPressed: () {
            if (widget.isRequest == true) {
              if (bCanPress) {
                bCanPress = false;
                widget.onPressed();
                FocusManager.instance.primaryFocus?.unfocus();
                Future.delayed(Duration(milliseconds: clickSpaceTime), () {
                  bCanPress = true;
                });
              } else {
                // ToastUtil.showAlertNotify(Styles.clickFastError);
              }
            } else {
              widget.onPressed();
            }
          },
          child: widget.isShowIcon == true && widget.isShowText == true ?
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [   Icon(widget.iconData),
              Text(widget.title, textAlign: TextAlign.center,),
            ],
          ) :

          widget.isShowIcon == false ?
          Text(widget.title, textAlign: TextAlign.center,) :
          Icon(widget.iconData)
      );
  }
}