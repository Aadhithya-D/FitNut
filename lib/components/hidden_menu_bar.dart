import 'package:fitnut/screens/home_screen.dart';
import 'package:fitnut/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

class HiddenMenu extends StatefulWidget {
  const HiddenMenu({Key? key}) : super(key: key);

  @override
  State<HiddenMenu> createState() => _HiddenMenuState();
}

class _HiddenMenuState extends State<HiddenMenu> {
  List<ScreenHiddenDrawer> pages = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pages = [
      ScreenHiddenDrawer(
          ItemHiddenMenu(
            name: "Home",
            baseStyle: GoogleFonts.oswald(
                fontSize: 20, color: const Color(0xFFEEEEEE)),
            selectedStyle: GoogleFonts.oswald(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFEEEEEE)),
          ),
          const HomeScreen()),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
            name: "Profile",
            baseStyle: GoogleFonts.oswald(
                fontSize: 20, color: const Color(0xFFEEEEEE)),
            selectedStyle: GoogleFonts.oswald(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: const Color(0xFFEEEEEE)),
          ),
          const ProfileScreen())
    ];
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      screens: pages,
      backgroundColorMenu: const Color(0xFF393E46),
      initPositionSelected: 0,
      slidePercent: 50,
      backgroundColorAppBar: const Color(0xFF222831),
      elevationAppBar: 0,
      tittleAppBar: Padding(
        padding: const EdgeInsets.only(left: 80),
        child: Text(
          "FITNUT",
          style: GoogleFonts.oswald(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: const Color(0xFFEEEEEE)),
        ),
      ),
    );
  }
}
