import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:teenage_safety/src/common/const/app_images.dart';
import 'package:teenage_safety/src/common/const/global_variable.dart';
import 'package:teenage_safety/src/common/widgets/custom_elevated_button.dart';
import 'package:teenage_safety/src/common/widgets/custom_textformfield.dart';
import 'package:teenage_safety/src/router/routes.dart';

class EmailLoginPage extends StatefulWidget {
  const EmailLoginPage({super.key});

  @override
  State<EmailLoginPage> createState() => _EmailLoginPageState();
}

class _EmailLoginPageState extends State<EmailLoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    // Dispose of the controllers when the widget is removed from the tree
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
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
              CustomTextFormField(
                // validationType: ValidationType.email,
                // autoValidateMode: AutovalidateMode.onUserInteraction,
                controller: emailController,
                hint: "email",
                prefixIcon: Icon(Icons.mail_outline_rounded),
              ),
              const SizedBox(height: 25),
              CustomTextFormField(
                controller: passwordController,
                hint: "password",
                isPassword: true,
                prefixIcon: const Icon(Icons.lock_outlined),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.remove_red_eye_outlined),
                ),
              ),
              TextButton(
                onPressed: () {
                  context.pushNamed(AppRoute.forgotPasswordpage);
                },
                child: Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    "Forgot Your Password?",
                    style: textTheme(context).bodySmall?.copyWith(
                        color: colorScheme(context).onPrimary,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: CustomElevatedButton(
                  text: "Login",
                  onPressed: () {
                    context.pushNamed(AppRoute.bottomNavBar);
                  },
                ),
              ),
              const SizedBox(height: 30),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.fingerprint,
                  color: colorScheme(context).onPrimary,
                  size: 50,
                ),
              ),
              Text(
                "Scan",
                style: textTheme(context).bodyMedium?.copyWith(
                    color: colorScheme(context).surface,
                    fontWeight: FontWeight.w700),
              )
            ],
          ),
        ),
      ),
    );
  }
}
