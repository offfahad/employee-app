import 'package:employee/presentation/pages/dashboard/dashboard_page.dart';
import 'package:employee/presentation/pages/messages/message_page.dart';
import 'package:employee/presentation/pages/notification/notification_screen.dart';
import 'package:employee/presentation/pages/payroll_pages/payroll_page.dart';
import 'package:employee/presentation/pages/profile/profile_page.dart';
import 'package:employee/presentation/pages/shift_pages/shift_page.dart';
import 'package:employee/presentation/widgets/bottom_navbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  List screens = [
    const DashboardPage(),
    const ShiftPage(),
    const PayrollPage(),
    const MessagePage(),
    const NotificationPage(),
    const ProfilePage(),
  ];

  void changeIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      // floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: Icon(IconlyBold.plus),
      // ),
      body: screens[currentIndex],
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: BottomNavbar(
        currentIndex: currentIndex,
        ontap: changeIndex,
        messageCount: 10,
        notificationCount: 3,
      ),
    );
  }
}
