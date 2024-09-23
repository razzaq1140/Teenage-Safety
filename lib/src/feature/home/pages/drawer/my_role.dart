import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:teenage_safety/src/common/const/app_images.dart';
import 'package:teenage_safety/src/common/const/back_arrow.dart';
import 'package:teenage_safety/src/common/const/global_variable.dart';
import 'package:teenage_safety/src/common/widgets/custom_appbar.dart';
import 'package:teenage_safety/src/common/widgets/custom_elevated_button.dart';
import 'package:teenage_safety/src/feature/auth_features/circle_creation/pages/add_photo_page.dart';

class MyRolePage extends StatefulWidget {
  const MyRolePage({super.key});

  @override
  State<MyRolePage> createState() => _MyRolePageState();
}

class _MyRolePageState extends State<MyRolePage> {
  String name = '';
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
                      'Edit Role in your circle',
                      style: textTheme(context)
                          .bodyLarge!
                          .copyWith(letterSpacing: 0, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: size.height * 0.01,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: (){
                              setState(() {
                                name = 'Parents';
                              });
                            },
                            child: Container(
                              height: size.height * 0.23,
                              // width: size.height * 0.2,
                              decoration: BoxDecoration(
                                // color: Colors.red,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: name == 'Parents' ? colorScheme(context).primary : colorScheme(context).outline),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 35,
                                    backgroundImage: AssetImage(AppImages.parent),
                                  ),
                                  SizedBox(height: size.height * 0.01,),
                                  Text('Parents',style: textTheme(context).titleMedium!.copyWith(letterSpacing: 0,fontSize: 18,fontWeight: FontWeight.w600),),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: size.width * 0.05,),
                        Expanded(
                          child: InkWell(
                            onTap: (){
                              setState(() {
                                name = 'Children';
                              });
                            },
                            child: Container(
                              height: size.height * 0.23,
                              // width: size.height * 0.2,
                              decoration: BoxDecoration(
                                // color: Colors.red,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: name == 'Children' ? colorScheme(context).primary : colorScheme(context).outline),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 35,
                                    backgroundImage: AssetImage(AppImages.child),
                                  ),
                                  SizedBox(height: size.height * 0.01,),
                                  Text('Children',style: textTheme(context).titleMedium!.copyWith(letterSpacing: 0,fontSize: 18,fontWeight: FontWeight.w600),),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const Spacer(),
                    CustomElevatedButton(
                        width: double.infinity,
                        text: 'Save', onPressed: (){})
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