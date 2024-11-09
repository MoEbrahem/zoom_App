import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zoom_app/resources/jitsi_meet_methods.dart';
import 'package:zoom_app/widgets/HomeMeetingButton.dart';

class MeetingScreen extends StatelessWidget {
  MeetingScreen({
    super.key,
  });
  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();
  void createNewMeeting() async {
    var random = Random();
    String roomName = (random.nextInt(10000000) + 10000000).toString();
    _jitsiMeetMethods.createMeeting(
      roomName: roomName,
      isAudioMuted: true,
      isVideoMuted: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            HomeMeetingButton(
              onPressed: createNewMeeting,
              icon: Icons.videocam,
              text: "New Meeting",
            ),
            HomeMeetingButton(
              onPressed: () {
                Navigator.of(context).pushNamed("video-call");
              },
              icon: Icons.add_box_rounded,
              text: "Join Meeting",
            ),
            HomeMeetingButton(
              onPressed: () {},
              icon: Icons.calendar_today,
              text: "Schedule",
            ),
            HomeMeetingButton(
              onPressed: () {},
              icon: Icons.arrow_upward,
              text: "Share Screen",
            ),
          ],
        ),
        const Expanded(
            child: Center(
          child: Text(
            "Create/Join Meetings with just a click",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ))
      ],
    );
  }
}
