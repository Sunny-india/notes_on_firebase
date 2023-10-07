class NoteModel {
  String task;
  NoteModel({required this.task});
  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(task: json['task']);
  }
  Map<String, dynamic> toJson() {
    return {'task': task};
  }
}
