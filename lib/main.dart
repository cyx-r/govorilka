import 'package:flutter/material.dart';
import 'package:govorilka/ui/RecordingService.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:record_mp3/record_mp3.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  RecordingService service = RecordingService();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        recorderService: service,
      ),
    );
  }
}

// ignore: must_be_immutable
class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.recorderService});
  int _index = 0;
  RecordingService recorderService;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Permission.microphone.request();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 238, 61, 61),
        title: const Text("Speech recorder"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Try to record your speech"),
            Expanded(
              child: FloatingActionButton(
                onPressed: (){
                  setState(() {
                    widget.recorderService.stopRecord();
                  });
                },
                backgroundColor: const Color.fromARGB(255, 236, 85, 85),
                child: Icon(widget.recorderService.isRecording 
                  ? Icons.pause 
                  : Icons.play_arrow,
                ),
              ), 
            ),
          ],
        ),
      )
    );
  }
}
