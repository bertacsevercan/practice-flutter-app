import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import "package:flutter_sound/flutter_sound.dart";
import 'package:web_socket_channel/io.dart';
import "package:http/http.dart";
import 'dart:io';
import 'dart:typed_data';
import 'dart:async';

class WebSocketDemo extends StatefulWidget {
  final WebSocketChannel channel;

  WebSocketDemo({Key key, @required this.channel}) : super(key: key);
  @override
  _WebSocketDemoState createState() => _WebSocketDemoState();
}

class _WebSocketDemoState extends State<WebSocketDemo> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String msg;
    return Scaffold(
      backgroundColor: Colors.pink[200],
      appBar: AppBar(
        title: Text(
          "Practice App",
          style: TextStyle(
            fontFamily: "EmilysCandy",
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
          ),
        ),
        backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Form(
              child: TextFormField(
                controller: _controller,
                decoration: InputDecoration(labelText: 'Send a message'),
              ),
            ),
            StreamBuilder(
              stream: widget.channel.stream,
              builder: (context, snapshot) {
                msg = snapshot.hasData ? '${snapshot.data}' : '';
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: Text("Message from server: "),
                );
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            Recorder(
              url: msg,
              channel: IOWebSocketChannel.connect("ws://localhost:3000"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _sendMessage,
        tooltip: 'Send message',
        child: Icon(Icons.send),
      ),
    );
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      try {
        print("sending...");
        widget.channel.sink.add(_controller.text);
        print("sent!");
      } catch (e) {
        print("Error: $e");
      }
    }
  }

  @override
  void dispose() {
    widget.channel.sink.close();
    super.dispose();
  }
}

class Recorder extends StatefulWidget {
  final WebSocketChannel channel;
  String url;

  Recorder({Key key, @required this.channel, @required this.url})
      : super(key: key);
  @override
  _RecorderState createState() => _RecorderState();
}

class _RecorderState extends State<Recorder> {
  FlutterSoundPlayer _myPlayer = FlutterSoundPlayer();
  FlutterSoundRecorder _myRecorder = FlutterSoundRecorder();
  bool recorderIsInited;
  bool playerIsInited;
  final String _mPath = 'audio_msg.aac';
  StreamSubscription _mRecordingDataSubscription;
  final int tSampleRate = 44000;

  @override
  void initState() {
    _myRecorder.openAudioSession().then((value) => setState(() {
          recorderIsInited = true;
        }));

    _myPlayer.openAudioSession().then((value) => setState(() {
          playerIsInited = true;
        }));

    super.initState();
  }

  void _sendAudio(audio) {
    try {
      print("sending audio...");
      widget.channel.sink.add(audio);
      print("sent!");
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<void> record() async {
    var recordingDataController = StreamController<Food>();
    _mRecordingDataSubscription = recordingDataController.stream.listen(
      (buffer) {
        if (buffer is FoodData) {
          _sendAudio(buffer.data);
        }
      },
    );
    await _myRecorder.startRecorder(
      toStream: recordingDataController.sink,
      codec: Codec.pcm16,
      numChannels: 1,
      sampleRate: tSampleRate,
    );
    setState(() {});
  }

  Future<void> stopRecorder() async {
    if (_mRecordingDataSubscription != null) {
      await _mRecordingDataSubscription.cancel();
      _mRecordingDataSubscription = null;
    }
    await _myRecorder.stopRecorder();
    setState(() {});
  }

  void play() async {
    Uint8List buffer;
    //dynamic buffer;
    widget.channel.stream.listen((event) {
      buffer = event;
      print(buffer);
    });
    /* await _myPlayer.startPlayer(
        fromDataBuffer: buffer,
        codec: Codec.mp3,
        whenFinished: () {
          setState(() {});
        }); */
    await _myPlayer.startPlayerFromStream(
      codec: Codec.pcm16,
      numChannels: 1,
      sampleRate: tSampleRate,
    );

    await _myPlayer
        .feedFromStream(buffer)
        .onError((error, stackTrace) => print(error))
        .whenComplete(() => setState(() {}));
    setState(() {});
  }

  Future<void> stopPlayer() async {
    if (_myPlayer != null) {
      await _myPlayer.stopPlayer();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton.icon(
          onPressed: _myRecorder.isStopped ? record : stopRecorder,
          label: _myRecorder.isStopped
              ? Text("Record audio")
              : Text("Stop recording"),
          icon: _myRecorder.isStopped ? Icon(Icons.mic) : Icon(Icons.mic_off),
        ),
        SizedBox(
          width: 10.0,
        ),
        ElevatedButton.icon(
          onPressed: _myPlayer.isStopped ? play : stopPlayer,
          icon: _myPlayer.isStopped ? Icon(Icons.play_arrow) : Icon(Icons.stop),
          label: _myPlayer.isStopped ? Text("Play audio") : Text("Stop audio"),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _myRecorder.closeAudioSession();
    _myRecorder = null;
    _myPlayer.closeAudioSession();
    _myPlayer = null;
    widget.channel.sink.close();
    super.dispose();
  }
}
