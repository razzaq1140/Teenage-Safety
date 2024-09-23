import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:teenage_safety/src/feature/auth_features/circle_creation/pages/add_home_page.dart';
import 'package:teenage_safety/src/feature/auth_features/circle_creation/pages/add_photo_page.dart';
import 'package:teenage_safety/src/feature/auth_features/circle_creation/pages/circle_create_page.dart';
import 'package:teenage_safety/src/feature/auth_features/circle_creation/pages/circle_join_page.dart';
import 'package:teenage_safety/src/feature/auth_features/circle_creation/pages/family_code_page.dart';
import 'package:teenage_safety/src/feature/auth_features/circle_creation/pages/new_circle_page.dart';
import 'package:teenage_safety/src/feature/auth_features/circle_creation/pages/permission_page.dart';
import 'package:teenage_safety/src/feature/auth_features/circle_creation/pages/select_role_page.dart';
import 'package:teenage_safety/src/feature/home/pages/drawer/account.dart';
import 'package:teenage_safety/src/feature/auth_features/forget_password/forget_create_password.dart';
import 'package:teenage_safety/src/feature/auth_features/forget_password/forgot_password_page.dart';
import 'package:teenage_safety/src/feature/auth_features/forget_password/forgot_verify_code_page.dart';
import 'package:teenage_safety/src/feature/home/pages/drawer/change_admin_status.dart';
import 'package:teenage_safety/src/feature/home/pages/drawer/circle_management.dart';
import 'package:teenage_safety/src/feature/home/pages/drawer/cotact_us.dart';
import 'package:teenage_safety/src/feature/home/pages/drawer/delete_circle_members.dart';
import 'package:teenage_safety/src/feature/home/pages/drawer/drive_direction.dart';
import 'package:teenage_safety/src/feature/home/pages/drawer/edit_circle_name.dart';
import 'package:teenage_safety/src/feature/home/pages/drawer/help_article.dart';
import 'package:teenage_safety/src/feature/home/pages/drawer/invite_member_to_family.dart';
import 'package:teenage_safety/src/feature/home/pages/drawer/location_sharing.dart';
import 'package:teenage_safety/src/feature/home/pages/drawer/my_role.dart';
import 'package:teenage_safety/src/feature/home/pages/drawer/privacy_policy.dart';
import 'package:teenage_safety/src/feature/member_ship/pages/member_ship_page.dart';
import 'package:teenage_safety/src/feature/auth_features/login/pages/email_login_page.dart';
import 'package:teenage_safety/src/feature/auth_features/login/pages/login_page.dart';
import 'package:teenage_safety/src/feature/auth_features/login/pages/phone_login_page.dart';
import 'package:teenage_safety/src/feature/auth_features/signup/pages/email_signup_page.dart';
import 'package:teenage_safety/src/feature/auth_features/signup/pages/phone_signup_page.dart';
import 'package:teenage_safety/src/feature/auth_features/signup/pages/signup_page.dart';
import 'package:teenage_safety/src/feature/auth_features/verification/pages/birthday_page.dart';
import 'package:teenage_safety/src/feature/auth_features/verification/pages/create_password_page.dart';
import 'package:teenage_safety/src/feature/auth_features/verification/pages/name_page.dart';
import 'package:teenage_safety/src/feature/auth_features/verification/pages/verify_code_page.dart';
import 'package:teenage_safety/src/feature/auth_features/welcome/pages/onboarding_page.dart';
import 'package:teenage_safety/src/feature/home/pages/driving.dart';
import 'package:teenage_safety/src/feature/home/pages/location.dart';
import 'package:teenage_safety/src/feature/member_ship/pages/payment_page.dart';
import 'package:teenage_safety/src/router/error_route.dart';
import 'package:teenage_safety/src/router/route_transition.dart';
import '../feature/home/bottom_nav_bar.dart';
import 'package:teenage_safety/src/feature/location/pages/notification_page.dart';
import '../feature/location/pages/add_geofence_page.dart';
import '../feature/location/pages/add_location_page.dart';
import '../feature/location/pages/check_in_page.dart';
import '../feature/location/pages/geofence_page.dart';
import '../feature/location/pages/message_page.dart';
import 'package:teenage_safety/src/feature/safety/pages/sending_alert.dart';
import 'package:teenage_safety/src/feature/safety/pages/watch_over_me.dart';
import '../feature/safety/pages/safety_page.dart';

