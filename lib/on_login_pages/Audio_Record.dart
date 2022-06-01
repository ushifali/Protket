import 'package:flutter/material.dart';
import 'package:protekt/on_login_pages/settings.dart';
import 'dart:async';
import 'dart:io';
import 'package:audio_session/audio_session.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

const int tSampleRate = 44000;
typedef _Fn = void Function();

class Audio_Record extends StatefulWidget {
  @override
  _RecordToStreamExampleState createState() => _RecordToStreamExampleState();
}

class _RecordToStreamExampleState extends State<Audio_Record> {
  FlutterSoundPlayer? _mPlayer = FlutterSoundPlayer();
  FlutterSoundRecorder? _mRecorder = FlutterSoundRecorder();
  bool _mPlayerIsInited = false;
  bool _mRecorderIsInited = false;
  bool _mplaybackReady = false;
  String? _mPath;
  StreamSubscription? _mRecordingDataSubscription;

  get child => null;

  Future<void> _openRecorder() async {
    var status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      throw RecordingPermissionException('Microphone permission not granted');
    }
    await _mRecorder!.openRecorder();

    final session = await AudioSession.instance;
    await session.configure(AudioSessionConfiguration(
      avAudioSessionCategory: AVAudioSessionCategory.playAndRecord,
      avAudioSessionCategoryOptions:
          AVAudioSessionCategoryOptions.allowBluetooth |
              AVAudioSessionCategoryOptions.defaultToSpeaker,
      avAudioSessionMode: AVAudioSessionMode.spokenAudio,
      avAudioSessionRouteSharingPolicy:
          AVAudioSessionRouteSharingPolicy.defaultPolicy,
      avAudioSessionSetActiveOptions: AVAudioSessionSetActiveOptions.none,
      androidAudioAttributes: const AndroidAudioAttributes(
        contentType: AndroidAudioContentType.speech,
        flags: AndroidAudioFlags.none,
        usage: AndroidAudioUsage.voiceCommunication,
      ),
      androidAudioFocusGainType: AndroidAudioFocusGainType.gain,
      androidWillPauseWhenDucked: true,
    ));

    setState(() {
      _mRecorderIsInited = true;
    });
  }

  @override
  void initState() {
    super.initState();
    // Be careful : openAudioSession return a Future.
    // Do not access your FlutterSoundPlayer or FlutterSoundRecorder before the completion of the Future
    _mPlayer!.openPlayer().then((value) {
      setState(() {
        _mPlayerIsInited = true;
      });
    });
    _openRecorder();
  }

  @override
  void dispose() {
    stopPlayer();
    _mPlayer!.closePlayer();
    _mPlayer = null;

    stopRecorder();
    _mRecorder!.closeRecorder();
    _mRecorder = null;
    super.dispose();
  }

  Future<IOSink> createFile() async {
    var tempDir = await getTemporaryDirectory();
    _mPath = '${tempDir.path}/flutter_sound_example.pcm';
    var outputFile = File(_mPath!);
    if (outputFile.existsSync()) {
      await outputFile.delete();
    }
    return outputFile.openWrite();
  }

  // ----------------------  Here is the code to record to a Stream ------------

  Future<void> record() async {
    assert(_mRecorderIsInited && _mPlayer!.isStopped);
    var sink = await createFile();
    var recordingDataController = StreamController<Food>();
    _mRecordingDataSubscription =
        recordingDataController.stream.listen((buffer) {
      if (buffer is FoodData) {
        sink.add(buffer.data!);
      }
    });
    await _mRecorder!.startRecorder(
      toStream: recordingDataController.sink,
      codec: Codec.pcm16,
      numChannels: 1,
      sampleRate: tSampleRate,
    );
    setState(() {});
  }
  // --------------------- (it was very simple, wasn't it ?) -------------------

  Future<void> stopRecorder() async {
    await _mRecorder!.stopRecorder();
    if (_mRecordingDataSubscription != null) {
      await _mRecordingDataSubscription!.cancel();
      _mRecordingDataSubscription = null;
    }
    _mplaybackReady = true;
  }

  _Fn? getRecorderFn() {
    if (!_mRecorderIsInited || !_mPlayer!.isStopped) {
      return null;
    }
    return _mRecorder!.isStopped
        ? record
        : () {
            stopRecorder().then((value) => setState(() {}));
          };
  }

  void play() async {
    assert(_mPlayerIsInited &&
        _mplaybackReady &&
        _mRecorder!.isStopped &&
        _mPlayer!.isStopped);
    await _mPlayer!.startPlayer(
        fromURI: _mPath,
        sampleRate: tSampleRate,
        codec: Codec.pcm16,
        numChannels: 1,
        whenFinished: () {
          setState(() {});
        }); // The readability of Dart is very special :-(
    setState(() {});
  }

  Future<void> stopPlayer() async {
    await _mPlayer!.stopPlayer();
  }

  _Fn? getPlaybackFn() {
    if (!_mPlayerIsInited || !_mplaybackReady || !_mRecorder!.isStopped) {
      return null;
    }
    return _mPlayer!.isStopped
        ? play
        : () {
            stopPlayer().then((value) => setState(() {}));
          };
  }

  // ----------------------------------------------------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    Widget makeBody() {
      return Column(
        children: [
          Stack(
            children: [
              Align(
                  alignment: Alignment(1, 0),
                  child: IconButton(
                    iconSize: 30,
                    icon: Icon(
                      Icons.settings,
                      color: Colors.black,
                    ),
                    onPressed: () {},
                  )),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Audio Record',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 40.0,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'SignikaNegative',
                    letterSpacing: 3.0,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Image.asset(
            'assets/images/mike.png',
            height: 150,
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(25),
            height: 100,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color.fromARGB(255, 243, 240, 237),
              border: Border.all(
                color: Color.fromARGB(255, 1, 2, 9),
                width: 1,
              ),
            ),
            child: Row(children: [
              ElevatedButton(
                onPressed: getRecorderFn(),
                //color: Colors.white,
                //disabledColor: Colors.grey,
                child: Text(
                  _mRecorder!.isRecording ? 'Stop' : 'Record',
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.amber,
                    textStyle: TextStyle(
                        fontSize: 22,
                        fontFamily: 'SignikaNegative',
                        letterSpacing: 1)),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                _mRecorder!.isRecording
                    ? 'Recording in progress'
                    : 'Recorder has stopped.',
                style: TextStyle(
                  fontFamily: 'SignikaNegative',
                  fontSize: 22,
                ),
              ),
            ]),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(25),
            height: 100,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xFFFAF0E6),
              border: Border.all(
                color: Color.fromARGB(255, 5, 6, 9),
                width: 1,
              ),
            ),
            child: Row(children: [
              ElevatedButton(
                onPressed: getPlaybackFn(),
                //color: Colors.white,
                //disabledColor: Colors.grey,
                child: Text(
                  _mPlayer!.isPlaying ? 'Stop' : 'Play',
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.amber,
                    textStyle: TextStyle(
                        fontSize: 22,
                        fontFamily: 'SignikaNegative',
                        letterSpacing: 1)),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                _mPlayer!.isPlaying
                    ? 'Playback in progress'
                    : 'Player is stopped',
                style: TextStyle(
                  fontFamily: 'SignikaNegative',
                  fontSize: 22,
                ),
              ),
            ]),
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 235, 240, 244),
      body: SafeArea(
          child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
              child: makeBody())),
    );
  }
}
