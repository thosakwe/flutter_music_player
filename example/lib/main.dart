import 'package:flutter/material.dart';
import 'package:music_player/music_player.dart';

void main() => runApp(new MyApp());

final GlobalKey<MusicPlayerState> musicPlayerKey = new GlobalKey();

const String coverArt =
        'https://images.rapgenius.com/4xo4vvlzcnbsluagktti85tf1.1000x1000x1.jpg',
    mp3Url = 'https://ia801000.us.archive.org/22/items/MagnaCarta/13.Bbc.mp3';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MusicPlayerExample(),
    );
  }
}

class MusicPlayerExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _MusicPlayerExampleState();
  }
}

class _MusicPlayerExampleState extends State<MusicPlayerExample> {
  MusicPlayerLoopKind loopKind;
  bool shuffle = false;

  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: new NetworkImage(coverArt),
          fit: BoxFit.cover,
          colorFilter: new ColorFilter.mode(
            Colors.black54,
            BlendMode.overlay,
          ),
        ),
      ),
      child: new Scaffold(
        backgroundColor: Colors.transparent,
        appBar: new AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                'NOW PLAYING',
                textScaleFactor: 0.60,
              ),
              const Text(
                'JAY Z - Holy Grail',
                textScaleFactor: 0.75,
              ),
            ],
          ),
        ),
        body: new Padding(
          padding: const EdgeInsets.only(bottom: 48.0),
          child: new MusicPlayer(
            onError: (e) {
              Scaffold.of(context).showSnackBar(
                    new SnackBar(
                      content: new Text(e),
                    ),
                  );
            },
            onSkipPrevious: () {},
            onSkipNext: () {},
            onCompleted: () {},
            onLoopChanged: (loop) {
              setState(() => this.loopKind = loop);
            },
            onShuffleChanged: (loop) {
              setState(() => this.shuffle = loop);
            },
            key: musicPlayerKey,
            textColor: Colors.white,
            loop: loopKind,
            shuffle: shuffle,
            url: mp3Url,
            title: const Text(
              'BBC',
              textAlign: TextAlign.center,
              textScaleFactor: 1.5,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            subtitle: const Text(
              'JAY Z - Holy Grail',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
