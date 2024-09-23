import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:teenage_safety/src/common/const/app_images.dart';
import 'package:teenage_safety/src/common/const/global_variable.dart';
import 'package:teenage_safety/src/common/widgets/custom_elevated_button.dart';
import 'package:teenage_safety/src/common/widgets/custom_textformfield.dart';
import 'package:teenage_safety/src/router/routes.dart';

class PhoneLoginPage extends StatefulWidget {
  const PhoneLoginPage({super.key});

  @override
  State<PhoneLoginPage> createState() => _PhoneLoginPageState();
}

class _PhoneLoginPageState extends State<PhoneLoginPage> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Country? selectedCountry;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 22),
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
              const SizedBox(height: 50),
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Column(
                    children: [
                      const SizedBox(height: 20),
                      CustomTextFormField(
                        controller: phoneController,
                        hint: "653 658 9574",
                        prefixIcon: IconButton(
                          onPressed: () {
                            showCountryPicker(
                              context: context,
                              showPhoneCode: true, // Display country code
                              onSelect: (Country country) {
                                setState(() {
                                  selectedCountry =
                                      country; // Store selected country
                                });
                              },
                            );
                          },
                          icon: selectedCountry != null
                              ? Container(
                                  alignment: Alignment.center,
                                  width: 32,
                                  height: 32,
                                  child: Text(selectedCountry!.flagEmoji),
                                )
                              : const Icon(Icons.flag),
                        ),
                      ),
                      const SizedBox(height: 25),
                      CustomTextFormField(
                        // validationType: ValidationType.password,
                        // autoValidateMode: AutovalidateMode.onUserInteraction,
                        controller: passwordController,
                        hint: "password",
                        isPassword: true,
                        prefixIcon: const Icon(Icons.lock_outlined),
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.remove_red_eye_outlined),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: 5,
                    left: 15,
                    child: Container(
                      decoration: BoxDecoration(
                          color: colorScheme(context).surface,
                          border: Border.all(
                            width: 1,
                            color: colorScheme(context).outline,
                          ),
                          borderRadius: BorderRadius.circular(7)),
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child:
                            Text("Phone", style: textTheme(context).bodySmall),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 75,
                    left: 15,
                    child: Container(
                      decoration: BoxDecoration(
                          color: colorScheme(context).surface,
                          border: Border.all(
                            width: 1,
                            color: colorScheme(context).outline,
                          ),
                          borderRadius: BorderRadius.circular(7)),
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: Text("Password",
                            style: textTheme(context).bodySmall),
                      ),
                    ),
                  )
                ],
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
