import 'package:flutter/material.dart';

class HrDashboard extends StatelessWidget {
  const HrDashboard({super.key});
  static const routeName = '/hr-dashboard';

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('HR Dashboard')));
  }
}
