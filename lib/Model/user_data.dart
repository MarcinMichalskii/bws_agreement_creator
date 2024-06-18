class UserData {
  List<String> completedVideos;
  String email;
  int id;
  String name;
  List<String> passedChapterExams;
  List<String> passedQuestions;
  List<String> passedVideoExams;

  UserData({
    required this.completedVideos,
    required this.email,
    required this.id,
    required this.name,
    required this.passedChapterExams,
    required this.passedQuestions,
    required this.passedVideoExams,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      completedVideos: List<String>.from(json['completedVideos']),
      email: json['email'],
      id: json['id'],
      name: json['name'],
      passedChapterExams: List<String>.from(json['passedChapterExams']),
      passedQuestions: List<String>.from(json['passedQuestions']),
      passedVideoExams: List<String>.from(json['passedVideoExams']),
    );
  }

  static List<UserData> listFromJson(Map<String, dynamic> json) {
    List<UserData> users = [];
    for (var user in json['data']) {
      users.add(UserData.fromJson(user));
    }
    return users;
  }
}
