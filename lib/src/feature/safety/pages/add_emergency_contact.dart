import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:teenage_safety/src/common/const/app_colors.dart';
import 'package:teenage_safety/src/common/const/app_images.dart';
import 'package:teenage_safety/src/common/const/back_arrow.dart';
import 'package:teenage_safety/src/common/const/global_variable.dart';
import 'package:teenage_safety/src/common/widgets/custom_elevated_button.dart';
import 'package:teenage_safety/src/common/widgets/custom_textformfield.dart';

import '../../../common/widgets/custom_appbar.dart';

class AddEmergencyContactPage extends StatefulWidget {
  final TextEditingController nameController;
  final TextEditingController phoneNoController;
  final TextEditingController locationController;
  final  VoidCallback onSave;
  const AddEmergencyContactPage({super.key,
    required this.nameController,
    required this.phoneNoController,
    required this.locationController,
    required this.onSave
  });

  @override
  State<AddEmergencyContactPage> createState() => _AddEmergencyContactPageState();
}

class _AddEmergencyContactPageState extends State<AddEmergencyContactPage> {
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
                      'Add Emergency Contact',
                      style: textTheme(context)
                          .bodyLarge!
                          .copyWith(letterSpacing: 0, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 20,),
                CustomTextFormField(
                  controller: widget.nameController,
                  hint: 'Vicky Rock',
                  prefixIcon: Icon(CupertinoIcons.person,color: AppColors.appGrey,),
                ),
                SizedBox(height: size.height * 0.03,),
                CustomTextFormField(
                  controller: widget.phoneNoController,
                  hint: '5g+39M, Houston Park House #3',
                  prefixIcon: Icon(Icons.location_on_outlined,color: AppColors.appGrey,),
                ),
                SizedBox(height: size.height * 0.03,),
                CustomTextFormField(
                  controller: widget.locationController,
                  hint: '(854) 857 7494',
                  prefixIcon: Icon(CupertinoIcons.phone,color: AppColors.appGrey,),
                ),
                SizedBox(height: size.height * 0.03,),
                CustomElevatedButton(
                    width: double.infinity,
                    text: 'Save', onPressed: (){
                  widget.onSave();
                  widget.nameController.clear();
                  widget.phoneNoController.clear();
                  widget.locationController.clear();
                  // Navigator.pop(context);
                }),
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
