class Album {
  int? collectionId;
  String? collectionType;
  String? collectionName;
  String? artworkUrl100;
  bool isFavorite = false;
  double? collectionPrice;
  String? releaseDate;

  Album(
      {this.collectionId,
      this.collectionType,
      this.collectionName,
      this.artworkUrl100,
      this.isFavorite = false,
      this.collectionPrice,
      this.releaseDate});

  Album.fromJson(Map<String, dynamic> json) {
    collectionId = json['collectionId'];
    collectionType = json['collectionType'];
    collectionName = json['collectionName'];
    artworkUrl100 = json['artworkUrl100'];
    collectionPrice = json['collectionPrice'];
    releaseDate = json['releaseDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['collectionId'] = collectionId;
    data['collectionType'] = collectionType;
    data['collectionName'] = collectionName;
    data['artworkUrl100'] = artworkUrl100;
    data['collectionPrice'] = collectionPrice;
    data['releaseDate'] = releaseDate;
    return data;
  }
}
