import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:teenage_safety/src/common/const/app_images.dart';
import 'package:teenage_safety/src/common/const/back_arrow.dart';
import 'package:teenage_safety/src/common/const/global_variable.dart';
import 'package:teenage_safety/src/common/widgets/custom_appbar.dart';
import 'package:teenage_safety/src/common/widgets/custom_elevated_button.dart';
import 'package:teenage_safety/src/router/routes.dart';

class CircleManagementPage extends StatefulWidget {
  const CircleManagementPage({super.key});

  @override
  State<CircleManagementPage> createState() => _CircleManagementPageState();
}

class _CircleManagementPageState extends State<CircleManagementPage> {
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
                      'Circle Management',
                      style: textTheme(context)
                          .bodyLarge!
                          .copyWith(letterSpacing: 0, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: size.height * 0.01,),
                    _listTile('Edit Circle Name', () {
                      context.pushNamed(AppRoute.editCircleName);
                    },),
                    _listTile('My Role', () {
                      context.pushNamed(AppRoute.myRole);

                    },),
                    _listTile('Change Admin Status', ()  {
                    context.pushNamed(AppRoute.changeAdminStatus);
                    },),
                    _listTile('Add Circle Members', () {
                      context.pushNamed(AppRoute.inviteMemberToFamily);
                    },),
                    _listTile('Delete Circle Members', () {
                      context.pushNamed(AppRoute.deleteCircleMembers);
                    },),
                    _listTile('Leave Circle', () {
                      showMyDialog(context);
                    },),
                  ],
                ),
              ),
            ],
          ),
        ),

      ),
    );
  }

  Widget _listTile(String title, VoidCallback onTap){
    return ListTile(
      onTap: onTap,
      title: Text(title,style: textTheme(context).titleSmall!.copyWith(letterSpacing: 0,fontWeight: FontWeight.w500),),
      trailing: Icon(Icons.chevron_right,color: colorScheme(context).outline,),
    );
  }

  void showMyDialog(BuildContext context) async{
    final size = MediaQuery.of(context).size;
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            insetPadding: const EdgeInsets.all(10),
            child: Container(
              width: size.width * 0.9,
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(child: Text('Leaving Circle',style: textTheme(context).bodyLarge!.copyWith(color: colorScheme(context).onSurface,fontWeight: FontWeight.w600),)),
                  SizedBox(height: size.height * 0.01,),
                  const Text('You will no longer see or share locations with this Circle. Are you sure you want to leave?'),
                  SizedBox(height: size.height * 0.03,),
                  CustomElevatedButton(
                      width: double.infinity,
                      text: 'Yes',
                      textStyle: textTheme(context).labelLarge!.copyWith(color: colorScheme(context).onPrimary),
                      onPressed: (){}),
                  Center(child: TextButton(onPressed: (){
                    Navigator.pop(context);
                  }, child: Text('No',style: textTheme(context).labelLarge!.copyWith(color: colorScheme(context).onSurface),))),
                ],
              ),
            ),
          );
        },
    );
  }

}
