import 'package:employee/const.dart';
import 'package:employee/presentation/pages/authentication/forget_password_mail.dart';
import 'package:employee/presentation/pages/authentication/login_page.dart';
import 'package:employee/presentation/pages/profile/profile_menu_widget.dart';
import 'package:employee/presentation/pages/profile/update_profile_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: primaryColor,
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.white),
        ),
      ),

      // actions: [
      //   IconButton(
      //       onPressed: () {},
      //       icon: Icon(
      //           isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.moon))
      // ],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 130,
                height: 130,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    "assets/images/userBlue.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text("John Doe",
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(
                height: 5,
              ),
              Text("Lutterworth, Leicestershire, LE17 4XP",
                  style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(
                height: 5,
              ),
              Text("Johndoe999@gmail.com",
                  style: Theme.of(context).textTheme.bodyMedium),
               const SizedBox(
                height: 5,
              ),
              Text("+51-3243532-21",
                  style: Theme.of(context).textTheme.bodyMedium),
               

              /// -- IMAGE
              //if (!kIsWeb)
              //const SizedBox(height: 150,),

              const SizedBox(height: 20),

              /// -- BUTTON
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () => Get.to(() => const UpdateProfileScreen()),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    side: BorderSide.none,
                    shape: const StadiumBorder(),
                  ),
                  child: const Text(
                    "Edit Profile",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 10),

              /// -- MENU
              // ProfileMenuWidget(
              //     title: "Settings",
              //     icon: LineAwesomeIcons.cog,
              //     onPress: () {}),
              // ProfileMenuWidget(
              //     title: "Billing Details",
              //     icon: LineAwesomeIcons.wallet,
              //     onPress: () {}),
              //if (screenWidth >= 800)
              // ProfileMenuWidget(
              //   title: "Address Info",
              //   icon: Icons.place,
              //   onPress: () {
              //     //Get.to(() => const DrawingResponsiveLayout());
              //   },
              // ),
              // ProfileMenuWidget(
              //     title: "Drawing Practice Mode",
              //     icon: Icons.draw,
              //     onPress: () {
              //       Get.to(() => const DrawingScreenWithoutLive());
              //     }),
              //if (screenWidth >= 800) const SizedBox(height: 10),
              //if (screenWidth >= 800)

              //if (screenWidth >= 800) const Divider(),
              //const SizedBox(height: 10),
              ProfileMenuWidget(
                  title: "Reset Password",
                  icon: Icons.password,
                  onPress: () {
                    Get.to(() => const ForgetPasswordMailScreen());
                  }),

              const SizedBox(height: 10),
              ProfileMenuWidget(
                title: "Logout",
                icon: IconlyBold.logout,
                textColor: Colors.red,
                endIcon: false,
                onPress: () async {
                  await _showLogoutDialog();
                },
              ),

              const Divider(),
              const SizedBox(height: 10),
              Text(
                'Developed By @offfahad',
                style: Theme.of(context).textTheme.bodyMedium,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showLogoutDialog() async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: const Text('LOGOUT'),
            content: const Text('Are you sure, you want to Logout?'),
            actions: [
              OutlinedButton(
                onPressed: () => Get.back(),
                child: const Text("No"),
              ),
              ElevatedButton(
                onPressed: () => Get.offAll(LoginPage()),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, side: BorderSide.none),
                child: const Text("Yes"),
              ),
            ],
          );
        });
  }
}
