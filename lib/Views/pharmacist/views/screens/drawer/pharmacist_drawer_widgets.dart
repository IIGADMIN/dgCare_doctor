import 'dart:io';
import 'package:flutter/material.dart';
import 'package:healthcaredoctor2050/widgets/app_widgets/app_custom_dialog.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../../../../utils/colors/colors.dart';
import '../../../../../widgets/screens/profile_selection/profile_selection_screen.dart';
import '../consultations/history/pharmacist_history_screen.dart';
import '../profile/pharmacist_profile_screen.dart';

class PharmacistDrawerWidgets extends StatefulWidget {
  const PharmacistDrawerWidgets({super.key});

  @override
  State<PharmacistDrawerWidgets> createState() =>
      _PharmacistDrawerWidgetsState();
}

class _PharmacistDrawerWidgetsState extends State<PharmacistDrawerWidgets> {
  @override
  Widget build(BuildContext context) {
    const name = '2050DgCarePro';
    return Drawer(
      backgroundColor: mainColor,
      child: ListView(
        children: <Widget>[
          buildHeader(
            name: name,
            onClicked: () async {
              const PharmacistProfileScreen().launch(context,
                  pageRouteAnimation: PageRouteAnimation.Slide);
            },
          ),
          const Divider(color: Colors.white70),
          buildMenuItem(
              text: 'Home',
              icon: Icons.home,
              onClicked: () {
                Navigator.of(context).pop();
              }),
          buildMenuItem(
              text: 'Appointment History',
              icon: Icons.history,
              onClicked: () {
                Navigator.of(context).pop();
                const PharmacistHistoryScreen().launch(context);
              }),
          const Divider(color: Colors.white70),
          buildMenuItem(
              text: 'Sign Out',
              icon: Icons.logout,
              onClicked: () async {
                showDialog(
                    barrierDismissible: true,
                    context: context,
                    builder: (ctx) => AppCustomDialog(
                          negativeText: 'Sign Out',
                          onNegative: () async {
                            SharedPreferences pref =
                                await SharedPreferences.getInstance();
                            pref.clear();
                            if (!mounted) return;
                            const ProfileSelectionScreen()
                                .launch(context, isNewTask: true);
                          },
                          positiveText: 'Cancel',
                          onPositive: () {
                            Navigator.of(context).pop();
                          },
                          title: 'Do you want to sign out?',
                        ));
              }),
          buildMenuItem(
            text: 'Exit',
            icon: Icons.exit_to_app,
            onClicked: () async => showDialog(
                barrierDismissible: true,
                context: context,
                builder: (ctx) => AppCustomDialog(
                      negativeText: 'Exit',
                      onNegative: () async {
                        exit(0);
                      },
                      positiveText: 'Cancel',
                      onPositive: () {
                        Navigator.of(context).pop();
                      },
                      title: 'Do you want to exit?',
                    )),
          ),
        ],
      ),
    );
  }

  Widget buildHeader({
    required String name,
    required VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 25,
                child: Image.asset(
                  "assets/logo/logo_png.png",
                  width: 30,
                  height: 30,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontFamily: "WorkSans"),
              ),
              20.width,
              const CircleAvatar(
                radius: 18,
                backgroundColor: Colors.white,
                child: Icon(Icons.arrow_forward, color: Colors.green),
              )
            ],
          ),
        ),
      );

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    const color = Colors.white;
    const hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: const TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }
}
