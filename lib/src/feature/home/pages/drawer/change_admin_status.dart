import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:teenage_safety/src/common/const/app_images.dart';
import 'package:teenage_safety/src/common/const/back_arrow.dart';
import 'package:teenage_safety/src/common/const/global_variable.dart';
import 'package:teenage_safety/src/common/widgets/custom_appbar.dart';
import 'package:teenage_safety/src/feature/home/pages/drawer/provider/change_admin_status_provider.dart';

class ChangeAdminStatusPage extends StatefulWidget {
  const ChangeAdminStatusPage({super.key});

  @override
  State<ChangeAdminStatusPage> createState() => _ChangeAdminStatusPageState();
}

class _ChangeAdminStatusPageState extends State<ChangeAdminStatusPage> {
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
                      'Change Admin Status',
                      style: textTheme(context)
                          .bodyLarge!
                          .copyWith(letterSpacing: 0, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: size.height * 0.01,),
                    Container(
                      padding: const EdgeInsets.all(6),
                      alignment: Alignment.center,
                      height: size.height * 0.06,
                      decoration: BoxDecoration(
                        border: Border.all(color: colorScheme(context).outline,),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            backgroundImage: CachedNetworkImageProvider('https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg?t=st=1726641286~exp=1726644886~hmac=03d7151562e433d0a5ecf762f2d1dfd8d0e21e35cba5b2d415b608081c19502e&w=740'),
                          ),
                          SizedBox(width: size.width* 0.01,),
                          const Text('Abdul Razzaq'),
                          const Spacer(),
                          Transform.scale(
                              scale: 0.6,
                              child: Consumer<ChangeAdminStatusProvider>(builder: (context, value, child) {
                                return Switch(value: value.isSwitch, onChanged: (newValue){
                                  value.onChange(newValue);
                                });
                              },))
                        ],
                      ),
                    )
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