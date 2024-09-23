import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:teenage_safety/src/common/const/app_images.dart';
import 'package:teenage_safety/src/common/const/back_arrow.dart';
import 'package:teenage_safety/src/common/const/global_variable.dart';
import 'package:teenage_safety/src/common/widgets/custom_appbar.dart';

class PrivacyPolicyPage extends StatefulWidget {
  const PrivacyPolicyPage({super.key});

  @override
  State<PrivacyPolicyPage> createState() => _PrivacyPolicyPageState();
}

class _PrivacyPolicyPageState extends State<PrivacyPolicyPage> {
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
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Privacy Policy',
                        style: textTheme(context)
                            .bodyLarge!
                            .copyWith(letterSpacing: 0, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: size.height * 0.01,),
                      Container(
                        padding: EdgeInsets.symmetric(vertical:size.height * 0.004,horizontal: size.width * 0.02),
                        // height: size.height * 0.075,
                        decoration: BoxDecoration(
                          border: Border.all(color: colorScheme(context).outline),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Text('''Introduction
We value your privacy and are committed to protecting your personal information. This Privacy Policy outlines how we collect, use, disclose, and safeguard your information when you use our Teenage Safety Car Driving App (the “App”). Please read this policy carefully to understand our practices regarding your personal data.
Information We Collect
Personal Information: When you create an account, we may collect personal information such as your name, email address, phone number, and date of birth.
Location Data: To provide safety features, we may collect real-time location data when the App is in use. This information is essential for monitoring driving behavior and ensuring safety.
Driving Data: We may collect data related to driving patterns, including speed, acceleration, braking, and GPS tracking to help analyze driving performance and provide feedback.
How We Use Your Information
We may use the information we collect for various purposes, including:
To create and manage your account.
To provide real-time safety features and alerts.
To analyze driving behavior and offer personalized feedback.
To communicate with you about updates, promotions, and other relevant information.
To improve our App and enhance user experience.
Information Sharing and Disclosure
We do not sell, trade, or otherwise transfer your personal information to outside parties, except in the following circumstances:
With Your Consent: We may share your information with third parties if you have provided explicit consent.
Service Providers: We may employ third-party companies and individuals to facilitate our App’s services, such as hosting or maintenance, and these parties may have access to your personal information to perform their functions.
Legal Compliance: We may disclose your information if required to do so by law or in response to valid requests by public authorities.
Data Security
We implement reasonable security measures to protect your personal information from unauthorized access, use, or disclosure. However, no method of transmission over the internet or method of electronic storage is completely secure. While we strive to protect your personal information, we cannot guarantee its absolute security.
Children’s Privacy
Our App is designed for teenagers and is not intended for use by children under the age of 13. We do not knowingly collect personal information from children under 13. If we become aware that we have collected such information, we will take steps to delete it.
Your Rights
You have the right to:
Access the personal information we hold about you.
Request corrections to any inaccuracies in your personal information.
Request the deletion of your personal information, subject to our legal obligations.
To exercise these rights, please contact us using the information provided below.
Changes to This Privacy Policy
We may update our Privacy Policy from time to time. We will notify you of any changes by posting the new policy on this page with a new effective date. We encourage you to review this Privacy Policy periodically for any updates.''',
                            style: textTheme(context).labelMedium!.copyWith(letterSpacing: 0),)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

      ),
    );
  }
}