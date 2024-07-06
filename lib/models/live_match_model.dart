class LiveMatchModel {
  String? jsonruns;
  String? jsondata;
  String? title;
  String? matchtime;
  String? venue;
  String? result;
  int? isfinished;
  int? ispriority;
  String? teamA;
  String? teamAImage;
  String? teamB;
  int? seriesid;
  String? teamBImage;
  String? imgeURL;
  String? matchType;
  String? matchDate;
  int? matchId;
  String? appversion;
  String? adphone;
  String? adimage;
  String? admsg;

  LiveMatchModel(
      {this.jsonruns,
      this.jsondata,
      this.title,
      this.matchtime,
      this.venue,
      this.result,
      this.isfinished,
      this.ispriority,
      this.teamA,
      this.teamAImage,
      this.teamB,
      this.seriesid,
      this.teamBImage,
      this.imgeURL,
      this.matchType,
      this.matchDate,
      this.matchId,
      this.appversion,
      this.adphone,
      this.adimage,
      this.admsg});

  LiveMatchModel.fromJson(Map<String, dynamic> json) {
    jsonruns = json['jsonruns'];
    jsondata = json['jsondata'];
    title = json['Title'];
    matchtime = json['Matchtime'];
    venue = json['venue'];
    result = json['Result'];
    isfinished = json['isfinished'];
    ispriority = json['ispriority'];
    teamA = json['TeamA'];
    teamAImage = json['TeamAImage'];
    teamB = json['TeamB'];
    seriesid = json['seriesid'];
    teamBImage = json['TeamBImage'];
    imgeURL = json['ImgeURL'];
    matchType = json['MatchType'];
    matchDate = json['MatchDate'];
    matchId = json['MatchId'];
    appversion = json['Appversion'];
    adphone = json['adphone'];
    adimage = json['adimage'];
    admsg = json['admsg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['jsonruns'] = jsonruns;
    data['jsondata'] = jsondata;
    data['Title'] = title;
    data['Matchtime'] = matchtime;
    data['venue'] = venue;
    data['Result'] = result;
    data['isfinished'] = isfinished;
    data['ispriority'] = ispriority;
    data['TeamA'] = teamA;
    data['TeamAImage'] = teamAImage;
    data['TeamB'] = teamB;
    data['seriesid'] = seriesid;
    data['TeamBImage'] = teamBImage;
    data['ImgeURL'] = imgeURL;
    data['MatchType'] = matchType;
    data['MatchDate'] = matchDate;
    data['MatchId'] = matchId;
    data['Appversion'] = appversion;
    data['adphone'] = adphone;
    data['adimage'] = adimage;
    data['admsg'] = admsg;
    return data;
  }
}
