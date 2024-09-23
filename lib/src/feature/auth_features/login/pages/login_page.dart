import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teenage_safety/src/common/const/app_images.dart';
import 'package:teenage_safety/src/common/const/global_variable.dart';
import 'package:teenage_safety/src/common/widgets/custom_elevated_button.dart';
import 'package:teenage_safety/src/router/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(AppImages.backgroundOne),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 100),
              SizedBox(
                height: 120,
                width: 250,
                child: SvgPicture.asset(
                  AppIcons.logo,
                  width: 30,
                  height: 30,
                ),
              ),
              const SizedBox(height: 50),
              Text(
                "Sign in to Continue",
                style: textTheme(context).headlineSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: colorScheme(context).onPrimary),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: CustomElevatedButton(
                  text: "Continue with email",
                  onPressed: () {
                    context.pushNamed(AppRoute.emailLoginPage);
                  },
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: double.infinity,
                child: CustomElevatedButton(
                  buttonColor: colorScheme(context).surface,
                  textStyle: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  text: "Continue with phone number",
                  onPressed: () {
                    context.pushNamed(AppRoute.phoneLoginPage);
                  },
                ),
              ),
              const SizedBox(height: 15),
              Text(
                "-------Or Sign In with-------",
                style: textTheme(context).titleSmall?.copyWith(
                    color: colorScheme(context).surface,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomElevatedButton(
                    iconColor: Colors.red[600],
                    icon: FontAwesomeIcons.google,
                    buttonColor: colorScheme(context).surface,
                    textStyle: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    text: "Google",
                    onPressed: () {},
                  ),
                  const SizedBox(width: 7),
                  CustomElevatedButton(
                    icon: FontAwesomeIcons.facebook,
                    iconColor: Colors.blue[800],
                    buttonColor: colorScheme(context).surface,
                    textStyle: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    text: "Facebook",
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 30),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Don’t have an account? ',
                  style: textTheme(context).titleSmall?.copyWith(
                      color: colorScheme(context).onPrimary,
                      fontWeight: FontWeight.w600),
                  children: [
                    TextSpan(
                      text: 'Sign Up',
                      style: TextStyle(color: colorScheme(context).primary),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          context.pushNamed(AppRoute.signupPage);
                        },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'By signing in you are agreeing our\n',
                  style: textTheme(context).titleSmall?.copyWith(
                      color: colorScheme(context).onPrimary,
                      fontWeight: FontWeight.w600),
                  children: [
                    TextSpan(
                      text: 'Term and privacy policy',
                      style: TextStyle(color: colorScheme(context).primary),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // context.pushNamed(AppRoute.signUp);
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
