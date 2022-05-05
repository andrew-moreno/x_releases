import 'package:flutter/material.dart';

import '../../constraints.dart';
import '../../models/release_data.dart';
import 'local widgets/history_tile.dart';

class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);

  static const routeName = "/history";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: const Color(0xFF2E2E3E),
              floating: true,
              title: Text(
                "History",
                style: Theme.of(context).textTheme.headline4,
              ),
              elevation: 100,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((_, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: HistoryTile(
                    title: ReleaseData().releases[index].title,
                    artist: ReleaseData().releases[index].artist,
                    albumArt: ReleaseData().releases[index].albumArt,
                    releaseDate: ReleaseData().releases[index].releaseDate,
                  ),
                );
              }, childCount: ReleaseData().releases.length),
            )
          ],
        ),
      ),
    );
  }
}
