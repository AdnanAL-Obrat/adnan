// // import 'package:adnan_homework/pages/login.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_localizations/flutter_localizations.dart';

// // void main() async {
// //   runApp(const MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       localizationsDelegates: [
// //         GlobalMaterialLocalizations.delegate,
// //         GlobalWidgetsLocalizations.delegate,
// //         GlobalCupertinoLocalizations.delegate,
// //       ],
// //       supportedLocales: [
// //         const Locale('ar'), // دعم اللغة العربية
// //       ],
// //       debugShowCheckedModeBanner: false,
// //       home: LoginScreen(),
// //     );
// //   }
// // }

// import 'package:adnan_homework/muaath/Provider/Notifier/ThemeNotifier.dart';
// import 'package:adnan_homework/muaath/config/routes.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// void main() {

//   //runApp(const MyApp());
//   runApp(
//     ChangeNotifierProvider(
//       create: (context) => ThemeProvider(),
//       child: const MyApp(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     final themeProvider = Provider.of<ThemeProvider>(context);

//     bool isDarkMode = false;

//     return MaterialApp(
//       title: 'Flutter Demo',
//       themeMode: themeProvider.themeMode,  // Set theme mode based on the provider
//       theme: themeProvider.currentTheme,
//       initialRoute: baseRoute,
//       navigatorKey: RouterManager.navigatorKey,
//       onGenerateRoute: RouterManager.generateRoute,
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

import 'package:adnan_homework/dark_mode/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'theme_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // إضافة هذه السطر
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return MaterialApp(
        theme: themeController.isDarkMode.value
            ? ThemeData.dark()
            : ThemeData.light(),
        home: HomeScreen(),
      );
    });
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();

    return Scaffold(
      appBar: AppBar(title: Text("Dark Mode Example")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            themeController.toggleTheme();
          },
          child: Text(
              themeController.isDarkMode.value ? "Light Mode" : "Dark Mode"),
        ),
      ),
    );
  }
}
