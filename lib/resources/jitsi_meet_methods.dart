import 'package:jitsi_meet_v1/feature_flag/feature_flag.dart';
import 'package:jitsi_meet_v1/jitsi_meet.dart';
import 'package:zoom_app/resources/auth_method.dart';
import 'package:zoom_app/resources/firebase_method.dart';

class JitsiMeetMethods {
  final AuthMethod _authMethod = AuthMethod();
  final FirebaseMethod _firebaseMethod = FirebaseMethod();
  createMeeting({
    required String roomName,
    required bool isAudioMuted,
    required bool isVideoMuted,
    String userName = '',
  }) async {
    try {
      FeatureFlag featureFlag = FeatureFlag();
      featureFlag.welcomePageEnabled = false;
      featureFlag.resolution = FeatureFlagVideoResolution
          .MD_RESOLUTION; // Limit video resolution to 360p
      String name = '';
      if (userName.isEmpty) {
        name = _authMethod.user.displayName!;
      } else {
        name = userName;
      }
      var options = JitsiMeetingOptions(room: roomName)
        ..userDisplayName = name
        ..userEmail = _authMethod.user.email
        ..userAvatarURL = _authMethod.user.photoURL // or .png
        ..audioOnly = true
        ..audioMuted = isAudioMuted
        ..videoMuted = isVideoMuted;
      _firebaseMethod.addToMeetingHistory(roomName);
      await JitsiMeet.joinMeeting(options);
    } catch (error) {
      print("error: $error");
    }
  }
}
