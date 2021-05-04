import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import "package:flutter_sound/flutter_sound.dart";

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
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: Text(snapshot.hasData ? '${snapshot.data}' : ''),
                );
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            Recorder(),
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
      widget.channel.sink.add(_controller.text);
    }
  }

  @override
  void dispose() {
    widget.channel.sink.close();
    super.dispose();
  }
}

class Recorder extends StatefulWidget {
  @override
  _RecorderState createState() => _RecorderState();
}

class _RecorderState extends State<Recorder> {
  FlutterSoundPlayer _myPlayer = FlutterSoundPlayer();
  FlutterSoundRecorder _myRecorder = FlutterSoundRecorder();
  bool recorderIsInited;
  bool playerIsInited;
  final String _mPath = 'flutter_sound_example.aac';

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

  Future<void> record() async {
    await _myRecorder.startRecorder(toFile: _mPath, codec: Codec.aacADTS);
    setState(() {});
  }

  Future<void> stopRecorder() async {
    await _myRecorder.stopRecorder();
  }

  void play() async {
    await _myPlayer.startPlayer(
        fromURI: _mPath,
        codec: Codec.mp3,
        whenFinished: () {
          setState(() {});
        });
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
        IconButton(
          onPressed: record,
          iconSize: 30.0,
          icon: Icon(Icons.mic),
          tooltip: "Record",
        ),
        IconButton(
          onPressed: stopRecorder,
          iconSize: 30.0,
          icon: Icon(Icons.mic_off),
          tooltip: "Stop recording",
        ),
        IconButton(
          onPressed: play,
          iconSize: 30.0,
          icon: Icon(Icons.play_arrow),
          tooltip: "Play",
        ),
        IconButton(
          onPressed: stopPlayer,
          iconSize: 30.0,
          icon: Icon(Icons.stop),
          tooltip: "Stop",
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
    super.dispose();
  }
}
