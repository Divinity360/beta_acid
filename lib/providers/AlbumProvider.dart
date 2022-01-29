import 'package:beta_acid/commons/constants.dart';
import 'package:beta_acid/models/Album.dart';
import 'package:beta_acid/services/ApiService.dart';
import 'package:flutter/material.dart';

class AlbumProvider with ChangeNotifier {
  List<Album>? _albumsList;

  List<Album>? get albumsList => _albumsList;

  Future fetchAlbumsList() async {
    List<Album>? response = await ApiService.fetchAlbums();
    if (response != null) {
      _albumsList = response
          .where((album) => album.wrapperType == Constants.ALBUM_WRAPPER_TYPE)
          .toList();
    }
    notifyListeners();
  }


}
