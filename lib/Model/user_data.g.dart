// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      completedVideos: (json['completedVideos'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      email: json['email'] as String,
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      passedChapterExams: (json['passedChapterExams'] as List<dynamic>)
          .map((e) => FinishedChapterData.fromJson(e as Map<String, dynamic>))
          .toList(),
      passedQuestions: (json['passedQuestions'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      passedVideoExams: (json['passedVideoExams'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      lastActivity: DateTime.parse(json['lastActivity'] as String),
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'completedVideos': instance.completedVideos,
      'email': instance.email,
      'id': instance.id,
      'name': instance.name,
      'passedChapterExams': instance.passedChapterExams,
      'passedQuestions': instance.passedQuestions,
      'passedVideoExams': instance.passedVideoExams,
      'lastActivity': instance.lastActivity.toIso8601String(),
    };
