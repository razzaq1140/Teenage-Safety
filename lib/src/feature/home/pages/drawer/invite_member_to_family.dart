import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:teenage_safety/src/common/const/app_images.dart';
import 'package:teenage_safety/src/common/const/back_arrow.dart';
import 'package:teenage_safety/src/common/const/global_variable.dart';
import 'package:teenage_safety/src/common/widgets/custom_appbar.dart';
import 'package:teenage_safety/src/common/widgets/custom_elevated_button.dart';

class InviteMemberToFamilyPage extends StatefulWidget {
  const InviteMemberToFamilyPage({super.key});

  @override
  State<InviteMemberToFamilyPage> createState() => _InviteMemberToFamilyPageState();
}

class _InviteMemberToFamilyPageState extends State<InviteMemberToFamilyPage> {
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Invite members to Family',
                      style: textTheme(context)
                          .bodyLarge!
                          .copyWith(letterSpacing: 0, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: size.height * 0.01,),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(text: 'You can share this code any way you like: ',style: textTheme(context).labelMedium!.copyWith(letterSpacing: 0,fontWeight: FontWeight.w400)),
                          TextSpan(text: 'text it, email it, write it down, or say it.',style: textTheme(context).labelMedium!.copyWith(letterSpacing: 0,fontWeight: FontWeight.w800)),
                        ]
                      ),
                    ),
                    SizedBox(height: size.height * 0.02,),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        border: Border.all(color: colorScheme(context).outline),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text('U-L-J-H-K-G',style: textTheme(context).displaySmall!.copyWith(letterSpacing: 0,fontWeight: FontWeight.w800,color: colorScheme(context).primary)),
                      ),
                    ),
                    SizedBox(height: size.height * 0.06,),
                    CustomElevatedButton(
                      width: double.infinity,
                        text: 'Share Code',
                        onPressed: (){}
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