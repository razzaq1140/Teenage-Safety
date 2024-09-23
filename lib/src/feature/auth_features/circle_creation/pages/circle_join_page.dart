import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:teenage_safety/src/common/const/app_images.dart';
import 'package:teenage_safety/src/common/const/global_variable.dart';
import 'package:teenage_safety/src/common/widgets/custom_elevated_button.dart';
import 'package:teenage_safety/src/router/routes.dart';

class CircleJoinPage extends StatefulWidget {
  const CircleJoinPage({super.key});

  @override
  State<CircleJoinPage> createState() => _CircleJoinPageState();
}

class _CircleJoinPageState extends State<CircleJoinPage> {
  TextEditingController pinController = TextEditingController();

  String currentText = '';
  StreamController<ErrorAnimationType>? errorAnimationType;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(AppImages.backgroundOne),
            ),
          ),
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
                "Joining a Circle? Enter your invite code",
                style: textTheme(context).headlineSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: colorScheme(context).onPrimary),
              ),
              const SizedBox(height: 25),
              PinCodeTextField(
                controller: pinController,
                length: 6,
                obscureText: false,
                animationType: AnimationType.fade,
                animationDuration: Duration(milliseconds: 300),
                errorAnimationController: errorAnimationType,
                enableActiveFill: true,
                appContext: context,
                textStyle: TextStyle(color: colorScheme(context).onPrimary),
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(8),
                  fieldHeight: 50,
                  fieldWidth: 50,
                  inactiveColor: Colors.transparent,
                  activeColor: Colors.transparent,
                  activeFillColor: colorScheme(context).primary,
                  inactiveFillColor: colorScheme(context).onPrimary,
                  selectedFillColor: colorScheme(context).onPrimary,
                ),
                onChanged: (value) {
                  setState(() {
                    currentText = value;
                  });
                },
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: CustomElevatedButton(
                  width: double.infinity,
                  text: "Submit",
                  onPressed: () {
                    context.pushNamed(AppRoute.selectRolePage);
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
