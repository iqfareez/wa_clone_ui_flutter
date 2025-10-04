import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'pages/my_home_page.dart';
import 'utils/wa_brand_colour.dart';

late List<CameraDescription> cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsDown',
      theme: ThemeData(
          primaryColor: WaBrandColour.tealGreenDarker,
          primarySwatch: Colors.teal),
      home: MyHomePage(title: 'WhatsDown'),
    );
  }
}