class MyAppRouter {
  static final router = GoRouter(
    initialLocation: "/${AppRoute.onboardingPage}",
    routes: [
      GoRoute(
        name: AppRoute.emailLoginPage,
        path: "/${AppRoute.emailLoginPage}",
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const EmailLoginPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.loginPage,
        path: "/${AppRoute.loginPage}",
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const LoginPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.geofencePage,
        path: "/${AppRoute.geofencePage}",
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const GeofencePage(),
        ),
      ),
      GoRoute(
        name: AppRoute.onboardingPage,
        path: "/${AppRoute.onboardingPage}",
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const OnboardingPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.phoneLoginPage,
        path: "/${AppRoute.phoneLoginPage}",
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const PhoneLoginPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.signupPage,
        path: "/${AppRoute.signupPage}",
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const SignupPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.emailSignupPage,
        path: "/${AppRoute.emailSignupPage}",
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const EmailSignupPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.phoneSignupPage,
        path: "/${AppRoute.phoneSignupPage}",
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const PhoneSignupPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.verifyCodePage,
        path: "/${AppRoute.verifyCodePage}",
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const VerifyCodePage(),
        ),
      ),
      GoRoute(
        name: AppRoute.bottomNavBar,
        path: "/${AppRoute.bottomNavBar}",
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const BottomNavBar(),
        ),
      ),
      GoRoute(
        name: AppRoute.locationScreen,
        path: "/${AppRoute.locationScreen}",
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const LocationScreen(),
        ),
      ),
      GoRoute(
        name: AppRoute.safetyScreen,
        path: "/${AppRoute.safetyScreen}",
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const SafetyScreen(),
        ),
      ),
      GoRoute(
        name: AppRoute.drivingDcreen,
        path: "/${AppRoute.drivingDcreen}",
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const DrivingScreen(),
        ),
      ),
      GoRoute(
        name: AppRoute.membershipScreen,
        path: "/${AppRoute.membershipScreen}",
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const MemberShipPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.checkInPage,
        path: "/${AppRoute.checkInPage}",
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const CheckInPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.notificationPage,
        path: "/${AppRoute.notificationPage}",
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const NotificationPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.addLocationPage,
        path: "/${AppRoute.addLocationPage}",
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: AddLocationPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.addGeofencePage,
        path: "/${AppRoute.addGeofencePage}",
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const AddGeofencePage(),
        ),
      ),
      GoRoute(
        name: AppRoute.messagePage,
        path: "/${AppRoute.messagePage}",
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const MessagePage(),
        ),
      ),
      GoRoute(
        name: AppRoute.safety,
        path: "/${AppRoute.safety}",
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const SafetyScreen(),
        ),
      ),
      GoRoute(
        name: AppRoute.watchMePage,
        path: "/${AppRoute.watchMePage}",
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const WatchOverMePage(),
        ),
      ),
      GoRoute(
        name: AppRoute.sendingAlertPage,
        path: "/${AppRoute.sendingAlertPage}",
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const SendingAlertPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.memberShipPage,
        path: "/${AppRoute.memberShipPage}",
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const SendingAlertPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.createPassword,
        path: "/${AppRoute.createPassword}",
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const CreatePassword(),
        ),
      ),
      GoRoute(
        name: AppRoute.namePage,
        path: "/${AppRoute.namePage}",
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const NamePage(),
        ),
      ),
      GoRoute(
        name: AppRoute.birthdayPage,
        path: "/${AppRoute.birthdayPage}",
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const BirthdayPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.newCirclePage,
        path: "/${AppRoute.newCirclePage}",
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const NewCirclePage(),
        ),
      ),
      GoRoute(
        name: AppRoute.circleJoin,
        path: "/${AppRoute.circleJoin}",
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const CircleJoinPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.circleCreatePage,
        path: "/${AppRoute.circleCreatePage}",
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const CircleCreatePage(),
        ),
      ),
      GoRoute(
        name: AppRoute.selectRolePage,
        path: "/${AppRoute.selectRolePage}",
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const SelectRolePage(),
        ),
      ),
      GoRoute(
        name: AppRoute.familyCodePage,
        path: "/${AppRoute.familyCodePage}",
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const FamilyCodePage(),
        ),
      ),
      GoRoute(
        name: AppRoute.addPhotoPage,
        path: "/${AppRoute.addPhotoPage}",
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const AddPhotoPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.permissionRequestPage,
        path: "/${AppRoute.permissionRequestPage}",
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const PermissionRequestPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.paymentPage,
        path: "/${AppRoute.paymentPage}",
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const PaymentPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.circleManagement,
        path: "/${AppRoute.circleManagement}",
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const CircleManagementPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.editCircleName,
        path: "/${AppRoute.editCircleName}",
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const EditCircleNamePage(),
        ),
      ),
      GoRoute(
        name: AppRoute.myRole,
        path: "/${AppRoute.myRole}",
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const MyRolePage(),
        ),
      ),
      GoRoute(
        name: AppRoute.changeAdminStatus,
        path: "/${AppRoute.changeAdminStatus}",
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const ChangeAdminStatusPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.inviteMemberToFamily,
        path: "/${AppRoute.inviteMemberToFamily}",
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const InviteMemberToFamilyPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.deleteCircleMembers,
        path: "/${AppRoute.deleteCircleMembers}",
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const DeleteCircleMemberPage(),
        ),
      ),

      GoRoute(
        name: AppRoute.locationSharing,
        path: "/${AppRoute.locationSharing}",
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const LocationSharingPage(),
        ),
      ),

      GoRoute(
        name: AppRoute.account,
        path: "/${AppRoute.account}",
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const AccountPage(),
        ),
      ),

      GoRoute(
        name: AppRoute.driveDirection,
        path: "/${AppRoute.driveDirection}",
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const DriveDirectionPage(),
        ),
      ),

      GoRoute(
        name: AppRoute.privacyPolice,
        path: "/${AppRoute.privacyPolice}",
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const PrivacyPolicyPage(),
        ),
      ),

      GoRoute(
        name: AppRoute.helpArticle,
        path: "/${AppRoute.helpArticle}",
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const HelpArticlePage(),
        ),
      ),

      GoRoute(
        name: AppRoute.contactUs,
        path: "/${AppRoute.contactUs}",
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const ContactUsPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.addHomePage,
        path: "/${AppRoute.addHomePage}",
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const AddHomePage(),
        ),
      ),
      GoRoute(
        name: AppRoute.forgotPasswordpage,
        path: "/${AppRoute.forgotPasswordpage}",
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const ForgotPasswordPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.forgetCreatePassword,
        path: "/${AppRoute.forgetCreatePassword}",
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const ForgetCreatePassword(),
        ),
      ),
      GoRoute(
        name: AppRoute.forgotVerifyCodePage,
        path: "/${AppRoute.forgotVerifyCodePage}",
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const ForgotVerifyCodePage(),
        ),
      ),
    ],
    errorPageBuilder: (context, state) {
      return const MaterialPage(child: ErrorPage());
    },
  );

  static void clearAndNavigate(BuildContext context, String name) {
    while (context.canPop()) {
      context.pop();
    }
    context.pushReplacementNamed(name);
  }
}

