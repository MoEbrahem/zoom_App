import 'package:flutter/material.dart';
import 'package:zoom_app/resources/auth_method.dart';
import 'package:zoom_app/utils/colors.dart';
import 'package:zoom_app/widgets/custom_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthMethod authMethod = AuthMethod();
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Start or join a meeting",
            style: TextStyle(
              color: whiteColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 38,
            ),
            child: Image.asset(
              "assets/images/onboarding.jpg",
            ),
          ),
          CustomButton(
            onpressed: () async {
              bool res = await authMethod.signInWithGoogle(context);
              if (res) {
                Navigator.pushNamed(context, "/home");
              }
            },
            text: 'Google Signin',
          ),
        ],
      ),
    );
  }
}
