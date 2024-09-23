import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'dart:async'; // Add this for Timer
import 'package:teenage_safety/src/common/const/app_images.dart';
import 'package:teenage_safety/src/common/const/global_variable.dart';
import 'package:teenage_safety/src/common/widgets/custom_elevated_button.dart';
import 'package:teenage_safety/src/router/routes.dart';

class VerifyCodePage extends StatefulWidget {
  const VerifyCodePage({super.key});

  @override
  State<VerifyCodePage> createState() => _VerifyCodePageState();
}

class _VerifyCodePageState extends State<VerifyCodePage> {
  TextEditingController pinController = TextEditingController();
  Timer? countdownTimer;
  int remainingTime = 30;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    pinController.dispose();
    countdownTimer?.cancel();
    super.dispose();
  }

  void startTimer() {
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingTime > 0) {
        setState(() {
          remainingTime--;
        });
      } else {
        countdownTimer?.cancel();
      }
    });
  }

  String currentText = '';
  StreamController<ErrorAnimationType>? errorAnimationType;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 22),
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
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Enter Verification Code",
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
                    text: "We have sent a code to your number\n",
                    style: textTheme(context).titleMedium?.copyWith(
                          color: colorScheme(context).outline,
                          fontSize: 16,
                        ),
                    children: [
                      TextSpan(
                        text: "(854) 858-1550",
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
              PinCodeTextField(
                controller: pinController ,
                length: 4,
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
                  fieldHeight: 60,
                  fieldWidth: 60,
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
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: Text.rich(
                  TextSpan(
                    text: "Resend it in ",
                    style: textTheme(context).titleSmall?.copyWith(
                          color: colorScheme(context).surface,
                        ),
                    children: [
                      TextSpan(
                        text: "00:${remainingTime.toString().padLeft(2, '0')}s",
                        style: textTheme(context)
                            .titleSmall
                            ?.copyWith(color: colorScheme(context).primary),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: CustomElevatedButton(
                  width: double.infinity,
                  text: "Continue",
                  onPressed: () {
                    context.pushNamed(AppRoute.createPassword);
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
