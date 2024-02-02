import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:jum_app/controllers/auth.dart';
import 'package:jum_app/controllers/user.dart';
import 'package:jum_app/utils/routes.dart';
import 'package:jum_app/utils/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());
    const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics());
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Listener(
        onPointerDown: (_) {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.focusedChild?.unfocus();
          }
        },
        child: Phoenix(
          child: GetMaterialApp(
            onInit: () async {
              await Firebase.initializeApp(
                options: DefaultFirebaseOptions.currentPlatform,
              );
            },
            defaultTransition: Transition.cupertino,
            debugShowCheckedModeBanner: false,
            routes: AppRoutes.routes,
            initialRoute: '/login',
            title: 'Flutter Demo',
            theme: ThemeData(
                colorScheme: AppTheme.colorScheme,
                textTheme: AppTheme.textTheme,
                useMaterial3: true),
          ),
        ));
  }
}
