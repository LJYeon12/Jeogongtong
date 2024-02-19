import 'dart:convert';
import 'study_room_model.dart';

List<StudyRoom> parseRoom(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<StudyRoom>((json) => StudyRoom.fromJson(json)).toList();
}
