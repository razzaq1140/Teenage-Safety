import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:teenage_safety/src/common/const/app_images.dart';
import 'package:teenage_safety/src/common/const/global_variable.dart';
import 'package:teenage_safety/src/common/widgets/custom_elevated_button.dart';
import 'package:teenage_safety/src/common/widgets/custom_textformfield.dart';
import 'package:teenage_safety/src/router/routes.dart';

class ForgetCreatePassword extends StatefulWidget {
  const ForgetCreatePassword({super.key});

  @override
  State<ForgetCreatePassword> createState() => _ForgetCreatePasswordState();
}

class _ForgetCreatePasswordState extends State<ForgetCreatePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 22),
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
              const SizedBox(height: 40),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Create Password",
                  style: textTheme(context).headlineSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      color: colorScheme(context).onPrimary),
                ),
              ),
              const SizedBox(height: 15),
              Align(
                alignment: Alignment.centerLeft,
                child: Text.rich(
                  TextSpan(
                    text:
                        "Your password must be at least 6 characters and should include a combination of numbers, letters and special character ",
                    style: textTheme(context).titleMedium?.copyWith(
                          color: colorScheme(context).outline,
                          fontSize: 14,
                        ),
                    children: [
                      TextSpan(
                        text: "(!\$@%))",
                        style: textTheme(context).titleMedium?.copyWith(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const CustomTextFormField(
                hint: "Passowrd",
              ),
              const SizedBox(height: 30),
              const CustomTextFormField(
                hint: "Comfirm Password",
              ),
              const SizedBox(height: 10),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: CustomElevatedButton(
                  width: double.infinity,
                  text: "Continue",
                  onPressed: () {
                    context.pushNamed(AppRoute.namePage);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
