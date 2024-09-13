const String tableFile = 'localFile';
const String columnId = '_id';
const String columnTitle = 'title';
const String columnTime = 'time';
const String columnFilePath = 'filepath';

class LocalDbVideoModel {
  final int? id;
  final String title;
  final int time;
  final String filePath;

  LocalDbVideoModel({
    this.id,
    required this.title,
    required this.filePath,
    required this.time,
  });

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      columnTitle: title,
      columnFilePath: filePath,
      columnTime: time
    };
    map[columnId] = id;
    return map;
  }

  factory LocalDbVideoModel.fromMap(Map<String, dynamic> map) {
    return LocalDbVideoModel(
      id: map["_id"],
      title: map["title"],
      filePath: map["filepath"],
      time: map["time"],
    );
  }
  LocalDbVideoModel copyWith({
    int? id,
    String? title,
    int? time,
    String? filePath,
  }) {
    return LocalDbVideoModel(
      id: id ?? this.id,
      title: title ?? this.title,
      filePath: filePath ?? this.filePath,
      time: time ?? this.time,
    );
  }
}
