class Album {
  int? collectionId;
  String? wrapperType;
  String? collectionName;
  String? artworkUrl100;
  bool isFavorite = false;
  double? collectionPrice;
  String? releaseDate;

  Album(
      {this.collectionId,
        this.wrapperType,
      this.collectionName,
      this.artworkUrl100,
      this.isFavorite = false,
      this.collectionPrice,
      this.releaseDate});

  Album.fromJson(Map<String, dynamic> json) {
    collectionId = json['collectionId'];
    wrapperType = json['wrapperType'];
    collectionName = json['collectionName'];
    artworkUrl100 = json['artworkUrl100'];
    collectionPrice = json['collectionPrice'] ?? 0;
    releaseDate = json['releaseDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['collectionId'] = collectionId;
    data['wrapperType'] = wrapperType;
    data['collectionName'] = collectionName;
    data['artworkUrl100'] = artworkUrl100;
    data['collectionPrice'] = collectionPrice;
    data['releaseDate'] = releaseDate;
    return data;
  }
}
