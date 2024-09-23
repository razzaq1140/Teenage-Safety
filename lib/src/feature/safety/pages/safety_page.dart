import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:teenage_safety/src/common/const/app_images.dart';
import 'package:teenage_safety/src/common/const/global_variable.dart';
import 'package:teenage_safety/src/common/widgets/custom_appbar.dart';
import 'package:teenage_safety/src/feature/safety/model/safety_model.dart';
import 'package:teenage_safety/src/feature/safety/pages/add_emergency_contact.dart';
import 'package:teenage_safety/src/router/routes.dart';

class SafetyScreen extends StatefulWidget {
  const SafetyScreen({super.key});

  @override
  State<SafetyScreen> createState() => _SafetyScreenState();
}

class _SafetyScreenState extends State<SafetyScreen> {
  void addContent(SafetyModel newContent) {
    setState(() {
      data.add(newContent);
    });
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  List<SafetyModel> data = [
    SafetyModel(name: 'Razzaq', phoneNo: '03228686786', location: 'Bahawalpur'),
    SafetyModel(name: 'Zawar', phoneNo: '03042233440', location: 'Bahawalpur'),
    SafetyModel(name: 'Razzaq', phoneNo: '03205566770', location: 'Bahawalpur'),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16.0),
        height: double.infinity,
        width: double.infinity,
        decoration:  BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.bdImage),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Emergency Contacts',
                        style: textTheme(context).bodyLarge!.copyWith(
                            letterSpacing: 0, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: size.height * 0.16,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Wrap(
                            spacing: 10,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            AddEmergencyContactPage(
                                                nameController: nameController,
                                                phoneNoController: phoneController,
                                                locationController:
                                                    locationController,
                                                onSave: () {
                                                  if (nameController
                                                          .text.isNotEmpty &&
                                                      phoneController
                                                          .text.isNotEmpty) {
                                                    SafetyModel newContent =
                                                        SafetyModel(
                                                            name:
                                                                nameController.text,
                                                            phoneNo: phoneController
                                                                .text,
                                                            location:
                                                                locationController
                                                                    .text);
                                                    addContent(newContent);
                                                    Navigator.pop(context);
                                                  }
                                                }),
                                      ));
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 18,
                                      vertical: size.height * 0.048),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: colorScheme(context).outline,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: CircleAvatar(
                                    radius: 17,
                                    backgroundColor: colorScheme(context).primary,
                                    child: const Icon(Icons.add, size: 30),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize
                                    .min, // Ensure Row doesn't take infinite width
                                children: List.generate(data.length, (index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          left: size.height * 0.014,
                                          right: size.height * 0.014,
                                          top: size.height * 0.02,
                                          bottom: size.height * 0.01),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: colorScheme(context).outline,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(CupertinoIcons.person,
                                                      color: colorScheme(context)
                                                          .primary),
                                                  const SizedBox(width: 10),
                                                  Text(data[index].name),
                                                ],
                                              ),
                                              SizedBox(height: size.height * 0.007),
                                              Row(
                                                children: [
                                                  Icon(CupertinoIcons.phone,
                                                      color: colorScheme(context)
                                                          .primary),
                                                  const SizedBox(width: 10),
                                                  Text(data[index].phoneNo),
                                                ],
                                              ),
                                              SizedBox(height: size.height * 0.007),
                                              Row(
                                                children: [
                                                  Icon(CupertinoIcons.phone,
                                                      color: colorScheme(context)
                                                          .primary),
                                                  const SizedBox(width: 10),
                                                  Text(data[index].location),
                                                ],
                                              ),
                                            ],
                                          ),
                                          const SizedBox(width: 30),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                bottom: size.height * 0.01),
                                            child: IconButton(
                                              icon: Icon(Icons.delete_outline,
                                                  color:
                                                      colorScheme(context).outline),
                                              onPressed: () {
                                                setState(() {
                                                  data.removeAt(index);
                                                });
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: Colors.white, borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Help Message',
                              style: textTheme(context).bodyLarge!.copyWith(
                                  fontWeight: FontWeight.w700, letterSpacing: 0)),
                          TextButton(
                            onPressed: () {},
                            child: Text('Edit',
                                style: textTheme(context).bodyLarge!.copyWith(
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 0,
                                    color: colorScheme(context).primary)),
                          )
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                          '(your Name) has sent an emergency alert, reach/contact as soon as you can, the last location that we have is in the URL below (location URL) at (time)',
                          style: textTheme(context).labelMedium!.copyWith(
                              fontWeight: FontWeight.w500, letterSpacing: 0)),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        context.pushNamed(AppRoute.watchMePage);
                      },
                      child: Container(
                        height: size.height * 0.286,
                        width: size.width * 0.44,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 38, vertical: 25),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8)),
                        child: const Column(
                          children: [
                            Icon(Icons.directions_walk_outlined, size: 80),
                            SizedBox(height: 8),
                            SizedBox(
                                width: 80,
                                child: Text('Watch Over Me',
                                    textAlign: TextAlign.center)),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        context.pushNamed(AppRoute.sendingAlertPage);
                      },
                      child: Container(
                        height: size.height * 0.286,
                        width: size.width * 0.44, // Set width for consistency
                        padding: const EdgeInsets.symmetric(
                            horizontal: 38, vertical: 25),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          children: [
                            Icon(Icons.error,
                                color: colorScheme(context).error, size: 80),
                            const SizedBox(height: 8),
                            const Expanded(
                                child: Text('Send Emergency Alert',
                                    textAlign: TextAlign.center)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.08,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
