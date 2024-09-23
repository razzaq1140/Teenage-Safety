import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:teenage_safety/src/common/const/app_images.dart';
import 'package:teenage_safety/src/common/const/global_variable.dart';
import 'package:teenage_safety/src/common/widgets/custom_elevated_button.dart';
import 'package:teenage_safety/src/common/widgets/custom_textformfield.dart';
import 'package:teenage_safety/src/router/routes.dart';
import 'package:intl/intl.dart';

class BirthdayPage extends StatefulWidget {
  const BirthdayPage({super.key});

  @override
  State<BirthdayPage> createState() => _BirthdayPageState();
}

class _BirthdayPageState extends State<BirthdayPage> {
  final TextEditingController _dateController = TextEditingController();

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        _dateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 22),
        width: double.infinity,
        height: double.infinity,
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
                "When’s your birthday?",
                style: textTheme(context).headlineSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: colorScheme(context).onPrimary),
              ),
            ),
            const SizedBox(height: 35),
            GestureDetector(
              onTap: () => _selectDate(context),
              child: AbsorbPointer(
                child: CustomTextFormField(
                  controller: _dateController,
                  hint: "August 16, 1998",
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
                  context.pushNamed(AppRoute.newCirclePage);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
