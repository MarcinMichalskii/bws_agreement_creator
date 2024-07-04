import 'package:bws_agreement_creator/Model/finished_chapter_data.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_data.g.dart';

@JsonSerializable()
class UserData {
  List<String> completedVideos;
  String email;
  int id;
  String name;
  List<FinishedChapterData> passedChapterExams;
  List<String> passedQuestions;
  List<String> passedVideoExams;
  DateTime lastActivity;

  UserData({
    required this.completedVideos,
    required this.email,
    required this.id,
    required this.name,
    required this.passedChapterExams,
    required this.passedQuestions,
    required this.passedVideoExams,
    required this.lastActivity,
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  static List<UserData> listFromJson(Map<String, dynamic> json) {
    List<UserData> users = [];
    for (var user in json['data']) {
      users.add(UserData.fromJson(user));
    }
    return users;
  }
}
