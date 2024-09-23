import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:teenage_safety/src/common/const/app_images.dart';
import 'package:teenage_safety/src/common/const/global_variable.dart';
import 'package:teenage_safety/src/common/widgets/custom_elevated_button.dart';
import 'package:teenage_safety/src/router/routes.dart';

class SelectRolePage extends StatefulWidget {
  const SelectRolePage({super.key});

  @override
  State<SelectRolePage> createState() => _SelectRolePageState();
}

class _SelectRolePageState extends State<SelectRolePage> {
  bool isParentSelected = false;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 22),
        width: double.infinity,
        height: height,
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
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isParentSelected = true; // Select parents
                      });
                    },
                    child: Container(
                      height: 220,
                      width: width * 0.41,
                      decoration: BoxDecoration(
                        color: colorScheme(context).surface,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          width: 5,
                          color: isParentSelected
                              ? colorScheme(context)
                                  .primary // Highlight if selected
                              : colorScheme(context)
                                  .outline, // Default if not selected
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image(
                              image: AssetImage(AppImages.children),
                              height: 100,
                              width: 100,
                            ),
                          ),
                          Text(
                            "Parents",
                            style: textTheme(context)
                                .headlineSmall
                                ?.copyWith(fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isParentSelected = false; // Select children
                      });
                    },
                    child: Container(
                      height: 220,
                      width: width * 0.41,
                      decoration: BoxDecoration(
                        color: colorScheme(context).surface,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          width: 5,
                          color: !isParentSelected
                              ? colorScheme(context)
                                  .primary // Highlight if selected
                              : colorScheme(context)
                                  .outline, // Default if not selected
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image(
                              image: AssetImage(AppImages.parents),
                              height: 100,
                              width: 100,
                            ),
                          ),
                          Text(
                            "Children",
                            style: textTheme(context)
                                .headlineSmall
                                ?.copyWith(fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 60),
              SizedBox(
                width: double.infinity,
                child: CustomElevatedButton(
                  width: double.infinity,
                  text: "Continue",
                  onPressed: () {
                    context.pushNamed(AppRoute.familyCodePage);
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
