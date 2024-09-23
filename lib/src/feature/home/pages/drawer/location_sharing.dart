import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:teenage_safety/src/common/const/app_images.dart';
import 'package:teenage_safety/src/common/const/back_arrow.dart';
import 'package:teenage_safety/src/common/const/global_variable.dart';
import 'package:teenage_safety/src/common/widgets/custom_appbar.dart';
import 'package:teenage_safety/src/common/widgets/custom_elevated_button.dart';
import 'package:teenage_safety/src/feature/home/pages/drawer/model/member_model.dart';
import 'package:teenage_safety/src/feature/home/pages/drawer/provider/change_admin_status_provider.dart';

class LocationSharingPage extends StatefulWidget {
  const LocationSharingPage({super.key});

  @override
  State<LocationSharingPage> createState() => _LocationSharingPageState();
}

class _LocationSharingPageState extends State<LocationSharingPage> {

  List<MemberModel> member = [
    MemberModel(
        name: 'John Vick',
        desc: 'Location Sharing ON',
        imageUrl: 'https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg?t=st=1726641286~exp=1726644886~hmac=03d7151562e433d0a5ecf762f2d1dfd8d0e21e35cba5b2d415b608081c19502e&w=740',
    ),
    MemberModel(
      name: 'John Vick',
      desc: 'Location Sharing ON',
      imageUrl: 'https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg?t=st=1726641286~exp=1726644886~hmac=03d7151562e433d0a5ecf762f2d1dfd8d0e21e35cba5b2d415b608081c19502e&w=740',
    ),
  ];

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
            image: AssetImage(AppImages.bdImage),
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
                      'Location Sharing',
                      style: textTheme(context).bodyLarge!.copyWith(
                        letterSpacing: 0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: size.height * 0.01),
                    Text('Your Location Sharing',style: textTheme(context).bodyLarge!.copyWith(
                      letterSpacing: 0,
                      fontWeight: FontWeight.w500,
                    ),),
                    SizedBox(height: size.height * 0.02),
                    Container(
                      padding: EdgeInsets.all(6),
                      height: size.height * 0.07,
                      decoration: BoxDecoration(
                        border: Border.all(color: colorScheme(context).outline),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: CachedNetworkImageProvider('https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg?t=st=1726641286~exp=1726644886~hmac=03d7151562e433d0a5ecf762f2d1dfd8d0e21e35cba5b2d415b608081c19502e&w=740'),),
                          SizedBox(width: size.width * 0.01),
                          Text('John Vick'),
                          Spacer(),
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
                    SizedBox(height: size.height * 0.01),
                    Text('Circle Member Status',style: textTheme(context).bodyLarge!.copyWith(
                      letterSpacing: 0,
                      fontWeight: FontWeight.w500,
                    ),),
                    ListView.builder(
                      padding: EdgeInsets.only(top: size.height * 0.02),
                      shrinkWrap: true,
                      itemCount: member.length,
                      itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: size.height * 0.02),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical:size.height * 0.004,horizontal: size.width * 0.02),
                          height: size.height * 0.075,
                          decoration: BoxDecoration(
                            border: Border.all(color: colorScheme(context).outline),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: CachedNetworkImageProvider(member[index].imageUrl!),),
                              SizedBox(width: size.width * 0.03),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(member[index].name),
                                  Text(member[index].desc.toString()),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },)
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
