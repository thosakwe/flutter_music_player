import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class MusicPlayer extends StatefulWidget {
  final Widget artwork;

  const MusicPlayer({@required this.artwork});

  @override
  State<StatefulWidget> createState() {
    return new MusicPlayerState();
  }
}

class MusicPlayerState extends State<MusicPlayer> {
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[],
    );
  }
}
