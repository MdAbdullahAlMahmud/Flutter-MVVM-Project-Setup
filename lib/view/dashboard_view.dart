
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:flutter_mvvm_project_practise/utils/routes/routes.dart';
import 'package:flutter_mvvm_project_practise/utils/routes/routes_name.dart';
import 'package:flutter_mvvm_project_practise/view/login_view.dart';

import 'home_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String selectedRoutedName = RoutesName.dashboard;
  Widget selectedRoutedScreen = DashboardScreen();

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Admin LTE'),
      ),
      sideBar: SideBar(
        items: const [
          AdminMenuItem(
            title: 'Dashboard',
            route: RoutesName.dashboard,
            icon: Icons.dashboard,
          ),

          AdminMenuItem(
            title: 'Login',
            route: RoutesName.login,
            icon: Icons.dashboard,
          ),

          AdminMenuItem(
            title: 'Homescreen',
            route: RoutesName.home,
            icon: Icons.dashboard,
          ),



          AdminMenuItem(
              title: 'Sales ',
              icon: Icons.file_copy,
              route: '/'
          ),
          AdminMenuItem(
              title: 'Purchase ',
              icon: Icons.file_copy,
              route: '/'
          ),
          AdminMenuItem(
              title: 'Receive Return',
              icon: Icons.file_copy,
              route: '/'
          ),

          AdminMenuItem(
              title: 'PaymentContraExpense',
              icon: Icons.file_copy,
              route: '/'
          ),




        ],
        selectedRoute: RoutesName.dashboard,
        onSelected: (item) {
          if (item.route != null) {

            generatePageRoute(item.route);


            debugPrint("Route Name ${item.route}");
          }
        },

      ),
      body:
      SingleChildScrollView(
        child: selectedRoutedScreen,

      ),
    );

  }
    generatePageRoute( route){
    switch(route){
      case RoutesName.home:
        setState(() {
          selectedRoutedScreen  = HomeScreen();
        });
        break;
      case RoutesName.login:
        setState(() {
          selectedRoutedScreen  = LoginView();
        });
        break;

      case RoutesName.dashboard:
        setState(() {
          selectedRoutedScreen  = DashboardScreen();
        });
        break;




      default :
        return const Scaffold(
          body:  Center(
            child: Text('No route defined'),
          ),
        );

    }


  }
}
