import 'package:flutter/material.dart';
import 'package:flutter_mvvm_project_practise/data/local/shred_pref.dart';
import 'package:flutter_mvvm_project_practise/utils/routes/routes.dart';
import 'package:flutter_mvvm_project_practise/utils/routes/routes_name.dart';
import 'package:flutter_mvvm_project_practise/view/dashboard_view.dart';
import 'package:flutter_mvvm_project_practise/view/home_screen.dart';
import 'package:flutter_mvvm_project_practise/view/login_view.dart';
import 'package:flutter_mvvm_project_practise/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => AuthViewModel())
    ],
      child:  MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: RoutesName.dashboard,
        home: const DashboardScreen(),
        routes: {
          RoutesName.dashboard :(context) =>DashboardScreen(),
          RoutesName.login :(context) =>LoginView(),
          RoutesName.home :(context) =>HomeScreen(),
        },
      ),

    );
  }
}

