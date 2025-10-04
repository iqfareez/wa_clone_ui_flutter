import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../utils/mock_chats_data.dart';
import 'components/chat_chip.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  int selectedChip = 0;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        if (index == 0) {
          return SizedBox(
            height: 70,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: MockChatData.messageCategories.length,
              shrinkWrap: true,
              // padding for beginning and end
              padding: EdgeInsets.all(8),
              itemBuilder: (context, index) {
                return ChatChip(
                  selected: index == selectedChip,
                  label: MockChatData.messageCategories[index],
                  onPressed: () {
                    setState(() {
                      selectedChip = index;
                    });
                  },
                );
              },
            ),
          );
        }
        return ListTile(
          onTap: () {
            Fluttertoast.showToast(
                msg: 'Chat with ${MockChatData.name[index]} tapped');
          },
          leading: CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage(MockChatData.profilePicturePath[index]),
          ),
          title: Text(MockChatData.name[index]),
          subtitle: Text(
            MockChatData.randomChatText[index],
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Column(
            children: [Text(MockChatData.randomTime[index])],
          ),
        );
      },
    );
  }
}
