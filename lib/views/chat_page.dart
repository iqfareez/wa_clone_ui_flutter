import 'package:flutter/material.dart';
import 'package:wa_clone_ui/mock%20data/chats_data.dart';

class ChatPage extends StatelessWidget {
  final ChatData _chatData = ChatData();
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return Divider(
          indent: 40,
          endIndent: 5,
        );
      },
      itemCount: 10,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage(_chatData.profilePicturePath[index]),
          ),
          title: Text(_chatData.name[index]),
          subtitle: Text(
            _chatData.randomChatText[index],
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Column(
            children: [Text(_chatData.randomTime[index])],
          ),
        );
      },
    );
  }
}
