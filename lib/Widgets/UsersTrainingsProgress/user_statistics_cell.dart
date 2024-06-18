import 'package:bws_agreement_creator/Widgets/UsersTrainingsProgress/icon_text_row.dart';
import 'package:bws_agreement_creator/utils/colors.dart';
import 'package:flutter/material.dart';

class UserStatisticsCell extends StatelessWidget {
  final String name;
  final String email;
  final int finishedExams;
  final int finishedQuizzes;
  final int watchedVideos;

  const UserStatisticsCell({
    super.key,
    required this.name,
    required this.email,
    required this.finishedExams,
    required this.finishedQuizzes,
    required this.watchedVideos,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: CustomColors.almostBlack2,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(
              color: CustomColors.gray,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            email,
            style: const TextStyle(
              fontSize: 14,
              color: CustomColors.gray,
            ),
          ),
          const SizedBox(height: 8.0),
          Row(
            children: [
              IconTextRow(
                icon: Icons.videocam_outlined,
                text: '$watchedVideos',
              ),
              SizedBox(width: 32.0),
              IconTextRow(
                icon: Icons.playlist_add_check_outlined,
                text: '$finishedQuizzes',
              ),
              SizedBox(width: 32.0),
              IconTextRow(
                iconSize: 30,
                icon: Icons.workspace_premium_outlined,
                text: '$finishedExams',
              ),
            ],
          )
        ],
      ),
    );
  }
}
