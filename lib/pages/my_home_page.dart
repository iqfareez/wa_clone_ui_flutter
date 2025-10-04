import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/wa_brand_colour.dart';
import 'calls_page.dart/calls_page.dart';
import 'camera_page/camera_preview.dart';
import 'chat_page/chat_page.dart';
import 'communities_page/communities_page.dart';
import 'status_page/status_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        titleTextStyle: TextStyle(
          color: WaBrandColour.tealGreenLighter,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Fluttertoast.showToast(msg: 'Search button pressed');
            },
          ),
          IconButton(
            icon: const Icon(Icons.camera_alt_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyCameraPreview(),
                ),
              );
            },
          ),
          PopupMenuButton<String>(
            onSelected: (String value) {
              // do something
            },
            itemBuilder: (BuildContext context) {
              return {
                'New group',
                'New broadcast',
                'Linked devices',
                'Starred messages',
                'Settings'
              }.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: [
        ChatPage(),
        Container(
          color: WaBrandColour.white,
          child: StatusPage(),
        ),
        CommunitiesPage(),
        Container(
          color: WaBrandColour.white,
          child: CallPage(),
        ),
      ][currentPageIndex],
      floatingActionButton: _fabsButton(),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: FaIcon(FontAwesomeIcons.solidComment),
            icon: FaIcon(FontAwesomeIcons.comment),
            label: 'Chats',
          ),
          NavigationDestination(
            selectedIcon: FaIcon(FontAwesomeIcons.solidCompass),
            icon: FaIcon(FontAwesomeIcons.compass),
            label: 'Updates',
          ),
          NavigationDestination(
            selectedIcon: FaIcon(FontAwesomeIcons.solidAddressBook),
            icon: FaIcon(FontAwesomeIcons.addressBook),
            label: 'Community',
          ),
          NavigationDestination(
            selectedIcon: Badge(
                label: Text('2'),
                child: FaIcon(FontAwesomeIcons.solidEnvelope)),
            icon: Badge(
              label: Text('2'),
              child: FaIcon(FontAwesomeIcons.envelope),
            ),
            label: 'Calls',
          ),
        ],
      ),
    );
  }

  Widget _fabsButton() {
    switch (currentPageIndex) {
      case 0:
        return FloatingActionButton(
            child: Icon(Icons.message),
            onPressed: () {
              Fluttertoast.showToast(msg: 'Status button pressed');
            });
      case 1:
        return FloatingActionButton(
            child: Icon(Icons.camera_alt),
            onPressed: () {
              Fluttertoast.showToast(msg: 'Camera button pressed');
            });
      case 3:
        return FloatingActionButton(
            child: Icon(Icons.call),
            onPressed: () {
              Fluttertoast.showToast(msg: 'Call button pressed');
            });
      default:
        return SizedBox.shrink();
    }
  }
}
