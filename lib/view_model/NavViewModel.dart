
import 'package:flutter/cupertino.dart';

import '../view/dashboard_view.dart';

class NavViewModel with ChangeNotifier {


  Widget _selectedWidgetScreen = const DashboardScreen();

  setNavScreenWidget(Widget widget) {
    _selectedWidgetScreen = widget;
    notifyListeners();
  }

  Widget getNavScreenWidget( ) {
    return _selectedWidgetScreen;
  }





}