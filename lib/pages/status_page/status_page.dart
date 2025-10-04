import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

import '../../main.dart';
import '../../utils/mock_chats_data.dart';
import '../../utils/wa_brand_colour.dart';
import '../camera_page/camera_preview.dart';

class StatusPage extends StatefulWidget {
  const StatusPage({Key? key}) : super(key: key);

  @override
  State<StatusPage> createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  late final CameraController controller;
  late final StoryController storyController;

  @override
  void initState() {
    super.initState();
    storyController = StoryController();
    controller = CameraController(cameras[0], ResolutionPreset.medium);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ListTile(
            title: Text('My status'),
            subtitle: Text('Tap to add status update'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyCameraPreview()));
            },
            leading: Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('images/dp/dpme.jpg'),
                  radius: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(360),
                    color: WaBrandColour.lightGreen,
                  ),
                  child: Icon(
                    Icons.add,
                    size: 20,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            color: Colors.grey.shade100,
            width: double.infinity,
            child: Text('Recent updates'),
          ),
          ListView.builder(
            itemCount: 5,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(MockChatData.name[index + 2]),
                subtitle: Text(MockChatData.statusDate[index]),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Scaffold(
                          body: StoryView(
                            storyItems: [
                              StoryItem.text(
                                  textStyle: TextStyle(fontSize: 20),
                                  title: MockChatData.randomStoriesText[index],
                                  backgroundColor:
                                      MockChatData.statusColor[index])
                            ],
                            controller: storyController,
                            onComplete: () {
                              Navigator.pop(context);
                            },
                            onVerticalSwipeComplete: (direction) {
                              if (direction == Direction.down) {
                                Navigator.pop(context);
                              }
                            },
                          ),
                        );
                      },
                    ),
                  );
                },
                leading: CircleAvatar(
                  radius: 29,
                  backgroundImage:
                      AssetImage('images/statuses/status (${index + 1}).jpg'),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
