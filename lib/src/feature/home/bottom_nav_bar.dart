import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:teenage_safety/src/common/const/app_images.dart';
import 'package:teenage_safety/src/common/const/global_variable.dart';
import 'package:teenage_safety/src/common/widgets/custom_elevated_button.dart';
import 'package:teenage_safety/src/feature/home/pages/children_driving_screen.dart';
import 'package:teenage_safety/src/feature/home/pages/drawer/drawer.dart';
import 'package:teenage_safety/src/feature/home/pages/driving.dart';
import 'package:teenage_safety/src/feature/home/pages/location.dart';
import 'package:teenage_safety/src/feature/member_ship/pages/member_ship_page.dart';
import 'package:teenage_safety/src/feature/safety/pages/safety_page.dart';

import '../../router/routes.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  bool _isExpanded = false;
  int index = 1;
  int currentIndex = 0;
  List<Widget> pages = [
    const LocationScreen(),
    const DrivingScreen(),
    const SafetyScreen(),
    const MemberShipPage(),
  ];

  List<BottomNavBarItem> bottomItems = [
    BottomNavBarItem(title: 'Location', iconPath: AppIcons.locationNavIcon),
    BottomNavBarItem(title: 'Driving', iconPath: AppIcons.drivingIcon),
    BottomNavBarItem(title: 'Safety', iconPath: AppIcons.safetyIcon),
    BottomNavBarItem(title: 'Membership', iconPath: AppIcons.membershipIcon),
  ];
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: scaffoldKey,
      drawer: AppDrawer(),
      backgroundColor: Colors.green,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leadingWidth: 80,
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(3.0),
          child: GestureDetector(
            onTap: () {
              scaffoldKey.currentState!.openDrawer();
            },
            child: CircleAvatar(
              radius: 25,
              backgroundColor: colorScheme(context).onPrimary,
              child: SvgPicture.asset(
                AppIcons.drawerIcon,
              ),
            ),
          ),
        ),
        title: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(11)),
            color: colorScheme(context).onPrimary,
          ),
          padding: const EdgeInsets.all(5),
          child: Row(
            children: [
              CircleAvatar(
                child: CachedNetworkImage(
                  imageUrl:
                      'https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg?t=st=1726641286~exp=1726644886~hmac=03d7151562e433d0a5ecf762f2d1dfd8d0e21e35cba5b2d415b608081c19502e&w=740',
                  imageBuilder: (context, imageProvider) => CircleAvatar(
                    radius: 20,
                    backgroundImage: imageProvider,
                  ),
                  placeholder: (context, url) => CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.grey[200],
                    child: const CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.grey[200],
                    child: const Icon(Icons.error),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  "John Family",
                  style: textTheme(context)
                      .bodyLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
                child: Icon(
                  _isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                ),
              ),
            ],
          ),
        ),
        actions: [
          SizedBox(width: 5,),
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: () {
                context.pushNamed(AppRoute.notificationPage);
              },
              child: CircleAvatar(
                radius: 25,
                backgroundColor: colorScheme(context).onPrimary,
                child: SvgPicture.asset(
                  AppIcons.newNotificationsIcon,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          pages[currentIndex],
          if (_isExpanded) // Show this container only when _isExpanded is true
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    color: colorScheme(context).onPrimary,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      ListTile(
                        contentPadding: const EdgeInsets.all(0),
                        leading: CircleAvatar(
                          radius: 25,
                          child: CachedNetworkImage(
                            imageUrl:
                                "https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg?t=st=1726641286~exp=1726644886~hmac=03d7151562e433d0a5ecf762f2d1dfd8d0e21e35cba5b2d415b608081c19502e&w=740",
                            imageBuilder: (context, imageProvider) => CircleAvatar(
                              radius: 25,
                              backgroundImage: imageProvider,
                            ),
                            placeholder: (context, url) => CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.grey[200],
                              child: const CircularProgressIndicator(),
                            ),
                            errorWidget: (context, url, error) => CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.grey[200],
                              child: const Icon(Icons.error),
                            ),
                          ),
                        ),
                        title: Text(
                          "John Family",
                          style: textTheme(context)
                              .bodyLarge
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        trailing: Icon(
                          Icons.check,
                          color: colorScheme(context).primary,
                          size: 35,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: CustomElevatedButton(
                              text: "Create a circle",
                              onPressed: () {
                                setState(() {
                                  index = 1;
                                });
                              },
                              textStyle: textTheme(context).bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0,
                                  fontSize: 13,
                                  color: index == 1
                                      ? colorScheme(context).onPrimary
                                      : colorScheme(context).onSurface),
                              buttonColor: index == 1
                                  ? colorScheme(context).primary
                                  : colorScheme(context).secondary,
                              height: 40,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: CustomElevatedButton(
                              text: "Join a circle",
                              onPressed: () {
                                setState(() {
                                  index = 2;
                                });
                              },
                              textStyle: textTheme(context).bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                  letterSpacing: 0,
                                  color: index == 2
                                      ? colorScheme(context).onPrimary
                                      : colorScheme(context).onSurface),
                              buttonColor: index == 2
                                  ? colorScheme(context).primary
                                  : colorScheme(context).secondary,
                              height: 40,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          Positioned(
            bottom: 10,
            left: 16,
            right: 16,
            child: Container(
              width: width,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                  color: colorScheme(context).surface,
                  borderRadius: BorderRadius.circular(8)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: bottomItems.asMap().entries.map((item) {
                  final bool isSelected = currentIndex == item.key;
                  return InkWell(
                    onTap: () => setState(() {
                      currentIndex = item.key;
                    }),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          height: 25,
                          item.value.iconPath,
                          color: isSelected
                              ? colorScheme(context).primary
                              : colorScheme(context).onSurface,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          item.value.title,
                          style: textTheme(context).bodySmall?.copyWith(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: isSelected
                                    ? colorScheme(context).primary
                                    : colorScheme(context).onSurface,
                              ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BottomNavBarItem {
  final String title;
  final String iconPath;

  BottomNavBarItem({required this.title, required this.iconPath});
}
