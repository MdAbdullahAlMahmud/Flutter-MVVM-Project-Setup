import 'package:flutter/material.dart';
import 'package:flutter_mvvm_project_practise/data/local/shred_pref.dart';
import 'package:flutter_mvvm_project_practise/utils/routes/routes.dart';
import 'package:flutter_mvvm_project_practise/utils/routes/routes_name.dart';
import 'package:flutter_mvvm_project_practise/view/dashboard_view.dart';
import 'package:flutter_mvvm_project_practise/view/nav_view.dart';
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
        debugShowCheckedModeBanner: false,
        title: 'Admin View',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
       home:const NavView(),
       // onGenerateRoute: Routes.generateRoute,
      ),

    );
  }
}

