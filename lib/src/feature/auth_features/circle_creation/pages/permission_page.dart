import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:teenage_safety/src/common/const/app_images.dart';
import 'package:teenage_safety/src/common/const/global_variable.dart';
import 'package:teenage_safety/src/common/widgets/custom_elevated_button.dart';
import 'package:teenage_safety/src/router/routes.dart';

class PermissionRequestPage extends StatefulWidget {
  const PermissionRequestPage({super.key});

  @override
  State<PermissionRequestPage> createState() => _PermissionRequestPageState();
}

class _PermissionRequestPageState extends State<PermissionRequestPage> {
  bool isLocationEnable = false;
  bool isActivityEnable = false;

  Future<void> _toggleLocationPermission() async {
    PermissionStatus status = await Permission.location.status;

    if (status.isGranted) {
      setState(() {
        isLocationEnable = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: colorScheme(context).error,
          content: Text(
            "Location permission disabled. Please disable it manually from settings if required.",
          ),
        ),
      );
    } else {
      PermissionStatus newStatus = await Permission.location.request();
      if (newStatus.isGranted) {
        setState(() {
          isLocationEnable = true;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Location permission enabled")),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Location permission denied")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 22),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.backgroundOne),
            fit: BoxFit.cover,
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
                  "Permissions required",
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      color: Theme.of(context).colorScheme.onPrimary),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            "Location",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                ),
                          ),
                        ),
                        CustomElevatedButton(
                          height: 38,
                          borderRadius: 7,
                          text: isLocationEnable ? "Disable" : "Enable",
                          onPressed: _toggleLocationPermission,
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Location data is used to enable the in-app map, Place Alerts, and location sharing with your circle.",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            "Physical Activity",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                ),
                          ),
                        ),
                        CustomElevatedButton(
                          height: 38,
                          borderRadius: 7,
                          text: isActivityEnable ? "Disable" : "Enable",
                          onPressed: () {
                            setState(() {
                              isActivityEnable = !isActivityEnable;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Monitor car travel, driver safety, and crash detection.",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text:
                      'In addition to the above, your data will be used in accordance with our ',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.outline,
                      fontWeight: FontWeight.w700),
                  children: [
                    TextSpan(
                      text: 'Privacy Policy ',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                    TextSpan(
                      text:
                          'and your preferences, which may include sharing with third parties for purposes such as research, tailored advertising, and analytics.',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25),
              SizedBox(
                width: double.infinity,
                child: CustomElevatedButton(
                  text: "Continue",
                  onPressed: () {
                    context.pushNamed(AppRoute.addHomePage);
                  },
                ),
              ),
              SizedBox(height: 5),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Remind me later",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w700,
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
