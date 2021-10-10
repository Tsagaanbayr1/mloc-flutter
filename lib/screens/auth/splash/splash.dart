import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mloc/core/assets.dart';
import 'package:mloc/screens/dashboard/dashboard.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    SchedulerBinding.instance!.addPostFrameCallback((_) async {
      await Future.delayed(Duration(milliseconds: 500));
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DashboardScreen()),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.indigo],
            stops: [0, 1],
          ),
        ),
        child: Center(
          child: Image.asset(
            Assets.pngLogo,
            width: 100,
          ),
        ),
      ),
    );
  }
}
