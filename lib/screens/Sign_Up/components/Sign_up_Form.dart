import 'package:flutter/material.dart';
import 'package:todolist/screens/Sign_in/Sign_in_Screen.dart';
import '../../../core/decoration_constants.dart';
import '../../../widgets/custom_Suffix_Icon.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SigUpForm extends StatefulWidget {
  @override
  State<SigUpForm> createState() => _SigUpFormState();
}

class _SigUpFormState extends State<SigUpForm> {
  final _globalKey = GlobalKey<FormState>();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? email;
  String? password;
  String? fullname;
  void _submitForm() async {
    if (_globalKey.currentState!.validate()) {
      _globalKey.currentState!.save();
      await _auth
          .createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      )
          .then((user) {
        Navigator.of(context).pushNamed(SignInScreen.routeName);
      });
    }
  }

  var isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _globalKey,
      child: Column(
        children: [
          buildUserName(),
          const SizedBox(
            height: 15,
          ),
          buildEmail(),
          const SizedBox(
            height: 15,
          ),
          buildPassword(),
          const SizedBox(
            height: 15,
          ),
          buildSignUpButton(),
        ],
      ),
    );
  }

  Widget buildEmail() {
    return TextFormField(
      onChanged: (value) {
        email = value;
      },
      cursorColor: const Color(0xFF00b4d8),
      decoration: defaultInputDecoration.copyWith(
        hintText: 'Enter your email',
        hintStyle: const TextStyle(
          color: Color(0xFF00b4d8),
        ),
        prefixIcon: CustomSuffixIcon(svgicon: 'assets/icons/Mail.svg'),
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Email is required';
        }
        return null;
      },
    );
  }

  Widget buildUserName() {
    return TextFormField(
      onChanged: (value) {
        fullname = value;
      },
      cursorColor: const Color(0xFF00b4d8),
      decoration: defaultInputDecoration.copyWith(
        hintText: 'Enter your full name',
        hintStyle: const TextStyle(color: Color(0xFF00b4d8)),
        prefixIcon: CustomSuffixIcon(svgicon: 'assets/icons/User.svg'),
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Email is required';
        }
        return null;
      },
    );
  }

  Widget buildPassword() {
    return TextFormField(
        onChanged: (value) {
          password = value;
        },
        obscureText: isVisible,
        cursorColor: const Color(0xFF00b4d8),
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
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Password is required';
          } else if (value.length < 6) {
            return 'Password should be at least 6 characters';
          }
          return null;
        });
  }

  Widget buildSignUpButton() {
    return ElevatedButton(
      onPressed: _submitForm,
      child: const Text('signUp'),
    );
  }
}
