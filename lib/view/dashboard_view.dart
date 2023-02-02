
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:flutter_mvvm_project_practise/utils/routes/routes.dart';
import 'package:flutter_mvvm_project_practise/utils/routes/routes_name.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Admin Panel'),
      ),
      sideBar: SideBar(
        items: const [
          AdminMenuItem(
            title: 'Dashboard',
            route: '/',
            icon: Icons.dashboard,
          ),
          AdminMenuItem(
            title: 'Warehouse',
            route:RoutesName.warehouse,
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
            Routes.adminViewRoute(item.route.toString());
          }
        },

      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(10),
          child: const Text(
            'Dashboard',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 36,
            ),
          ),
        ),
      ),
    );
  }
}