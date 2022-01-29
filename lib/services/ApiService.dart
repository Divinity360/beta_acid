import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:beta_acid/commons/constants.dart';
import 'package:beta_acid/models/Album.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<List<Album>?> fetchAlbums() async {
    var response = await http.get(Uri.parse(Constants.ALBUM_LOOKUP_URL));
    log(response.body);
    if (response.statusCode == HttpStatus.ok) {
      final results = json.decode(response.body)["results"];
      return results.map<Album>((item) => Album.fromJson(item)).toList();
    }
    return null;
  }
}
