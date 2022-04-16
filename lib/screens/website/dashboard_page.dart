import 'package:flutter/material.dart';
import 'Responsive/dashboard_desktop.dart';
import 'Responsive/dashboard_mobile.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Scaffold(body: LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 1150 || constraints.maxHeight < 870) {
          return DashboardMobile(size: _size);
        } else {
          return DashboardDesktop(size: _size);
        }
      },
    ));
  }
}
