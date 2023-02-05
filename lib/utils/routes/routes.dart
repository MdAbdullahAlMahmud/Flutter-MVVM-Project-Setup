import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_project_practise/utils/routes/routes_name.dart';
import 'package:flutter_mvvm_project_practise/view/dashboard_view.dart';
import 'package:flutter_mvvm_project_practise/view/home_screen.dart';
import 'package:flutter_mvvm_project_practise/view/login_view.dart';
import '';

class Routes{


  static Route<dynamic> generateRoute (RouteSettings settings){

    switch(settings.name){

      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context) => HomeScreen());

        case RoutesName.login:
        return MaterialPageRoute(builder: (BuildContext context) => LoginView());

        case RoutesName.dashboard:
        return MaterialPageRoute(builder: (BuildContext context) => DashboardScreen());

      default :
        return MaterialPageRoute(builder: (_){

          return const Scaffold(
            body:  Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }





}