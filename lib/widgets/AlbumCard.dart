import 'package:beta_acid/models/Album.dart';
import 'package:beta_acid/providers/AlbumProvider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AlbumCard extends StatelessWidget {
  final Album album;
  final int id;
  final String albumName;
  final String albumCoverImg;
  final bool isFavorite;
  final double albumPrice;
  final String releaseDate;

  const AlbumCard(
      {Key? key,
      required this.id,
      required this.album,
      required this.albumName,
      required this.albumCoverImg,
      required this.isFavorite,
      required this.albumPrice,
      required this.releaseDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final albumProvider = Provider.of<AlbumProvider>(context, listen: false);
    final parsedReleaseDate = DateTime.parse(releaseDate);
    final formattedDate =
        DateFormat('yyyy-MM-dd hh:mm a').format(parsedReleaseDate);

    return Container(
        width: 100,
        margin: const EdgeInsets.symmetric(horizontal: 70, vertical: 10),
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              offset: const Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100.0),
              child: Image.network(
                albumCoverImg,
                fit: BoxFit.fill,
                height: 50,
                width: 50,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 3),
              child: Text(
                albumName,
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 3),
              child: Text(
                albumPrice.toString(),
                style:
                    const TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 3),
              child: Text(
                formattedDate,
                style:
                    const TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 3),
              child: IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: Colors.redAccent,
                  size: 15,
                ),
                onPressed: () => albumProvider.updateAlbumFavorite(album),
              ),
            ),
          ],
        ));
  }
}