class AppRoute {
//welcome screen
  static const String loginPage = 'login-Page';
  static const String onboardingPage = 'on-boarding-Page';
  static const String emailLoginPage = 'email-Login-Page';
  static const String phoneLoginPage = 'phone-Login-Page';
  static const String signupPage = 'signup-Page';
  static const String emailSignupPage = 'email-Signup-Page';
  static const String phoneSignupPage = 'phone-Signup-Page';
  static const String verifyCodePage = 'verify-Code-Page';
  static const String createPassword = 'create-Password';
  static const String namePage = 'name-Page';
  static const String birthdayPage = 'birthday-Page';
  static const String newCirclePage = 'new-Circle-Page';
  static const String circleJoin = 'circle-Join';
  static const String circleCreatePage = 'circle-Create-Page';
  static const String selectRolePage = 'select-Role-Page';
  static const String familyCodePage = 'family-Code-Page';
  static const String addPhotoPage = 'add-Photo-Page';
  static const String permissionRequestPage = 'permission-Request-Page';
  static const String addHomePage = 'add-Home-Page';
  static const String forgotPasswordpage = 'forgot-Password-page';
  static const String forgotVerifyCodePage = 'forgot-Verify-Code-Page';
  static const String forgetCreatePassword = 'forget-Create-Password';

  ///   [Home]
  static const String bottomNavBar = 'bottom-nav-bar';
  static const String locationScreen = 'location-screen';
  static const String drivingDcreen = 'driving-screen';
  static const String safetyScreen = 'safety-screen';
  static const String membershipScreen = 'membership-screen';

  //Notification screen
  static const String geofencePage = 'geofence_page';
  static const String addGeofencePage = 'add_geofence_page';
  static const String checkInPage = 'check_in_page';
  static const String addLocationPage = 'add_location_page';
  static const String messagePage = 'message_page';
  static const String notificationPage = 'notification_page';
  static const String safety = 'safety-page';
  static const String watchMePage = 'watch-me-page';
  static const String sendingAlertPage = 'sending-alert-page';
  static const String memberShipPage = 'member-ship-page';
  static const String paymentPage = 'payment-page';
  static const String circleManagement = 'circle-management-page';
  static const String editCircleName = 'edit-circle-name-page';
  static const String myRole = 'my-role-page';
  static const String changeAdminStatus = 'change-admin-status';
  static const String inviteMemberToFamily = 'invite-member-family';
  static const String deleteCircleMembers = 'delete-circle-members';
  static const String locationSharing = 'location-sharing';
  static const String account = 'account-page';
  static const String driveDirection = 'drive-direction-page';
  static const String privacyPolice = 'privacy-police-page';
  static const String helpArticle = 'help-article-page';
  static const String contactUs = 'contact-us-page';
}
