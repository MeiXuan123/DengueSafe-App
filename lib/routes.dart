/**
 * This sets up the routes for login 
 * 
 * @author: Tricia Tan
 */
import 'package:flutter/widgets.dart';
import 'package:flutter_app/screens/Admin_login/admin_login.dart';
import 'package:flutter_app/screens/login_success/login_success_screen.dart';
import 'package:flutter_app/screens/sign_in/sign_in_screen.dart';
import 'package:flutter_app/screens/splash/splash_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  AdminLoginScreen.routeName: (context) => AdminLoginScreen(),
  //HomeScreen.routeName: (context) => HomeScreen()
};
