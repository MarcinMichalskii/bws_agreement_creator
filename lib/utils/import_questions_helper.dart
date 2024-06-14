import 'dart:convert';

import 'package:bws_agreement_creator/Model/add_chapter_question_data.dart';
import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';

class ImportQuestionsHelper {
  Future<List<AddChapterQuestionData>> pickFile(String chapterId) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['csv'],
    );

    if (result != null) {
      final bytes = result.files.single.bytes;
      final csvData = utf8.decode(bytes!);
      return convertCsvToJson(csvData, chapterId);
    }
    return [];
  }

  List<AddChapterQuestionData> convertCsvToJson(
      String csvData, String chapterId) {
    List<List<dynamic>> csvTable = CsvToListConverter().convert(csvData);

    List<String> headers =
        csvTable[0].map((header) => header.toString()).toList();
    List<AddChapterQuestionData> questions = [];

    for (var i = 1; i < csvTable.length; i++) {
      Map<String, dynamic> row = {};
      for (var j = 0; j < headers.length; j++) {
        row[headers[j]] = csvTable[i][j];
      }

      AddChapterQuestionData question = AddChapterQuestionData(
        questionText: row['Question Text'],
        answers: row['Answers']
            .toString()
            .split(';')
            .map((s) => s.trim())
            .where((s) => s.isNotEmpty)
            .toList(),
        chapterId: chapterId,
        correctAnswer: row['Correct answer'],
        videos: row['Videos']
            .toString()
            .split(';')
            .map((s) => s.trim())
            .where((s) => s.isNotEmpty)
            .toList(),
      );

      questions.add(question);
    }

    questions.forEach((element) {
      final mappedAnswers = element.answers.map((e) => e.toLowerCase());
      final correctAnswer = element.correctAnswer.toLowerCase();
      final containsCorrectAnswer = mappedAnswers.contains(correctAnswer);
      if (!containsCorrectAnswer) {
        throw Exception("Correct answer not in answers");
      }
    });
    return questions;
  }
}
