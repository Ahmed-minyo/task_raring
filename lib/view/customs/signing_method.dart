import 'package:flutter/material.dart';

class SigningMethod extends StatelessWidget {
  final void Function() ?onTap;
  final Widget ?child;

  const SigningMethod({Key ?key, this.onTap, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: InkWell(
        onTap: onTap,
        child: child,
      ),
      padding: const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black87), shape: BoxShape.circle),
    );
  }
}
