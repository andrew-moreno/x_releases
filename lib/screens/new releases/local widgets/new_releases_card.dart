import 'package:flutter/material.dart';
import 'package:x_release/screens/new%20releases/local%20widgets/new_releases_albumart.dart';
import 'package:x_release/widgets/release_text_info.dart';

import '../../../models/music.dart';

class ReleaseCard extends StatelessWidget {
  const ReleaseCard({
    Key? key,
    required this.id,
    required this.title,
    required this.artist,
    required this.albumArt,
    required this.tracks,
  }) : super(key: key);

  final int id;
  final String title;
  final String artist;
  final String albumArt;
  final List<String> tracks;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(
            "/release-details",
            arguments: Music(
                id: id,
                title: title,
                artist: artist,
                albumArt: albumArt,
                releaseDate: "null",
                tracks: tracks),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AlbumArt(albumArt: albumArt),
            ReleaseTextInfo(
                title: title, artist: artist, trackCount: tracks.length)
          ],
        ),
      ),
    );
  }
}
