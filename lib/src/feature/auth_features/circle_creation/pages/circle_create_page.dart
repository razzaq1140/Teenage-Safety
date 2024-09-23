import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:teenage_safety/src/common/const/app_images.dart';
import 'package:teenage_safety/src/common/const/global_variable.dart';
import 'package:teenage_safety/src/common/widgets/custom_elevated_button.dart';
import 'package:teenage_safety/src/common/widgets/custom_textformfield.dart';
import 'package:teenage_safety/src/router/routes.dart';

class CircleCreatePage extends StatefulWidget {
  const CircleCreatePage({super.key});

  @override
  State<CircleCreatePage> createState() => _CircleCreatePageState();
}

class _CircleCreatePageState extends State<CircleCreatePage> {
  TextEditingController nameController = TextEditingController();

  @override
  void dispose() {
    // Dispose of the controllers when the widget is removed from the tree
    nameController.dispose();
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
              const SizedBox(height: 50),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  textAlign: TextAlign.center,
                  "Create a new circle",
                  style: textTheme(context).headlineSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      color: colorScheme(context).onPrimary),
                ),
              ),
              const SizedBox(height: 15),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Give your Circle a name.",
                  style: textTheme(context).titleMedium?.copyWith(
                        color: colorScheme(context).outline,
                        fontSize: 16,
                      ),
                ),
              ),
              const SizedBox(height: 30),
              CustomTextFormField(
                controller: nameController,
                hint: "John Family",
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: CustomElevatedButton(
                  width: double.infinity,
                  text: "Create",
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
