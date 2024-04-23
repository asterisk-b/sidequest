import 'package:flutter/material.dart';
import 'package:sidequest/features/home/chat/widgets/chat_appbar.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: ChatAppBar(),
        body: TabBarView(children: [
          Center(child: Text("World")),
          Center(child: Text("Guild")),
          Center(child: Text("Private")),
        ]),
      ),
    );
  }
}
