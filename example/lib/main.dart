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
        primarySwatch: Colors.blueGrey,
      ),
      home: new Scaffold(
        backgroundColor: Colors.transparent,
        body: new MusicPlayer(
          key: musicPlayerKey,
          onError: (e) {
            Scaffold.of(context).showSnackBar(
                  new SnackBar(
                    content: new Text(e),
                  ),
                );
          },
          textColor: Colors.white,
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
          artwork: new NetworkImage(coverArt),
        ),
      ),
    );
  }
}
