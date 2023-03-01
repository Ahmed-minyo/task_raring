import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../view_models/login_view_model/auth_login_view_model.dart';
import '../../../view_models/login_view_model/google_sign_in_provider.dart';
import '../../customs/colors.dart';
import '../../customs/custom_buttons.dart';
import '../../customs/sizes.dart';
import 'customs/image.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width(context) * 0.05),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: height(context)*0.2,),
              ZLogo(),
              SizedBox(
                height: height(context) * 0.1,
              ),
              Text("Name Is  :  " +
                  Provider.of<GoogleSignInProvider>(context).name +
                  Provider.of<Auth>(context).phoneController.text),
              SizedBox(
                height: height(context) * 0.02,
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: height(context) * 0.07,
              ),
              CustomClickedButton(
                onPressed: () {
                  Provider.of<Auth>(context, listen: false)
                      .phoneController
                      .clear();
                  Provider.of<Auth>(context, listen: false)
                      .passwordController
                      .clear();

                  Provider.of<GoogleSignInProvider>(context, listen: false)
                      .signOutFromApp();
                },
                txt: 'LogOut',
                myWidth: 0.7,
                color: AppColors.secondaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
