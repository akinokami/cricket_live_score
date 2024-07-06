class MatchModel {
  String? title;
  String? matchtime;
  String? venue;
  int? matchId;
  String? teamA;
  String? teamB;
  String? teamAImage;
  String? matchtype;
  String? teamBImage;
  String? result;
  String? imageUrl;

  MatchModel(
      {this.title,
      this.matchtime,
      this.venue,
      this.matchId,
      this.teamA,
      this.teamB,
      this.teamAImage,
      this.matchtype,
      this.teamBImage,
      this.result,
      this.imageUrl});

  MatchModel.fromJson(Map<String, dynamic> json) {
    title = json['Title'];
    matchtime = json['Matchtime'];
    venue = json['Venue'];
    matchId = json['MatchId'];
    teamA = json['TeamA'];
    teamB = json['TeamB'];
    teamAImage = json['TeamAImage'];
    matchtype = json['Matchtype'];
    teamBImage = json['TeamBImage'];
    result = json['Result'];
    imageUrl = json['ImageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Title'] = title;
    data['Matchtime'] = matchtime;
    data['Venue'] = venue;
    data['MatchId'] = matchId;
    data['TeamA'] = teamA;
    data['TeamB'] = teamB;
    data['TeamAImage'] = teamAImage;
    data['Matchtype'] = matchtype;
    data['TeamBImage'] = teamBImage;
    data['Result'] = result;
    data['ImageUrl'] = imageUrl;
    return data;
  }
}
