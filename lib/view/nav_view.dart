

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:flutter_mvvm_project_practise/view/waehouse_screen_view.dart';

import '../utils/routes/routes_name.dart';
import 'dashboard_view.dart';
import 'login_view.dart';

class NavView extends StatefulWidget {
  const NavView({Key? key}) : super(key: key);

  @override
  State<NavView> createState() => _NavViewState();
}

class _NavViewState extends State<NavView> {
  Widget _selectedWidgetScreen = LoginView();
  @override
  Widget build(BuildContext context) {
    debugPrint("Build Method is calling ");

    return AdminScaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Admin Panel V2'),
      ),
      sideBar: SideBar(
        items: const [
          AdminMenuItem(
            title: 'Dashboard',
            route: RoutesName.dashboard,
            icon: Icons.dashboard,
          ),
          AdminMenuItem(
            title: 'Warehouse',
            route:RoutesName.warehouse,
            icon: Icons.store,
          ),
          AdminMenuItem(
            title: 'Login',
            route:RoutesName.login,
            icon: Icons.store,
          ),

          AdminMenuItem(
              title: 'Sale',
              route: '/',
              icon: Icons.dashboard,
              children: [
                AdminMenuItem(
                  title: 'New Sale',
                  route: '/',
                  icon: Icons.dashboard,
                ),
                AdminMenuItem(
                  title: 'All Sales',
                  route: '/',
                  icon: Icons.dashboard,
                ),

              ]
          ),
          AdminMenuItem(
              title: 'Purchase',
              route: '/',
              icon: Icons.dashboard,
              children: [
                AdminMenuItem(
                  title: 'New Purchase',
                  route: '/',
                  icon: Icons.dashboard,
                ),
                AdminMenuItem(
                  title: 'All Purchase',
                  route: '/',
                  icon: Icons.dashboard,
                ),

              ]
          ),
          AdminMenuItem(
              title: 'Cylinder Receive and Return',
              route: '/',
              icon: Icons.dashboard,
              children: [
                AdminMenuItem(
                  title: 'New Receive',
                  route: '/',
                  icon: Icons.dashboard,
                ),
                AdminMenuItem(
                  title: 'New Return',
                  route: '/',
                  icon: Icons.dashboard,
                ),

                AdminMenuItem(
                  title: 'All Receive and Return',
                  route: '/',
                  icon: Icons.dashboard,
                ),

              ]
          ),


        ],
        selectedRoute: '/',
        onSelected: (item) {
          if (item.route != null) {
            selectedScreenItem(item);
          }
        },

      ),
      body:SingleChildScrollView(
        child: _selectedWidgetScreen,
      ),

    );
  }


  selectedScreenItem(item){
    switch(item.route){
      case RoutesName.dashboard:
        setState(() {
          _selectedWidgetScreen = DashboardScreen();
        });
        break;


      case RoutesName.warehouse:
        setState(() {
          _selectedWidgetScreen = WarehouseView();
        });
        break;

      case RoutesName.login:
        setState(() {
          _selectedWidgetScreen = LoginView();
        });
        break;




      default:

        setState(() {
          _selectedWidgetScreen =  const Scaffold(
            body:  Center(
              child: Text('No route defined'),
            ),
          );
        });

        break;
    }
  }
}
