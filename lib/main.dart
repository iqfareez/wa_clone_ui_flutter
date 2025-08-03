import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:wa_clone_ui/utils/wa_brand_colour.dart';

import 'views/my_home_page.dart';

late List<CameraDescription> cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Whatsdown',
      theme: ThemeData(
          primaryColor: WaBrandColour.tealGreenDarker,
          primarySwatch: Colors.teal),
      home: MyHomePage(title: 'Whatsdown'),
    );
  }
}
