import 'package:employee/const.dart';
import 'package:employee/presentation/pages/messages/message_page.dart';
import 'package:employee/presentation/pages/notification/notification_screen.dart';
import 'package:employee/presentation/pages/payroll_pages/payroll_page.dart';
import 'package:employee/presentation/pages/profile/profile_page.dart';
import 'package:employee/presentation/pages/shift_pages/shift_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardPage> {
  List catNames = [
    'Shifts',
    'Payrolls',
    'Messages',
    'Notifications',
  ];

  List<Color> catColors = [
    const Color(0xFFFFCF2F),
    const Color(0xFF6FE08D),
    Color.fromARGB(255, 30, 93, 148),
    const Color(0xFFFC7C7F),
  ];

  List<Icon> catIcons = [
    const Icon(
      Icons.access_time_filled,
      color: Colors.white,
      size: 30,
    ),
    const Icon(
      Icons.payments,
      color: Colors.white,
      size: 30,
    ),
    const Icon(
      Icons.message,
      color: Colors.white,
      size: 30,
    ),
    const Icon(
      Icons.notifications,
      color: Colors.white,
      size: 30,
    ),
  ];

  List<Widget> screens = [
    const ShiftPage(),
    const PayrollPage(),
    const MessagePage(),
    const NotificationPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text(
          "Home",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          InkWell(onTap: () => Get.to(const ProfilePage()),child: const CircleAvatar(radius: 15,backgroundImage: AssetImage('assets/images/userBlue.png'),)),
          const SizedBox(width: 25,),
        ],
      ),
      
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome, John Doe",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.20,
              
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 2),
                      blurRadius: 6.0),
                ],
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Upcoming Shift",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Date: Semptember 30, 2024",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.normal),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          "Time: 9:00 AM - 5:00 PM",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.normal),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          "Location: Office Building",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.normal),
                        ),
                        // Container(
                        //   width: double.infinity,
                        //   height: 100,
                        //   decoration: const BoxDecoration(
                        //     color: Colors.white,
                        //     boxShadow: [
                        //       BoxShadow(
                        //           color: Colors.black12,
                        //           offset: Offset(0, 2),
                        //           blurRadius: 6.0),
                        //     ],
                        //   ),
                        //   child: const Padding(
                        //     padding: EdgeInsets.all(8.0),
                        //     child: Column(
                        //       crossAxisAlignment: CrossAxisAlignment.start,
                        //       children: [
                        //         Text(
                        //           "Date: Semptember 30, 2024",
                        //           style: TextStyle(
                        //               fontSize: 16,
                        //               fontWeight: FontWeight.normal),
                        //         ),
                        //         SizedBox(
                        //           height: 3,
                        //         ),
                        //         Text(
                        //           "Time: 9:00 AM - 5:00 PM",
                        //           style: TextStyle(
                        //               fontSize: 16,
                        //               fontWeight: FontWeight.normal),
                        //         ),
                        //         SizedBox(
                        //           height: 3,
                        //         ),
                        //         Text(
                        //           "Location: Office Building",
                        //           style: TextStyle(
                        //               fontSize: 16,
                        //               fontWeight: FontWeight.normal),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.only(top: 10, left: 0, right: 0),
              child: Column(
                children: [
                  GridView.builder(
                    itemCount: catNames.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.1,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(screens[index]);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(0, 2),
                                  blurRadius: 6.0),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                    color: catColors[index],
                                    shape: BoxShape.circle),
                                child: Center(
                                  child: catIcons[index],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                catNames[index],
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black54),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
