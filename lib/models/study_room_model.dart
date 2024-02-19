class StudyRoom {
  int studyId;
  String name;
  //final Map<String, dynamic> myStudy;
  StudyRoom({required this.studyId, required this.name});

//json 생성
  factory StudyRoom.fromJson(Map<String, dynamic> studyroomMap) {
    return StudyRoom(
      studyId: studyroomMap['studyId'],
      name: studyroomMap['name'],
    );
  }
}
