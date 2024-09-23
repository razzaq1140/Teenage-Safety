import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:teenage_safety/src/common/const/app_colors.dart';
import 'package:teenage_safety/src/common/const/app_images.dart';
import 'package:teenage_safety/src/common/const/back_arrow.dart';
import 'package:teenage_safety/src/common/const/global_variable.dart';
import 'package:teenage_safety/src/common/widgets/custom_appbar.dart';
import 'package:teenage_safety/src/common/widgets/custom_elevated_button.dart';
import 'package:teenage_safety/src/common/widgets/custom_textformfield.dart';
import 'package:teenage_safety/src/feature/home/pages/drawer/provider/account.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNoController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: double.infinity,
        padding: const EdgeInsets.all(16.0),
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              AppImages.bdImage,
            ),
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
                height: size.height * 0.85,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Account',
                      style: textTheme(context).bodyLarge!.copyWith(
                          letterSpacing: 0, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFormField(
                      controller: nameController,
                      hint: 'Vicky Rock',
                      textStyle: textTheme(context)
                          .titleSmall!
                          .copyWith(color: AppColors.appGrey, letterSpacing: 0),
                      prefixIcon: Icon(
                        CupertinoIcons.person,
                        color: AppColors.appGrey,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    CustomTextFormField(
                      controller: locationController,
                      hint: '5g+39M, Houston Park House #3',
                      textStyle: textTheme(context)
                          .titleSmall!
                          .copyWith(color: AppColors.appGrey, letterSpacing: 0),
                      prefixIcon: Icon(
                        Icons.location_on_outlined,
                        color: AppColors.appGrey,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    CustomTextFormField(
                      controller: phoneNoController,
                      hint: '(854) 857 7494',
                      textStyle: textTheme(context)
                          .titleSmall!
                          .copyWith(color: AppColors.appGrey, letterSpacing: 0),
                      prefixIcon: Icon(
                        CupertinoIcons.phone,
                        color: AppColors.appGrey,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    CustomTextFormField(
                      controller: emailController,
                      hint: 'Officialemail@email.com',
                      textStyle: textTheme(context)
                          .titleSmall!
                          .copyWith(color: AppColors.appGrey, letterSpacing: 0),
                      prefixIcon: Icon(
                        Icons.mail_outline,
                        color: AppColors.appGrey,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Consumer<AccountProvider>(
                      builder: (context, value, child) {
                        return CustomTextFormField(
                          controller: passwordController,
                          hint: '*************',
                          obscureText: value.visibility,
                          textStyle: textTheme(context).titleSmall!.copyWith(
                              color: AppColors.appGrey, letterSpacing: 0),
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: AppColors.appGrey,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              value.visibility
                                  ? CupertinoIcons.eye_slash
                                  : CupertinoIcons.eye,
                              color: AppColors.appGrey,
                            ),
                            onPressed: () {
                              setState(() {
                                value.onChangeVisibility();
                              });
                            },
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Consumer<AccountProvider>(
                      builder: (context, value, child) {
                        return CustomTextFormField(
                          controller: confirmController,
                          hint: '*************',
                          obscureText: value.visibility2,
                          textStyle: textTheme(context).titleSmall!.copyWith(
                              color: AppColors.appGrey, letterSpacing: 0),
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: AppColors.appGrey,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              value.visibility2
                                  ? CupertinoIcons.eye_slash
                                  : CupertinoIcons.eye,
                              color: AppColors.appGrey,
                            ),
                            onPressed: () {
                              setState(() {
                                value.onChangeVisibility2();
                              });
                            },
                          ),
                        );
                      },
                    ),
                    const Spacer(),
                    CustomElevatedButton(
                        width: double.infinity,
                        text: 'Save',
                        onPressed: () {
                          // Navigator.pop(context);
                        }),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
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
