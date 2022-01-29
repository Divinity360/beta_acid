import 'package:beta_acid/models/Album.dart';
import 'package:beta_acid/services/ApiService.dart';
import 'package:flutter/material.dart';

class AlbumProvider extends ChangeNotifier {
  late List<Album> _albumsList;

  List<Album> get albumsList => _albumsList;

  Future fetchAlbumsList() async {
    var response = await ApiService.fetchAlbums();
    if (response != null) {
      _albumsList = response;
    }
    notifyListeners();
  }
}
