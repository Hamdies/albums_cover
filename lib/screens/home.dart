import 'package:albums_cover/model/song.dart';
import 'package:albums_cover/model/songitem.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int count = 2;

  bool delayAimation = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Column(
      children: <Widget>[buildToolBar(), buildGrid()],
    );
  }

  Widget buildToolBar() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 10,
            ),
            Text(
              'Albums',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            InkWell(
                onTap: () async {
                  setState(() {
                    delayAimation = count == 1 ? true : false;
                  });
                  if (count == 1) {
                    await Future.delayed(Duration(milliseconds: 400));
                  }
                  setState(() {
                    delayAimation = false;
                    count == 1 ? count = 2 : count = 1;
                  });
                },
                child: Image.asset(
                    count == 1 ? 'assets/icon.png' : 'assets/list_icon.png')),
            SizedBox(
              width: 10,
            )
          ],
        ),
      ),
    );
  }

  Widget buildGrid() {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GridView.count(
        crossAxisCount: count,
        childAspectRatio: count == 2 ? 150 / 170 : 150 / 75,
        children:
            getSongs().map((e) => SongItem(e, count, delayAimation)).toList(),
      ),
    ));
  }

  List<Song> getSongs() {
    List<Song> songs = [];
    songs.add(Song(0, 'Sindbad', 'by Marwan Paplo', 'assets/1.png'));
    songs.add(Song(1, 'Star Boy', 'by The Weekend', 'assets/2.png'));
    songs.add(Song(2, 'AmriKKKa', 'by Abyusif', 'assets/3.png'));
    songs.add(Song(3, 'Gaw bar2!', 'by ShabJdeed', 'assets/4.png'));
    songs.add(Song(4, 'Free', 'by Marwan Paplo', 'assets/5.jpg'));
    songs.add(Song(5, '3la Ra7ty', 'by Wegz', 'assets/6.jpg'));

    return songs;
  }
}
