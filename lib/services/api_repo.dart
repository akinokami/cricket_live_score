import 'package:live_score/models/live_line_match_model.dart';
import 'package:live_score/models/live_match_model.dart';
import 'package:live_score/models/match_model.dart';
import 'package:live_score/models/news_model.dart';
import 'package:live_score/models/odd_model.dart';
import 'package:live_score/models/player_model.dart';
import 'package:live_score/models/summary_model.dart';
import 'package:live_score/services/api_constant.dart';
import 'package:live_score/services/api_utils.dart';
import 'package:live_score/utils/custom_exception.dart';

class ApiRepo {
  final ApiUtils apiUtils = ApiUtils();

  Future<List<MatchModel>> getOverviewList() async {
    try {
      final response = await apiUtils.post(
        url: "${ApiConstant.baseUrl}MatchResults",
        data: {"start": "1", "end": "10"},
      );
      final resultList = response.data['AllMatch'] as List;
      return resultList.map((item) => MatchModel.fromJson(item)).toList();
    } catch (e) {
      throw CustomException(e.toString());
    }
  }

  Future<List<LiveMatchModel>> getLiveList() async {
    try {
      final response = await apiUtils.get(
        url: "${ApiConstant.baseUrl}LiveLine",
      );
      final resultList = response.data as List;
      return resultList.map((item) => LiveMatchModel.fromJson(item)).toList();
    } catch (e) {
      throw CustomException(e.toString());
    }
  }

  Future<List<MatchModel>> getUpcomihngList() async {
    try {
      final response =
          await apiUtils.get(url: "${ApiConstant.baseUrl}upcomingMatches");
      final resultList = response.data['AllMatch'] as List;
      return resultList.map((item) => MatchModel.fromJson(item)).toList();
    } catch (e) {
      throw CustomException(e.toString());
    }
  }

  Future<List<MatchModel>> getResultList() async {
    try {
      final response = await apiUtils.post(
        url: "${ApiConstant.baseUrl}MatchResults",
        data: {"start": "1", "end": "15"},
      );
      final resultList = response.data as List;
      return resultList.map((item) => MatchModel.fromJson(item)).toList();
    } catch (e) {
      throw CustomException(e.toString());
    }
  }

  Future<List<LiveLineMatchModel>> getLiveLine(String matchId) async {
    try {
      final response = await apiUtils.post(
        url: "${ApiConstant.baseUrl}LiveLine_Match",
        data: {"MatchId": matchId},
      );
      final resultList = response.data as List;
      return resultList
          .map((item) => LiveLineMatchModel.fromJson(item))
          .toList();
    } catch (e) {
      throw CustomException(e.toString());
    }
  }

  Future<List<PlayerModel>> getScore(String matchId) async {
    try {
      final response = await apiUtils.post(
        url: "${ApiConstant.baseUrl}GetAllPlayers",
        data: {"MatchId": matchId},
      );
      final resultList = response.data['Playerslist'] as List;
      return resultList.map((item) => PlayerModel.fromJson(item)).toList();
    } catch (e) {
      throw CustomException(e.toString());
    }
  }

  Future<List<OddModel>> getOdd(String matchId) async {
    try {
      final response = await apiUtils.post(
        url: "${ApiConstant.baseUrl}MatchOdds",
        data: {"MatchId": matchId},
      );
      final resultList = response.data['Matchst'] as List;
      return resultList.map((item) => OddModel.fromJson(item)).toList();
    } catch (e) {
      throw CustomException(e.toString());
    }
  }

  Future<List<SummaryModel>> getSummary(String matchId) async {
    try {
      final response = await apiUtils.post(
        url: "${ApiConstant.baseUrl}MatchStats",
        data: {"MatchId": matchId},
      );
      final resultList = response.data['Matchst'] as List;
      return resultList.map((item) => SummaryModel.fromJson(item)).toList();
    } catch (e) {
      throw CustomException(e.toString());
    }
  }

  Future<List<NewsModel>> getNewsList() async {
    try {
      final response = await apiUtils.get(
          url:
              "https://newsapi.org/v2/everything?q=cricket%20AND%20sport&apiKey=612cc976bd1849b1bbd0ff10a55d5b11");
      final resultList = response.data['articles'] as List;
      return resultList.map((item) => NewsModel.fromJson(item)).toList();
    } catch (e) {
      throw CustomException(e.toString());
    }
  }
}
