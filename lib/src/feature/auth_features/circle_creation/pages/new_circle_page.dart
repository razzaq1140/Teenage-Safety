import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teenage_safety/src/common/const/app_images.dart';
import 'package:teenage_safety/src/common/const/global_variable.dart';
import 'package:teenage_safety/src/common/widgets/custom_elevated_button.dart';
import 'package:teenage_safety/src/router/routes.dart';

class NewCirclePage extends StatefulWidget {
  const NewCirclePage({super.key});

  @override
  State<NewCirclePage> createState() => _NewCirclePageState();
}

class _NewCirclePageState extends State<NewCirclePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 22),
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
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
                "Hi John! Now you can join or Create your Circle",
                style: textTheme(context).headlineSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: colorScheme(context).onPrimary),
              ),
              const SizedBox(height: 15),
              Text(
                "A Circle is a private space only accessible by you and your family.",
                style: textTheme(context).titleMedium?.copyWith(
                      color: colorScheme(context).outline,
                      fontSize: 16,
                    ),
              ),
              const SizedBox(height: 50),
              Image(
                image: AssetImage(AppImages.circle),
                height: 150,
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: CustomElevatedButton(
                  width: double.infinity,
                  text: "Join",
                  onPressed: () {
                    context.pushNamed(AppRoute.circleJoin);
                  },
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: CustomElevatedButton(
                  buttonColor: colorScheme(context).surface,
                  width: double.infinity,
                  text: "Create a new Circle",
                  textStyle: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  onPressed: () {
                    context.pushNamed(AppRoute.circleCreatePage);
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
