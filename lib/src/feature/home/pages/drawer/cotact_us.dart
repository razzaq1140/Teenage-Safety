import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:teenage_safety/src/common/const/app_colors.dart';
import 'package:teenage_safety/src/common/const/app_images.dart';
import 'package:teenage_safety/src/common/const/back_arrow.dart';
import 'package:teenage_safety/src/common/const/global_variable.dart';
import 'package:teenage_safety/src/common/widgets/custom_textformfield.dart';
import 'package:teenage_safety/src/feature/home/pages/drawer/model/member_model.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({super.key});

  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  List<MemberModel> message = [
    MemberModel(name: 'Hello', isImage: false),
    MemberModel(name: 'how are you', isImage: false),
    MemberModel(name: 'Fine', isImage: false),
  ];

  TextEditingController messageController = TextEditingController();
  File? image;

  // Function to pick image and add it as a message
  void imagePicker() async {
    final pickImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickImage != null) {
      setState(() {
        image = File(pickImage.path);
        // Adding image to the message list
        message.add(MemberModel(name: pickImage.path, isImage: true));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
              CustomBackButton(
                onTap: () {
                  context.pop();
                },
              ),
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
                      'Contact Us',
                      style: textTheme(context)
                          .bodyLarge!
                          .copyWith(letterSpacing: 0, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: size.height * 0.02),
                    Divider(color: colorScheme(context).outline),
                    SizedBox(height: size.height * 0.02),
                    Expanded(
                      child: ListView.builder(
                        itemCount: message.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: message[index].isImage == true ? size.height * 0.01 : size.height * 0.03 ,
                                  horizontal: message[index].isImage == true ? size.width * 0.02 :size.width * 0.08  ,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(15),
                                    topLeft: Radius.circular(15),
                                    bottomRight: Radius.circular(15),
                                  ),
                                  color: message[index].isImage == true ? colorScheme(context).onPrimary : colorScheme(context).primary,
                                  border: Border.all(color: message[index].isImage == true ? colorScheme(context).outline : colorScheme(context).primary,)
                                ),
                                child: message[index].isImage!
                                    ? Image.file(
                                  File(message[index].name), // Show image
                                  width: size.width * 0.6,
                                  height: size.height * 0.3,
                                  fit: BoxFit.cover,
                                )
                                    : Text(
                                  message[index].name,
                                  style: textTheme(context)
                                      .labelLarge!
                                      .copyWith(color: colorScheme(context).onPrimary),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    CustomTextFormField(
                      hint: 'Type Message',
                      maxline: null,
                      controller: messageController,
                      textStyle: textTheme(context)
                          .titleSmall!
                          .copyWith(color: AppColors.appGrey, letterSpacing: 0),
                      prefixIcon: IconButton(
                        icon: Icon(
                          Icons.image_outlined,
                          color: AppColors.appGrey,
                        ),
                        onPressed: () {
                          imagePicker();
                        },
                      ),
                      suffixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: AppColors.appGrey,
                          ),
                          SizedBox(width: size.width * 0.02),
                          IconButton(
                            icon: Icon(
                              Icons.send,
                              color: AppColors.appGrey,
                            ),
                            onPressed: () {
                              setState(() {
                                if (messageController.text.isNotEmpty) {
                                  message.add(MemberModel(
                                      name: messageController.text, isImage: false));
                                  messageController.clear();
                                }
                              });
                            },
                          ),
                          SizedBox(width: size.width * 0.02),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
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
