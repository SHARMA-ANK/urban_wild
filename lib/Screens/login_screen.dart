import 'package:flutter/material.dart';
import 'package:urban_wild/resources/auth_method.dart';
import 'package:urban_wild/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthMethods _authMethods=AuthMethods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Urban Wild",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              fontFamily: 'More Sugar'
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Image.asset('assets/images/Urban_Wild_Logo.png'),
          ),
          CustomButton(
            text: "Google Sign In",
            onpressed: () async {
              bool res=await _authMethods.signInWithGoogle(context);
              if(res){
                Navigator.pushNamed(context,"/splash");
              }
            },
          )
        ],
      ),
    );
  }
}
