import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teenage_safety/src/feature/auth_features/provider/hide_password_provider.dart';
import 'package:teenage_safety/src/feature/home/pages/drawer/provider/account.dart';
import 'package:teenage_safety/src/feature/home/pages/drawer/provider/change_admin_status_provider.dart';
import 'package:teenage_safety/src/feature/member_ship/provider/member_ship_provider.dart';
import 'package:teenage_safety/src/feature/safety/provider/safty_provider.dart';
import 'package:teenage_safety/src/router/routes.dart';
import 'package:teenage_safety/src/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => WatchOverProvider()),
        ChangeNotifierProvider(create: (context) => MemberShipProvider()),
        ChangeNotifierProvider(create: (context) => PasswordVisibilityProvider()),
        ChangeNotifierProvider(create: (context) => ChangeAdminStatusProvider()),
        ChangeNotifierProvider(create: (context) => AccountProvider()),

        ChangeNotifierProvider(
            create: (context) => PasswordVisibilityProvider()),
      ],
      child: MaterialApp.router(
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.instance.lightTheme,
        routerDelegate: MyAppRouter.router.routerDelegate,
        routeInformationParser: MyAppRouter.router.routeInformationParser,
        routeInformationProvider: MyAppRouter.router.routeInformationProvider,
      ),
    );
  }
}
