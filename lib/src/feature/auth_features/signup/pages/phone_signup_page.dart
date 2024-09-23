import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:teenage_safety/src/common/const/app_images.dart';
import 'package:teenage_safety/src/common/const/global_variable.dart';
import 'package:teenage_safety/src/common/widgets/custom_elevated_button.dart';
import 'package:teenage_safety/src/common/widgets/custom_textformfield.dart';
import 'package:teenage_safety/src/router/routes.dart';

class PhoneSignupPage extends StatefulWidget {
  const PhoneSignupPage({super.key});

  @override
  State<PhoneSignupPage> createState() => _PhoneSignupPageState();
}

class _PhoneSignupPageState extends State<PhoneSignupPage> {
  Country? selectedCountry;
  TextEditingController phoneController = TextEditingController();

  @override
  void dispose() {
    // Dispose of the controllers when the widget is removed from the tree
    phoneController.dispose();
    super.dispose();
  }

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
              const SizedBox(height: 80),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Enter Phone Number",
                  style: textTheme(context).headlineSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      color: colorScheme(context).onPrimary),
                ),
              ),
              const SizedBox(height: 25),
              Text(
                "Please enter your valid phone number. We will send you a 4-digit code to verify your account. ",
                style: textTheme(context)
                    .titleSmall
                    ?.copyWith(color: colorScheme(context).outline),
              ),
              const SizedBox(height: 30),
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
                          selectedCountry = country; // Store selected country
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
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: CustomElevatedButton(
                  width: double.infinity,
                  text: "Continue",
                  onPressed: () {
                    context.pushNamed(AppRoute.verifyCodePage);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
