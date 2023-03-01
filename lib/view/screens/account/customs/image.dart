import 'package:flutter/material.dart';
import '../../../../view_models/login_view_model/google_sign_in_provider.dart';
import '../../../customs/sizes.dart';
import 'package:provider/provider.dart';

class ZLogo extends StatelessWidget {
  const ZLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Provider.of<GoogleSignInProvider>(context).photo == ""
          ? SizedBox()
          : Image.network(
              Provider.of<GoogleSignInProvider>(context).photo ??
                  "https://media.gettyimages.com/photos/closeup-smiling-male-leader-wearing-eyeglasses-picture-id1179627340?s=2048x2048",
              width: width(context) * 0.6,
              height: height(context) * 0.1,
            ),
    );
  }
}
