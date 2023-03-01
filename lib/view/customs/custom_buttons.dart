import 'package:flutter/material.dart';
import 'package:re3ya_care/view/customs/sizes.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, this.onPressed, this.txt, this.myWidth})
      : super(key: key);
  final void Function() ?onPressed;
  final String ?txt;
  final double ?myWidth;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        width: width(context) * myWidth!,
        height: height(context) * 0.075,
        child: Center(
          child: Text(
            txt!,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontFamily: "Merriweather"),
          ),
        ),
      ),
    );
  }
}

class CustomClickedButton extends StatelessWidget {
  const CustomClickedButton(
      {Key ?key, this.onPressed, this.txt, this.myWidth, this.color})
      : super(key: key);
  final void Function()? onPressed;
  final String ?txt;
  final double ?myWidth;
  final Color ?color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height(context) * 0.075,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: color),
        width: width(context) * myWidth!,
        child: Center(
          child: Text(
            txt!,
            style: const TextStyle(
                fontSize: 17, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
