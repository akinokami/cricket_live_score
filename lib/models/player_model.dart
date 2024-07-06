class PlayerModel {
  String? teamName;
  String? playerName;
  int? matchId;
  String? teamRuns;
  String? playerImage;
  int? runs;
  String? teamSide;
  int? balls;
  int? four;
  int? six;
  int? seqno;
  String? outby;
  int? inning;
  int? isnotout;

  PlayerModel(
      {this.teamName,
      this.playerName,
      this.matchId,
      this.teamRuns,
      this.playerImage,
      this.runs,
      this.teamSide,
      this.balls,
      this.four,
      this.six,
      this.seqno,
      this.outby,
      this.inning,
      this.isnotout});

  PlayerModel.fromJson(Map<String, dynamic> json) {
    teamName = json['TeamName'];
    playerName = json['PlayerName'];
    matchId = json['MatchId'];
    teamRuns = json['TeamRuns'];
    playerImage = json['PlayerImage'];
    runs = json['Runs'];
    teamSide = json['TeamSide'];
    balls = json['Balls'];
    four = json['four'];
    six = json['six'];
    seqno = json['seqno'];
    outby = json['outby'];
    inning = json['inning'];
    isnotout = json['isnotout'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['TeamName'] = teamName;
    data['PlayerName'] = playerName;
    data['MatchId'] = matchId;
    data['TeamRuns'] = teamRuns;
    data['PlayerImage'] = playerImage;
    data['Runs'] = runs;
    data['TeamSide'] = teamSide;
    data['Balls'] = balls;
    data['four'] = four;
    data['six'] = six;
    data['seqno'] = seqno;
    data['outby'] = outby;
    data['inning'] = inning;
    data['isnotout'] = isnotout;
    return data;
  }
}
