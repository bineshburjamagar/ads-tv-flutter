import 'package:isar/isar.dart';
part 'ads_db_model.g.dart';

@collection
class AdsDbModel {
  Id id = Isar.autoIncrement;
  String? link;
  int? duration;
  AdsDbModel({
    required this.duration,
    required this.link,
  });
}
