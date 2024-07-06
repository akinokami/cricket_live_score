class OddModel {
  String? score;
  String? sessionA;
  String? sessionB;
  String? overs;
  int? matchId;
  String? battingteam;
  String? wickets;
  String? mrateA;
  String? mrateB;
  String? favourite;
  String? isfirstinning;
  String? subdate;
  String? teamruns;
  int? id;

  OddModel(
      {this.score,
      this.sessionA,
      this.sessionB,
      this.overs,
      this.matchId,
      this.battingteam,
      this.wickets,
      this.mrateA,
      this.mrateB,
      this.favourite,
      this.isfirstinning,
      this.subdate,
      this.teamruns,
      this.id});

  OddModel.fromJson(Map<String, dynamic> json) {
    score = json['Score'];
    sessionA = json['SessionA'];
    sessionB = json['SessionB'];
    overs = json['overs'];
    matchId = json['MatchId'];
    battingteam = json['Battingteam'];
    wickets = json['wickets'];
    mrateA = json['MrateA'];
    mrateB = json['MrateB'];
    favourite = json['favourite'];
    isfirstinning = json['isfirstinning'];
    subdate = json['subdate'];
    teamruns = json['Teamruns'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Score'] = score;
    data['SessionA'] = sessionA;
    data['SessionB'] = sessionB;
    data['overs'] = overs;
    data['MatchId'] = matchId;
    data['Battingteam'] = battingteam;
    data['wickets'] = wickets;
    data['MrateA'] = mrateA;
    data['MrateB'] = mrateB;
    data['favourite'] = favourite;
    data['isfirstinning'] = isfirstinning;
    data['subdate'] = subdate;
    data['Teamruns'] = teamruns;
    data['id'] = id;
    return data;
  }
}
