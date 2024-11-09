import 'package:flutter/material.dart';
import 'package:zoom_app/resources/auth_method.dart';
import 'package:zoom_app/screens/HistoryMeetingScreen.dart';
import 'package:zoom_app/screens/meeting_Screen.dart';
import 'package:zoom_app/utils/colors.dart';
import 'package:zoom_app/widgets/custom_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;
  onScreenChange(int page) {
    _page = page;
  }

  List<Widget> pages = [
    MeetingScreen(),
    const HistoryMeetingScreen(),
    const Center(child: Text("Contacts")),
    CustomButton(
      onpressed: () {
        AuthMethod().SignOut();
      },
      text: "Log Out",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: const Text("Meet & Chat"),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: footerColor,
        currentIndex: _page,
        unselectedFontSize: 14,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.comment_bank,
            ),
            label: "Meet & Chat",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.lock_clock,
            ),
            label: "Meetings",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
            ),
            label: "Contacts",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings_outlined,
            ),
            label: "Settings",
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(
          //     Icons.comment_bank,
          //   ),
          //   label: "Meet &Chat",
          // ),
        ],
        onTap: onScreenChange,
      ),
      body: pages[_page],
    );
  }
}
