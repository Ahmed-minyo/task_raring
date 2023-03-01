import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:re3ya_care/view_models/home_view_model.dart';
import 'package:re3ya_care/view_models/login_view_model/auth_login_view_model.dart';
import 'package:re3ya_care/view_models/login_view_model/encrypt_password.dart';
import 'package:re3ya_care/view_models/login_view_model/google_sign_in_provider.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(
    create: (context) => GoogleSignInProvider(),
  ),
  ChangeNotifierProvider(
    create: (context) => Auth(),
  ),
  ChangeNotifierProvider(
    create: (context) => Home(),
  ), ChangeNotifierProvider(
    create: (context) => EncryptPassword(),
  ),
];
