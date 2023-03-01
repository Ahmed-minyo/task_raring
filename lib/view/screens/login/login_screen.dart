// import 'package:flutter/material.dart';
// import 'package:re3ya_care/view_models/login_view_model/google_sign_in_provider.dart';
// import 'package:provider/provider.dart';
// import '../../../view_models/login_view_model/auth_login_view_model.dart';
// import '../../customs/colors.dart';
// import '../../customs/constants.dart';
// import '../../customs/custom_buttons.dart';
// import '../../customs/signing_method.dart';
// import '../../customs/sizes.dart';
//
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});
//
//   @override
//   LoginScreenState createState() {
//     return LoginScreenState();
//   }
// }
//
// class LoginScreenState extends State<LoginScreen> {
//   final _formKey = GlobalKey<FormState>();
//   bool showPassword = false;
//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<Auth>(context);
//     return Scaffold(
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: width(context) * 0.05),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               TextFormField(
//                   controller: provider.phoneController,
//                   validator: (value) {
//                     if (value == null ||
//                         value.isEmpty ||
//                         !RegExp(validationEmail).hasMatch(value)) {
//                       return 'Please enter a valid email';
//                     }
//                     return null;
//                   },
//                   decoration: InputDecoration(
//                     labelText: "Email",
//                     labelStyle: TextStyle(color: AppColors.secondaryColor),
//                   )
//               ),
//               SizedBox(
//                 height: height(context) * 0.05,
//               ),
//               TextFormField(
//                   controller: provider.passwordController,
//                   obscureText: !showPassword,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter password';
//                     }
//                     return null;
//                   },
//                   decoration: InputDecoration(
//                     labelText: "Password",
//                     labelStyle: TextStyle(color: AppColors.secondaryColor),
//                     suffixIcon: InkWell(
//                       onTap: () {
//                         setState(() {
//                           showPassword = !showPassword;
//                         });
//                       },
//                       child: Icon(
//                         !showPassword
//                             ? Icons.visibility_off
//                             : Icons.remove_red_eye,
//                       ),
//                     ),
//                   )
//               ),
//               SizedBox(
//                 height: height(context) * 0.03,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SigningMethod(
//                     child: Image.asset(
//                       "assets/images/google.png",
//                       width: width(context) * 0.07,
//                       height: width(context) * 0.07,
//                       fit: BoxFit.fill,
//                     ),
//                     onTap: () {
//                       Provider.of<GoogleSignInProvider>(context, listen: false)
//                           .googleSinUpApp();
//                     },
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: height(context) * 0.05,
//               ),
//               Center(
//                 child: CustomClickedButton(
//                   txt: 'Login',
//                   myWidth: 0.7,
//                   color: AppColors.secondaryColor,
//                   onPressed: () {
//                     provider.authData(_formKey);
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:re3ya_care/view_models/login_view_model/google_sign_in_provider.dart';
import 'package:provider/provider.dart';
import '../../../view_models/login_view_model/auth_login_view_model.dart';
import '../../../view_models/login_view_model/encrypt_password.dart';
import '../../customs/colors.dart';
import '../../customs/constants.dart';
import '../../customs/custom_buttons.dart';
import '../../customs/signing_method.dart';
import '../../customs/sizes.dart';


class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Auth>(context);
    final showPass = Provider.of<EncryptPassword>(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width(context) * 0.05),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                  controller: provider.phoneController,
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !RegExp(validationEmail).hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(color: AppColors.secondaryColor),
                  )),
              SizedBox(
                height: height(context) * 0.05,
              ),
              TextFormField(
                  controller: provider.passwordController,
                  obscureText: !showPass.showPass,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter password';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: TextStyle(color: AppColors.secondaryColor),
                    suffixIcon: InkWell(
                      onTap: ()=> showPass.changePassword(),
                      child: Icon(
                        showPass.showPass
                            ? Icons.remove_red_eye
                            : Icons.visibility_off,
                      ),
                    ),
                  )),
              SizedBox(
                height: height(context) * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SigningMethod(
                    child: Image.asset(
                      "assets/images/google.png",
                      width: width(context) * 0.07,
                      height: width(context) * 0.07,
                      fit: BoxFit.fill,
                    ),
                    onTap: () {
                      Provider.of<GoogleSignInProvider>(context, listen: false)
                          .googleSinUpApp();
                    },
                  ),
                ],
              ),
              SizedBox(
                height: height(context) * 0.05,
              ),
              Center(
                child: CustomClickedButton(
                  txt: 'Login',
                  myWidth: 0.7,
                  color: AppColors.secondaryColor,
                  onPressed: () {
                    provider.authData(_formKey);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
