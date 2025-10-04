import 'package:flutter/material.dart';

import '../utils/wa_brand_colour.dart';
import 'calls_page.dart/calls_page.dart';
import 'camera_page/camera_preview.dart';
import 'chat_page/chat_page.dart';
import 'status_page/status_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 1, length: 4, vsync: this);
    _tabController.addListener(_handleTabIndex);
  }

  void _handleTabIndex() {
    // https://stackoverflow.com/a/53406169/13617136
    setState(() {
      print('setState called');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                title: Text(
                  widget.title,
                  style: TextStyle(
                      color: WaBrandColour.tealGreenLighter,
                      fontWeight: FontWeight.bold),
                ),
                actions: [
                  IconButton(
                      icon: Icon(Icons.more_vert),
                      onPressed: () {
                        print('menu');
                      })
                ],
                pinned: true,
                floating: true,
                bottom: TabBar(
                  controller: _tabController,
                  tabs: [
                    Tab(
                      icon: Icon(Icons.camera_alt),
                    ),
                    Tab(
                      text: 'Chats',
                    ),
                    Tab(
                      text: 'Status',
                    ),
                    Tab(
                      text: 'Calls',
                    ),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            controller: _tabController,
            children: [
              MyCameraPreview(),
              ChatPage(),
              Container(
                color: WaBrandColour.white,
                child: StatusPage(),
              ),
              Container(
                color: WaBrandColour.white,
                child: CallPage(),
              ),
            ],
          ),
        ),
        floatingActionButton: _fabsButton());
  }

  @override
  void dispose() {
    _tabController.dispose();
    _tabController.removeListener(_handleTabIndex);
    super.dispose();
  }

  Widget _fabsButton() {
    switch (_tabController.index) {
      case 1:
        return FloatingActionButton(
            child: Icon(Icons.message),
            onPressed: () {
              print('case 1');
            });
      case 2:
        return FloatingActionButton(
            child: Icon(Icons.camera_alt),
            onPressed: () {
              print('case 2');
            });
      case 3:
        return FloatingActionButton(
            child: Icon(Icons.call),
            onPressed: () {
              print('case 3');
            });
      default:
        return SizedBox.shrink();
    }
  }
}
