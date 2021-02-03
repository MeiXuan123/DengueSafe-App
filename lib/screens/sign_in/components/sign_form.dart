/**
 * This is for Admin User login, prompting user to enter email and password
 * 
 * @author: Tricia Tan
 */
import 'package:flutter/material.dart';
import 'package:flutter_app/components/custom_surfix_icon.dart';
import 'package:flutter_app/components/form_error.dart';
import 'package:flutter_app/screens/login_success/login_success_screen.dart';
import '../../../components/default_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/reportcases.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginFormUI extends StatefulWidget {
  @override
  _showLoginUI createState() => new _showLoginUI();
}

class _showLoginUI extends State<LoginFormUI> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool remember = false;
  bool isError = false;
  bool isButtonPressed = false;
  bool _success;
  String _userEmail;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: 'Email'),
            validator: (String value) {
              if (value.isEmpty || !value.contains('@')) {
                return 'Please enter valid email.';
              }
              else if (value!='admin@ntu.edu.sg'){
                return 'Invalid Email. Please Try Again.';
              }
              return null;
            },
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          TextFormField(
            obscureText: true,
            controller: _passwordController,
            decoration: const InputDecoration(labelText: 'Password'),
            validator: (String value) {
              if (value.isEmpty) {
                return 'Please enter password.';
              }
              else if (value!='ntuadmin123'){
                return 'Invalid Password. Please Try Again.';
              }
              return null;
            },
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          SizedBox(height: getProportionateScreenHeight(20)),
          SizedBox(
            width: SizeConfig.screenWidth * 0.4,
            height: SizeConfig.screenHeight * 0.07,
            child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    _signInWithEmailAndPassword();
                  }
                },
                child: Text(
                  'Login',
                  style: GoogleFonts.openSans(
                    textStyle: Theme.of(context).textTheme.display1,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                )),
          ),
        ],
      ),
    );
  }

  void _signInWithEmailAndPassword() async {
    final FirebaseUser user =
        (await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    ))
            .user;

    if (user == null) {
      setState(() {
        _success = false;
      });
    } else {
      setState(() {
        _success = true;
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ReportUI()));
      });
    }
  }
  /*TextFormField getEnteredEmail() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,

      onSaved: (newValue) => _email = newValue,
      validator: (newValue) {
        if (newValue.isEmpty || !newValue.contains('@')) {
          return "Please enter valid email.";
        } else if (newValue != _email) {
          addError(error: kInvalidEmailError);
        }
        return null;
      },
      onChanged: (newValue) {
      if (newValue.isNotEmpty) {
        removeError(error: kEmailNullError);
      } else if (newValue == _email) {
        removeError(error: kInvalidEmailError);
      }
      return null;
    },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }*/

  /*TextFormField getEnteredPassword() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => _password = newValue,
      onChanged: (newValue) {
        if (newValue.isNotEmpty) {
          print("1:"+errors.toString());
          print(newValue.toString());
          removeError(error: kPassNullError);
        } else if (newValue == _password) {
          print("2:"+errors.toString());
          print(newValue.toString());
          removeError(error: kShortPassError);
        }
        return null;
      },
      validator: (newValue) {
        if (newValue.isEmpty) {
          print("3:"+errors.toString());
          print(newValue.toString());
          addError(error: kPassNullError);
        } else if (newValue != _password) {
          print("4:"+errors.toString());
          print(newValue.toString());
          print(_password);
          addError(error: kShortPassError);
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );*/
}
