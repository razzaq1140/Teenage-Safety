import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:teenage_safety/src/common/const/app_images.dart';
import 'package:teenage_safety/src/common/const/global_variable.dart';
import 'package:teenage_safety/src/common/widgets/custom_elevated_button.dart';
import 'package:teenage_safety/src/router/routes.dart';

class FamilyCodePage extends StatefulWidget {
  const FamilyCodePage({super.key});

  @override
  State<FamilyCodePage> createState() => _FamilyCodePageState();
}

class _FamilyCodePageState extends State<FamilyCodePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 22),
        width: double.infinity,
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
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  textAlign: TextAlign.center,
                  "Describe your role in Circle.",
                  style: textTheme(context).headlineSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      color: colorScheme(context).onPrimary),
                ),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Text.rich(
                  TextSpan(
                    text: "You can share this code any way you like:\n",
                    style: textTheme(context).titleMedium?.copyWith(
                          color: colorScheme(context).outline,
                          fontSize: 14,
                        ),
                    children: [
                      TextSpan(
                        text: " text it, email it, write it down, or say it.",
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
              Container(
                height: 100,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: colorScheme(context).surface,
                    borderRadius: BorderRadius.circular(8)),
                child: Text(
                  "U-L-J-H-K-G",
                  style: textTheme(context).displaySmall!.copyWith(
                      fontWeight: FontWeight.w900,
                      color: colorScheme(context).primary),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: CustomElevatedButton(
                  width: double.infinity,
                  text: "Share Code",
                  onPressed: () {},
                ),
              ),
              const SizedBox(height: 50),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'I’m done sharing. ',
                  style: textTheme(context).titleSmall?.copyWith(
                      color: colorScheme(context).onPrimary,
                      fontWeight: FontWeight.w500),
                  children: [
                    TextSpan(
                      text: 'Skip',
                      style: TextStyle(color: colorScheme(context).primary),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          context.pushNamed(AppRoute.addPhotoPage);
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
