import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:teenage_safety/src/common/const/app_images.dart';
import 'package:teenage_safety/src/common/const/back_arrow.dart';
import 'package:teenage_safety/src/common/const/global_variable.dart';
import 'package:teenage_safety/src/common/widgets/custom_appbar.dart';
import 'package:teenage_safety/src/common/widgets/custom_elevated_button.dart';
import 'package:teenage_safety/src/feature/home/pages/drawer/provider/change_admin_status_provider.dart';

class DriveDirectionPage extends StatefulWidget {
  const DriveDirectionPage({super.key});

  @override
  State<DriveDirectionPage> createState() => _DriveDirectionPageState();
}

class _DriveDirectionPageState extends State<DriveDirectionPage> {
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
                      'Drive Detection',
                      style: textTheme(context)
                          .bodyLarge!
                          .copyWith(letterSpacing: 0, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: size.height * 0.01,),
                    Container(
                      padding: const EdgeInsets.all(6),
                      height: size.height * 0.07,
                      decoration: BoxDecoration(
                        border: Border.all(color: colorScheme(context).outline),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Text('Drive Detection ON',style: textTheme(context).labelLarge!.copyWith(letterSpacing: 0),),
                          const Spacer(),
                          Consumer<ChangeAdminStatusProvider>(builder: (context, value, child) {
                            return Transform.scale(
                              scale: 0.6,
                              child: Switch(
                                  value: value.isSwitch,
                                  onChanged: (newValue){
                                    value.onChange(newValue);
                                  }
                              ),
                            );
                          },)
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * 0.01,),
                    Text("Drive detection for family member status allows users to monitor and identify the online or offline presence of connected family members in a shared digital environment. By leveraging smart home technology or family network systems, this feature can automatically detect when a family member's device is connected or disconnected. This not only enhances communication and coordination among family members but also promotes safety by ensuring everyone is accounted for. Notifications can be set up to alert users when a family member arrives home or leaves, fostering a sense of connectivity and awareness in the household.",style: textTheme(context).labelMedium!.copyWith(letterSpacing: 0),),
                    const Spacer(),
                    CustomElevatedButton(
                        width: double.infinity,
                        text: 'Save', onPressed: (){}),
                    SizedBox(height: size.height * 0.01,),

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