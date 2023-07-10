import 'package:flutter/material.dart';
import 'Sign_in_Form.dart';
import '../../Sign_Up/Sign_up_Screen.dart';
import '../../../core/Dont_or_Have_acc.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SiginForm(),
              const SizedBox(
                height: 10,
              ),
              DontorHaveAcc(
                onpress: () {
                  Navigator.of(context)
                      .pushReplacementNamed(SignUpScreen.RouteName);
                },
                text: 'Dont have account ?',
                text2: 'Sign up here',
              ),
              const SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
