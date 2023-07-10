import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todolist/screens/tabs_screen.dart';
import '../../../core/decoration_constants.dart';
import '../../../widgets/custom_Suffix_Icon.dart';
import '../../../services/UserToken.dart';
import '../../../core/Dont_or_Have_acc.dart';
import '../../Sign_Up/Sign_up_Screen.dart';

class SiginForm extends StatefulWidget {
  @override
  State<SiginForm> createState() => _SiginFormState();
}

class _SiginFormState extends State<SiginForm> {
  final _globalKey = GlobalKey<FormState>();
  var isVisible = true;
  String? email;
  String? password;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _globalKey,
      child: Column(
        children: [
          buildEmail(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          buildPassword(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          buildLoginButton(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
        ],
      ),
    );
  }

  TextFormField buildEmail() {
    return TextFormField(
      onChanged: (value) {
        email = value;
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Email is required';
        }
        return null;
      },
      cursorColor: const Color(0xFF00b4d8),
      decoration: defaultInputDecoration.copyWith(
        hintText: 'Enter your email',
        hintStyle: const TextStyle(color: Color(0xFF00b4d8)),
        prefixIcon: CustomSuffixIcon(svgicon: 'assets/icons/Mail.svg'),
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }

  TextFormField buildPassword() {
    return TextFormField(
      onChanged: (value) {
        password = value;
      },
      validator: (value) {
        (value) {
          if (value == null || value.isEmpty) {
            return 'Password is required';
          } else if (value.length < 6) {
            return 'Password should be at least 6 characters';
          }
          return null;
        };
      },
      cursorColor: const Color(0xFF00b4d8),
      obscureText: isVisible,
      decoration: defaultInputDecoration.copyWith(
        hintText: 'Enter your password',
        hintStyle: const TextStyle(color: Color(0xFF00b4d8)),
        prefixIcon: CustomSuffixIcon(svgicon: 'assets/icons/Lock.svg'),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              isVisible = !isVisible;
            });
          },
          icon: Icon(isVisible ? Icons.visibility_off : Icons.visibility),
          color: const Color(0xFF00b4d8),
        ),
      ),
    );
  }

  Widget buildLoginButton() {
    return ElevatedButton(
      child: Text("login"),
      onPressed: () => _submitForm,
      style: ElevatedButton.styleFrom(
        primary: Colors.red,
        minimumSize: Size(MediaQuery.of(context).size.width, 40),
        elevation: 0,
        onPrimary: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
      ),
    );
  }

  void _submitForm() async {
    if (_globalKey.currentState!.validate()) {
      _globalKey.currentState!.save();
      final user = await _auth.signInWithEmailAndPassword(
        email: email!,
        password: password!,
      );

      await Authorization.setToken(user.user!.email);
      print('the Token of the User is >>>>>>>>>>>>>${user.user!.uid}');

      Navigator.of(context).pushReplacementNamed(TabsScreen.RouteName);
    }
  }
}
