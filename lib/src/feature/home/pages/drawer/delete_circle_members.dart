import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:teenage_safety/src/common/const/app_images.dart';
import 'package:teenage_safety/src/common/const/back_arrow.dart';
import 'package:teenage_safety/src/common/const/global_variable.dart';
import 'package:teenage_safety/src/common/widgets/custom_appbar.dart';
import 'package:teenage_safety/src/common/widgets/custom_elevated_button.dart';
import 'package:teenage_safety/src/feature/home/pages/drawer/model/member_model.dart';

class DeleteCircleMemberPage extends StatefulWidget {
  const DeleteCircleMemberPage({super.key});

  @override
  State<DeleteCircleMemberPage> createState() => _DeleteCircleMemberPageState();
}

class _DeleteCircleMemberPageState extends State<DeleteCircleMemberPage> {

  List<MemberModel> members = [
    MemberModel(name: 'Vicky Roy', imageUrl: 'https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg?t=st=1726641286~exp=1726644886~hmac=03d7151562e433d0a5ecf762f2d1dfd8d0e21e35cba5b2d415b608081c19502e&w=740'),
    MemberModel(name: 'Vicky Roy', imageUrl: 'https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg?t=st=1726641286~exp=1726644886~hmac=03d7151562e433d0a5ecf762f2d1dfd8d0e21e35cba5b2d415b608081c19502e&w=740'),
  ];

  Set<MemberModel> selectMember = {};
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
                      'Delete Circle Members',
                      style: textTheme(context).bodyLarge!.copyWith(
                        letterSpacing: 0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: size.height * 0.01),
                    // Member 1
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: members.length,
                      itemBuilder: (context, index) {
                        final member = members[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          height: size.height * 0.06,
                          decoration: BoxDecoration(
                            border: Border.all(color: colorScheme(context).outline),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: CachedNetworkImageProvider(member.imageUrl!),),
                              SizedBox(width: size.width * 0.01),
                              Text(member.name),
                              const Spacer(),
                              Checkbox(
                                value: selectMember.contains(member),
                                onChanged: (bool? value) {
                                  setState(() {
                                    if(value == true){
                                      selectMember.add(member);
                                    }else{
                                      selectMember.remove(member);
                                    }
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },),
                    SizedBox(height: size.height * 0.01),
                    // Member 2

                    const Spacer(),
                    CustomElevatedButton(
                        width: double.infinity,
                        text: 'Delete',
                        onPressed: () {
                         setState(() {
                           members.removeWhere((member) => selectMember.contains(member));
                           selectMember.clear();
                         });
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
