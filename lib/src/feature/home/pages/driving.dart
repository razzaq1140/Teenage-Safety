import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:teenage_safety/src/common/const/app_images.dart';
import 'package:teenage_safety/src/common/const/global_variable.dart';
import 'package:teenage_safety/src/common/widgets/custom_appbar.dart';
import 'package:teenage_safety/src/feature/home/pages/drawer/drawer.dart';

class DrivingScreen extends StatefulWidget {
  const DrivingScreen({super.key});

  @override
  State<DrivingScreen> createState() => _DrivingScreenState();
}

class _DrivingScreenState extends State<DrivingScreen> {
  bool speedLimit = true;
  bool crashDetection = true;
  bool textingAlert = true;
  bool accelerationAlert = true;
  bool brakingAlert = true;
  bool isParent = true;

  bool isOpen = false;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  double crashLimit = 80.0;
  double textingLimit = 80.0;
  double accelerationLimit = 80.0;
  double brakingLimit = 80.0;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: scaffoldKey,
      drawer: const AppDrawer(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppImages.drivingScreenBackground),
              fit: BoxFit.cover),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15),
                          ),
                          color: colorScheme(context).onPrimary,
                        ),
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 25,
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          "https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg?t=st=1726641286~exp=1726644886~hmac=03d7151562e433d0a5ecf762f2d1dfd8d0e21e35cba5b2d415b608081c19502e&w=740",
                                      imageBuilder: (context, imageProvider) =>
                                          CircleAvatar(
                                        radius: 25,
                                        backgroundImage: imageProvider,
                                      ),
                                      placeholder: (context, url) =>
                                          CircleAvatar(
                                        radius: 20,
                                        backgroundColor: Colors.grey[200],
                                        child:
                                            const CircularProgressIndicator(),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          CircleAvatar(
                                        radius: 20,
                                        backgroundColor: Colors.grey[200],
                                        child: const Icon(Icons.error),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Vicky",
                                    style: textTheme(context)
                                        .bodyMedium
                                        ?.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color:
                                                colorScheme(context).primary),
                                  ),
                                  Container(height: 2,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: colorScheme(context).primary,
                                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                                  ),),
                                ],
                              ),
                            ),
                            Container(
                              width: 1,
                              height: 60,
                              color: colorScheme(context).outline,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 25,
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          "https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg?t=st=1726641286~exp=1726644886~hmac=03d7151562e433d0a5ecf762f2d1dfd8d0e21e35cba5b2d415b608081c19502e&w=740",
                                      imageBuilder: (context, imageProvider) =>
                                          CircleAvatar(
                                        radius: 25,
                                        backgroundImage: imageProvider,
                                      ),
                                      placeholder: (context, url) =>
                                          CircleAvatar(
                                        radius: 20,
                                        backgroundColor: Colors.grey[200],
                                        child:
                                            const CircularProgressIndicator(),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          CircleAvatar(
                                        radius: 20,
                                        backgroundColor: Colors.grey[200],
                                        child: const Icon(Icons.error),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Ricky",
                                    style: textTheme(context)
                                        .bodyMedium
                                        ?.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color:
                                                colorScheme(context).onSurface),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: 1,
                              height: 60,
                              color: colorScheme(context).outline,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 25,
                                    child: CachedNetworkImage(
                                      imageUrl:
                                          "https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg?t=st=1726641286~exp=1726644886~hmac=03d7151562e433d0a5ecf762f2d1dfd8d0e21e35cba5b2d415b608081c19502e&w=740",
                                      imageBuilder: (context, imageProvider) =>
                                          CircleAvatar(
                                        radius: 25,
                                        backgroundImage: imageProvider,
                                      ),
                                      placeholder: (context, url) =>
                                          CircleAvatar(
                                        radius: 20,
                                        backgroundColor: Colors.grey[200],
                                        child:
                                            const CircularProgressIndicator(),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          CircleAvatar(
                                        radius: 20,
                                        backgroundColor: Colors.grey[200],
                                        child: const Icon(Icons.error),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Jimmy",
                                    style: textTheme(context)
                                        .bodyMedium
                                        ?.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color:
                                                colorScheme(context).onSurface),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: 1,
                              height: 60,
                              color: colorScheme(context).outline,
                            ),
                            Expanded(
                              child: Text(
                                textAlign: TextAlign.center,
                                "Add member",
                                style: textTheme(context).bodyLarge?.copyWith(
                                    color: colorScheme(context).primary),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(15)),
                          color: colorScheme(context).onPrimary,
                        ),
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "John Family Circle",
                                  style: textTheme(context)
                                      .titleSmall
                                      ?.copyWith(fontWeight: FontWeight.w700),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isParent = !isParent;
                                    });
                                  },
                                  child: Text(isParent
                                    ?"Parental Control"
                                    :"Children Control",
                                    style: textTheme(context).bodyLarge?.copyWith(
                                        color: colorScheme(context).primary),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        "https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg?t=st=1726641286~exp=1726644886~hmac=03d7151562e433d0a5ecf762f2d1dfd8d0e21e35cba5b2d415b608081c19502e&w=740",
                                    imageBuilder: (context, imageProvider) =>
                                        CircleAvatar(
                                      radius: 30,
                                      backgroundImage: imageProvider,
                                    ),
                                    placeholder: (context, url) => CircleAvatar(
                                      radius: 30,
                                      backgroundColor: Colors.grey[200],
                                      child: const CircularProgressIndicator(),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Colors.grey[200],
                                      child: const Icon(Icons.error),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Clay Jensen",
                                        style: textTheme(context)
                                            .bodyLarge
                                            ?.copyWith(
                                                fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        "Speed Limit",
                                        style: textTheme(context).bodyMedium,
                                      ),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                Image.asset(
                                  AppImages.scanLocation,
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                                const Spacer(),
                                Column(
                                  children: [
                                    isParent
                                    ?Transform.scale(
                                      scale: 0.6,
                                      child: Switch(
                                        value: speedLimit,
                                        onChanged: (value) {
                                          setState(() {
                                            speedLimit = !speedLimit;
                                          });
                                        },
                                        activeColor:
                                            colorScheme(context).onPrimary,
                                        activeTrackColor:
                                            colorScheme(context).primary,
                                        inactiveTrackColor:
                                            colorScheme(context).outline,
                                        inactiveThumbColor:
                                            colorScheme(context).onPrimary,
                                      ),
                                    ):Container(),
                                    Text(
                                      "80 mph",
                                      style: textTheme(context)
                                          .bodySmall
                                          ?.copyWith(),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            // isParent
                            //     ? Column(
                            //       children: [
                            //         Row(
                            //             children: [
                            //               Text(
                            //                 "Set Speed",
                            //                 style: textTheme(context)
                            //                     .bodySmall
                            //                     ?.copyWith(
                            //                         color: colorScheme(context)
                            //                             .primary),
                            //               ),
                            //               Expanded(
                            //                 child: Slider(
                            //                   thumbColor:
                            //                       colorScheme(context).onPrimary,
                            //                   max: 160,
                            //                   inactiveColor:
                            //                       colorScheme(context).outline,
                            //                   value: _currentSliderPrimaryValue,
                            //                   label: _currentSliderPrimaryValue
                            //                       .round()
                            //                       .toString(),
                            //                   onChanged: (double value) {
                            //                     setState(() {
                            //                       _currentSliderPrimaryValue =
                            //                           value;
                            //                     });
                            //                   },
                            //                 ),
                            //               ),
                            //             ],
                            //           ),
                                      
                            //       ],
                            //     )
                            //     : Container(),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      isParent
                      ?Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                              color: colorScheme(context).onPrimary,
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Crash Detection",
                                      style: textTheme(context)
                                          .titleSmall
                                          ?.copyWith(fontWeight: FontWeight.w700),
                                    ),
                                    Transform.scale(
                                      scale: 0.6,
                                      child: Switch(
                                        value: crashDetection,
                                        onChanged: (value) {
                                          setState(() {
                                            crashDetection = !crashDetection;
                                          });
                                        },
                                        activeColor: colorScheme(context).onPrimary,
                                        activeTrackColor:
                                            colorScheme(context).primary,
                                        inactiveTrackColor:
                                            colorScheme(context).outline,
                                        inactiveThumbColor:
                                            colorScheme(context).onPrimary,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                        children: [
                                          Text(
                                            "Set Crashing",
                                            style: textTheme(context)
                                                .bodySmall
                                                ?.copyWith(
                                                    color: colorScheme(context)
                                                        .primary),
                                          ),
                                          Expanded(
                                            child: Slider(
                                              thumbColor:
                                                  colorScheme(context).primary,
                                              max: 100,
                                              min: 0.0,
                                              divisions: 100,
                                              inactiveColor:
                                                  colorScheme(context).outline,
                                              value: crashLimit,
                                              label: '${crashLimit.round()}%',
                                              onChanged: (double value) {
                                                setState(() {
                                                  crashLimit =
                                                      value;
                                                });
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                              color: colorScheme(context).onPrimary,
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Texting Alert",
                                      style: textTheme(context)
                                          .titleSmall
                                          ?.copyWith(fontWeight: FontWeight.w700),
                                    ),
                                    Transform.scale(
                                      scale: 0.6,
                                      child: Switch(
                                        value: textingAlert,
                                        onChanged: (value) {
                                          setState(() {
                                            textingAlert = !textingAlert;
                                          });
                                        },
                                        activeColor: colorScheme(context).onPrimary,
                                        activeTrackColor:
                                            colorScheme(context).primary,
                                        inactiveTrackColor:
                                            colorScheme(context).outline,
                                        inactiveThumbColor:
                                            colorScheme(context).onPrimary,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                        children: [
                                          Text(
                                            "Set Texting",
                                            style: textTheme(context)
                                                .bodySmall
                                                ?.copyWith(
                                                    color: colorScheme(context)
                                                        .primary),
                                          ),
                                          Expanded(
                                            child: Slider(
                                              thumbColor:
                                                  colorScheme(context).primary,
                                              max: 100,
                                              min: 0.0,
                                              divisions: 100,
                                              inactiveColor:
                                                  colorScheme(context).outline,
                                              value: textingLimit,
                                              label: '${textingLimit.round()}%',
                                              onChanged: (double value) {
                                                setState(() {
                                                  textingLimit =
                                                      value;
                                                });
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                              color: colorScheme(context).onPrimary,
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Acceleration",
                                      style: textTheme(context)
                                          .titleSmall
                                          ?.copyWith(fontWeight: FontWeight.w700),
                                    ),
                                    Transform.scale(
                                      scale: 0.6,
                                      child: Switch(
                                        value: accelerationAlert,
                                        onChanged: (value) {
                                          setState(() {
                                            accelerationAlert = !accelerationAlert;
                                          });
                                        },
                                        activeColor: colorScheme(context).onPrimary,
                                        activeTrackColor:
                                            colorScheme(context).primary,
                                        inactiveTrackColor:
                                            colorScheme(context).outline,
                                        inactiveThumbColor:
                                            colorScheme(context).onPrimary,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                        children: [
                                          Text(
                                            "Set Acceleration",
                                            style: textTheme(context)
                                                .bodySmall
                                                ?.copyWith(
                                                    color: colorScheme(context)
                                                        .primary),
                                          ),
                                          Expanded(
                                            child: Slider(
                                              activeColor: colorScheme(context).primary,
                                              thumbColor:
                                                  colorScheme(context).primary,
                                              max: 100.0,
                                              min: 0.0,
                                              divisions: 100,
                                              inactiveColor:
                                                  colorScheme(context).outline,
                                              value: accelerationLimit,
                                              label: '${accelerationLimit.round()}%',
                                              onChanged: (double value) {
                                                setState(() {
                                                  accelerationLimit =
                                                      value;
                                                });
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                              color: colorScheme(context).onPrimary,
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Braking",
                                      style: textTheme(context)
                                          .titleSmall
                                          ?.copyWith(fontWeight: FontWeight.w700),
                                    ),
                                    Transform.scale(
                                      scale: 0.6,
                                      child: Switch(
                                        value: brakingAlert,
                                        onChanged: (value) {
                                          setState(() {
                                            brakingAlert = !brakingAlert;
                                          });
                                        },
                                        activeColor: colorScheme(context).onPrimary,
                                        activeTrackColor:
                                            colorScheme(context).primary,
                                        inactiveTrackColor:
                                            colorScheme(context).outline,
                                        inactiveThumbColor:
                                            colorScheme(context).onPrimary,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                        children: [
                                          Text(
                                            "Set Braking",
                                            style: textTheme(context)
                                                .bodySmall
                                                ?.copyWith(
                                                    color: colorScheme(context)
                                                        .primary),
                                          ),
                                          Expanded(
                                            child: Slider(
                                              thumbColor:
                                                  colorScheme(context).primary,
                                              max: 100,
                                              min: 0.0,
                                              divisions: 100,
                                              inactiveColor:
                                                  colorScheme(context).outline,
                                              value: brakingLimit,
                                              label: '${brakingLimit.round()}%',
                                              onChanged: (double value) {
                                                setState(() {
                                                  brakingLimit =
                                                      value;
                                                });
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ):Container(),
                      Container(
                        width: width,
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(15)),
                          color: colorScheme(context).onPrimary,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Dashboard for distracted driving Alert",
                              style: textTheme(context)
                                  .titleSmall
                                  ?.copyWith(fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(width: width,
                              child: Wrap(
                                spacing: 10,
                                // alignment: WrapAlignment.spaceEvenly,
                                children: [
                                  CircularPercentIndicator(
                                    radius: 50.0,
                                    lineWidth: 10.0,
                                    animation: true,
                                    percent: 50.9 / 100,
                                    center: Text(
                                      "53.0%",
                                      style: textTheme(context)
                                          .bodyLarge
                                          ?.copyWith(fontWeight: FontWeight.w700),
                                    ),
                                    footer: Text(
                                      "Overall",
                                      style: textTheme(context)
                                          .bodyLarge
                                          ?.copyWith(fontWeight: FontWeight.w700),
                                    ),
                                    circularStrokeCap: CircularStrokeCap.round,
                                    progressColor: colorScheme(context).primary,
                                  ),
                                  if(accelerationAlert)
                                  CircularPercentIndicator(
                                    radius: 50.0,
                                    lineWidth: 10.0,
                                    animation: true,
                                    percent: 0.65,
                                    center: Text(
                                      "65.0%",
                                      style: textTheme(context)
                                          .bodyLarge
                                          ?.copyWith(fontWeight: FontWeight.w700),
                                    ),
                                    footer: Text(
                                      "Speeding",
                                      style: textTheme(context)
                                          .bodyLarge
                                          ?.copyWith(fontWeight: FontWeight.w700),
                                    ),
                                    circularStrokeCap: CircularStrokeCap.round,
                                    progressColor: colorScheme(context).primary,
                                  ),
                                  if(crashDetection)
                                  CircularPercentIndicator(
                                    radius: 50.0,
                                    lineWidth: 10.0,
                                    animation: true,
                                    percent: 0.1,
                                    center: Text(
                                      "1.0%",
                                      style: textTheme(context)
                                          .bodyLarge
                                          ?.copyWith(fontWeight: FontWeight.w700),
                                    ),
                                    footer: Text(
                                      "Crash",
                                      style: textTheme(context)
                                          .bodyLarge
                                          ?.copyWith(fontWeight: FontWeight.w700),
                                    ),
                                    circularStrokeCap: CircularStrokeCap.round,
                                    progressColor: colorScheme(context).primary,
                                  ),
                                  if(brakingAlert)
                                  CircularPercentIndicator(
                                    radius: 50.0,
                                    lineWidth: 10.0,
                                    animation: true,
                                    percent: 0.51,
                                    center: Text(
                                      "51.0%",
                                      style: textTheme(context)
                                          .bodyLarge
                                          ?.copyWith(fontWeight: FontWeight.w700),
                                    ),
                                    footer: Text(
                                      "Braking",
                                      style: textTheme(context)
                                          .bodyLarge
                                          ?.copyWith(fontWeight: FontWeight.w700),
                                    ),
                                    circularStrokeCap: CircularStrokeCap.round,
                                    progressColor: colorScheme(context).primary,
                                  ),
                                  if(textingAlert)
                                  CircularPercentIndicator(
                                    radius: 50.0,
                                    lineWidth: 10.0,
                                    animation: true,
                                    percent: 0.37,
                                    center: Text(
                                      "37.0%",
                                      style: textTheme(context)
                                          .bodyLarge
                                          ?.copyWith(fontWeight: FontWeight.w700),
                                    ),
                                    footer: Text(
                                      "Texting",
                                      style: textTheme(context)
                                          .bodyLarge
                                          ?.copyWith(fontWeight: FontWeight.w700),
                                    ),
                                    circularStrokeCap: CircularStrokeCap.round,
                                    progressColor: colorScheme(context).primary,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                    ],
                  ),
                ),
                // CustomRowWidget(
                //   onMenuTap: () {
                //     scaffoldKey.currentState!.openDrawer();
                //   },
                //   onArrowTap: () {},
                //   imageUrl:
                //       'https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg?t=st=1726641286~exp=1726644886~hmac=03d7151562e433d0a5ecf762f2d1dfd8d0e21e35cba5b2d415b608081c19502e&w=740',
                //   text: 'John Family',
                //   isOpen: isOpen,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
