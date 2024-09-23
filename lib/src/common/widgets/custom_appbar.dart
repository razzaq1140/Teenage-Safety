import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:teenage_safety/src/common/const/app_images.dart';
import 'package:teenage_safety/src/common/widgets/custom_elevated_button.dart';
import 'package:teenage_safety/src/feature/auth_features/circle_creation/pages/add_photo_page.dart';
import 'package:teenage_safety/src/router/routes.dart';

import '../const/global_variable.dart';

class CustomRowWidget extends StatefulWidget {
  final VoidCallback onMenuTap;
  final VoidCallback onArrowTap;
  final String imageUrl;
  final String text;
  final bool isOpen;
  final String backIcon;
  final VoidCallback? iconOnTap;

   const CustomRowWidget({
    super.key,
    required this.onMenuTap,
    required this.onArrowTap,
    required this.imageUrl,
    required this.text,
    this.backIcon = AppIcons.drawerIcon,
    this.isOpen = false,
    this.iconOnTap,
  });

  @override
  _CustomRowWidgetState createState() => _CustomRowWidgetState();
}

class _CustomRowWidgetState extends State<CustomRowWidget> {
  bool _isExpanded = false;
  int index = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: widget.onMenuTap,
              child: GestureDetector(
                onTap: widget.iconOnTap,
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: colorScheme(context).onPrimary,
                  child: SvgPicture.asset(
                    widget.backIcon,
                  ),
                ),
              ),
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(11)),
                color: colorScheme(context).onPrimary,
              ),
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  CircleAvatar(
                    child: CachedNetworkImage(
                      imageUrl: widget.imageUrl,
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
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      widget.text,
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
            GestureDetector(
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
          ],
        ),
        const SizedBox(height: 10),
        if (_isExpanded) // Show this container only when _isExpanded is true
          Container(
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
      ],
    );
  }
}
