// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zoom_app/resources/firebase_method.dart';

class HistoryMeetingScreen extends StatelessWidget {
  const HistoryMeetingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseMethod().meetingHistory,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.data == null) {
          return const Center(
            child: Text("No History!"),
          );
        }

        return ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(
            height: 10,
          ),
          padding: const EdgeInsets.all(8),
          itemCount: (snapshot.data! as dynamic).docs.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(
                "Room Name : ${(snapshot.data! as dynamic).docs[index]['MeetingName']}"),
            subtitle:
                Text("Joined on :  ${DateFormat.yMMMMd().format( (snapshot.data! as dynamic).docs[index]['createdAt'].toDate())}"),
          ),
        );
      },
    );
  }
}
