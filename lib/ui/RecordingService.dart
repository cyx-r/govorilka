import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import 'package:record_mp3/record_mp3.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';

class RecordingService {

  RecordingService();

  bool isRecording = false;

  void startrecord() async{
    bool isPermissionGranted = await _checkPermission();
    if(isPermissionGranted && !isRecording){
      isRecording = true;
      RecordMp3.instance.start(
        await getFilePath(),
        (type) => throw Exception('error ocused when starting'),
      );
    } 
  }

  void stopRecord() async{
    if(isRecording){
      RecordMp3.instance.stop();
      isRecording = false;
    }
  }

  void submitRecord() async{
    //TODO: сабмит записи + setRecordInAPI
  }

  void setRecordInAPI() async{
    //TODO: метод который закидывает запись в бек
  }

  Future<String> getFilePath() async {
    final Directory storageDirectory = await getApplicationDocumentsDirectory();
    final String sdPath = '${storageDirectory.path}/record';
    final Directory d = Directory(sdPath);
    if (!d.existsSync()) {
      d.createSync(recursive: true);
    }
    return '$sdPath/demo.mp3';
  }

  Future<bool> _checkPermission() async{
    if(!await Permission.microphone.isGranted){
      PermissionStatus status =  await Permission.microphone.request();
      if(status == PermissionStatus.granted){
        return true;
      }
    }
    return true;
  }
}
