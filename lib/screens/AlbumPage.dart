import 'package:beta_acid/models/Album.dart';
import 'package:beta_acid/providers/AlbumProvider.dart';
import 'package:beta_acid/widgets/AlbumCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AlbumPage extends StatefulWidget {
  const AlbumPage({Key? key}) : super(key: key);

  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<AlbumProvider>(context, listen: false).fetchAlbumsList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Albums"),
        actions: [
          Selector<AlbumProvider, int>(
              builder: (context, favCount, child) => Padding(
                    child: Text(
                      favCount.toString(),
                      style: const TextStyle(
                          fontSize: 21, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    padding: const EdgeInsets.only(right: 30, top: 20),
                  ),
              shouldRebuild: (previous, next) => true,
              selector: (buildContext, albumsProvider) =>
                  albumsProvider.albumsFavCount)
        ],
      ),
      body: Center(
          child: Selector<AlbumProvider, List<Album>?>(
              builder: (context, albumsList, child) {
                return albumsList != null
                    ? ListView.builder(
                        itemCount: albumsList.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final album = albumsList.elementAt(index);
                          return AlbumCard(
                            id: album.collectionId!,
                            albumCoverImg: album.artworkUrl100!,
                            albumName: album.collectionName!,
                            albumPrice: album.collectionPrice!,
                            isFavorite: album.isFavorite,
                            releaseDate: album.releaseDate!,
                          );
                        })
                    : const CircularProgressIndicator();
              },
              shouldRebuild: (previous, next) => true,
              selector: (buildContext, albumsProvider) =>
                  albumsProvider.albumsList)),
    );
  }
}
