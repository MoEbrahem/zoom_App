import 'package:flutter/material.dart';
import 'package:jitsi_meet_v1/jitsi_meet.dart';
import 'package:zoom_app/resources/auth_method.dart';
import 'package:zoom_app/resources/jitsi_meet_methods.dart';
import 'package:zoom_app/utils/colors.dart';
import 'package:zoom_app/widgets/meeting_option.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({super.key});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  final AuthMethod _authMethod = AuthMethod();
  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();
  late TextEditingController roomNumberController;
  late TextEditingController userNameController;
  bool isAudioMuted = true;
  bool isVideoMuted = true;
  @override
  void initState() {
    roomNumberController = TextEditingController();
    userNameController =
        TextEditingController(text: _authMethod.user.displayName);
    super.initState();
  }

  @override
  void dispose() {
    roomNumberController.dispose();
    userNameController.dispose();
    JitsiMeet.removeAllListeners();
    super.dispose();
  }

  onJoinMeeting() {
    if (roomNumberController.text.isNotEmpty ) {
      _jitsiMeetMethods.createMeeting(
      roomName: roomNumberController.text,
      isAudioMuted: isAudioMuted,
      isVideoMuted: isVideoMuted,
    );
    }
    
  }

  onAudioMute(bool val) {
    setState(() {
      isAudioMuted = val;
    });
  }

  onVideoMute(bool val) {
    setState(() {
      isVideoMuted = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Join a Meeting",
          style: TextStyle(fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: backgroundColor,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 60,
            child: TextField(
              controller: roomNumberController,
              keyboardType: TextInputType.number,
              maxLines: 1,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                hintText: "Room ID",
                // hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
                contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0),
                filled: true,
                fillColor: secondaryBackgroundColor,
              ),
            ),
          ),
          SizedBox(
            height: 60,
            child: TextField(
              controller: userNameController,
              keyboardType: TextInputType.text,
              maxLines: 1,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                hintText: "UserName",

                // hintStyle: TextStyle(
                //   color: Colors.grey,
                //   fontSize: 16,
                // ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0),
                filled: true,
                fillColor: secondaryBackgroundColor,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: onJoinMeeting,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Join"),
            ),
          ),
          MeetingOption(
            text: "Mute Audio",
            onchange: onAudioMute,
            isMute: isAudioMuted,
          ),
          MeetingOption(
            text: "Mute Video",
            onchange: onVideoMute,
            isMute: isVideoMuted,
          ),
        ],
      ),
    );
  }
}
