import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:teenage_safety/src/common/const/app_images.dart';
import 'package:teenage_safety/src/common/const/back_arrow.dart';
import 'package:teenage_safety/src/common/const/global_variable.dart';
import 'package:teenage_safety/src/common/widgets/custom_appbar.dart';

class HelpArticlePage extends StatefulWidget {
  const HelpArticlePage({super.key});

  @override
  State<HelpArticlePage> createState() => _HelpArticlePageState();
}

class _HelpArticlePageState extends State<HelpArticlePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: double.infinity,
        padding: const EdgeInsets.all(16.0),
        width: double.infinity,
        decoration:  BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.bdImage,),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.03),
              CustomBackButton(onTap: (){
                context.pop();
              }),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                height: size.height * 0.83,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Help Article',
                      style: textTheme(context)
                          .bodyLarge!
                          .copyWith(letterSpacing: 0, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: size.height * 0.01,),
                    Container(
                      padding: EdgeInsets.symmetric(vertical:size.height * 0.01,horizontal: size.width * 0.03),
                      height: size.height * 0.7,
                      decoration: BoxDecoration(
                        border: Border.all(color: colorScheme(context).outline),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                          children: [
                            Text('''Welcome to the Teenage Safety Driving App! This guide will help you navigate the app’s features for a safer driving experience.
Creating an Account: Start by downloading the app and signing up with your email and basic information. Make sure to provide accurate details for effective monitoring.
Location Services: Enable location services for real-time tracking. This feature ensures safety alerts can be sent to guardians if needed.
Driving Behavior Monitoring: The app tracks metrics like speed and braking. Review your driving reports regularly to identify areas for improvement.
Alerts and Notifications: Customize alert settings to receive notifications about speeding or unsafe driving habits. This keeps you informed and encourages safe practices.
Support: If you encounter any issues, visit the “Help” section in the app or contact our support team via email for assistance.
Remember, the goal of the app is to promote safe driving habits and enhance your confidence behind the wheel. Happy driving!''',
                        style: textTheme(context).labelMedium!.copyWith(letterSpacing: 0),)
                            ,])
                    )
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