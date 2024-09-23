import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:teenage_safety/src/router/routes.dart';
import '../../../../common/const/app_images.dart';
import '../../../../common/const/global_variable.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(
                        AppIcons.logo,
                        height: 45,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context); // Closes the drawer
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border:
                                Border.all(color: colorScheme(context).outline),
                          ),
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 25,
                            child: Image.asset(AppIcons.exitIcon),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: colorScheme(context).outline,
                    height: 30,
                  ),
                  _buildDrawerItem(
                iconPath: AppIcons.notificationsIcon,
                title: "Notification",
                onTap: () {
                  context.pushNamed(AppRoute.notificationPage);
                 },
                context: context,
              ),
              _buildDrawerItem(
                iconPath: AppIcons.groupIcon,
                title: "Circle Management",
                onTap: () {
                  Navigator.pop(context);
                  context.pushNamed(AppRoute.circleManagement);
                },
                context: context,
              ),
              _buildDrawerItem(
                iconPath: AppIcons.locationsIcon,
                title: "Location Sharing",
                onTap: () {
                  Navigator.pop(context);
                  context.pushNamed(AppRoute.locationSharing);
                },
                context: context,
              ),
              _buildDrawerItem(
                iconPath: AppIcons.personIcon,
                title: "Account",
                onTap: () {
                  Navigator.pop(context);
                  context.pushNamed(AppRoute.account);
                },
                context: context,
              ),
              _buildDrawerItem(
                iconPath: AppIcons.carIcon,
                title: "Drive Direction",
                onTap: () {
                  Navigator.pop(context);
                  context.pushNamed(AppRoute.driveDirection);
                },
                context: context,
              ),
              _buildDrawerItem(
                iconPath: AppIcons.securityIcon,
                title: "Privacy & Security",
                onTap: () {
                  Navigator.pop(context);
                  context.pushNamed(AppRoute.privacyPolice);
                },
                context: context,
              ),
              _buildDrawerItem(
                iconPath: AppIcons.helpIcon,
                title: "Help Articles",
                onTap: () {
                  Navigator.pop(context);
                  context.pushNamed(AppRoute.helpArticle);
                },
                context: context,
              ),
              _buildDrawerItem(
                iconPath: AppIcons.chatIcon,
                title: "Chat With Support",
                onTap: () {
                  Navigator.pop(context);
                  context.pushNamed(AppRoute.contactUs);
                },
                context: context,
              ),
              _buildDrawerItem(
                iconPath: AppIcons.logoutIcon,
                title: "Logout",
                onTap: () {},
                context: context,
              ),
              _buildDrawerItem(
                iconPath: AppIcons.settingsIcon,
                title: "Settings",
                onTap: () {},
                context: context,
              ),
              const SizedBox(height: 40),
                ],
              ),
              
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerItem({
    required String iconPath,
    required String title,
    required VoidCallback onTap,
    required BuildContext context,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: SvgPicture.asset(
        iconPath,
      ),
      title: Text(
        title,
        style: textTheme(context).titleMedium,
      ),
      onTap: onTap,
    );
  }
}
