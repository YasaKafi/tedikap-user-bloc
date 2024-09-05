import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tedikap_user_bloc/common/theme.dart';
import 'package:tedikap_user_bloc/data/bloc_providers.dart';
import 'package:tedikap_user_bloc/firebase/notification_service.dart';
import 'package:tedikap_user_bloc/route/route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:tedikap_user_bloc/data/repository/global_variabel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'tedikap-messaging',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  deviceOrientation();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppProviders().providers,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        routeInformationParser: AppRouter.router.routeInformationParser,
        routerDelegate: AppRouter.router.routerDelegate,
        routeInformationProvider: AppRouter.router.routeInformationProvider,
        builder: (context, child) {
          final notificationService = NotificationService();
          notificationService.setupInteractMessage(context);
          notificationService.requestNotificationPermisions();
          notificationService.forgroundMessage();
          notificationService.firebaseInit(context);
          notificationService.getDeviceToken().then((value) {
            GlobalVariables.deviceToken = value;
            print('Device Token: ${GlobalVariables.deviceToken}');
          });
          return child!;
        },
      ),
    );
  }
}




