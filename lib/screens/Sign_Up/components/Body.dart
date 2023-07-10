import 'package:flutter/material.dart';
import 'Sign_up_Form.dart';
import '../../Sign_in/Sign_in_Screen.dart';
import '../../../core/Dont_or_Have_acc.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SigUpForm(),
              const SizedBox(
                height: 10,
              ),
              DontorHaveAcc(
                onpress: () {
                  Navigator.of(context)
                      .pushReplacementNamed(SignInScreen.routeName);
                },
                text: 'already have account ?',
                text2: 'Sign in here',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
