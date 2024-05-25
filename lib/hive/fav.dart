import 'package:hive/hive.dart';

part 'fav.g.dart';

@HiveType(typeId: 0)
class FavPostData {
  @HiveField(0)
  final List<String>? images;

  @HiveField(1)
  final String? text;

  @HiveField(2)
  final String? fileUrl;

  @HiveField(3)
  final String? title;

  @HiveField(4)
  final String? personImageUrl;

  @HiveField(5)
  final String? personName;

  @HiveField(6)
  final DateTime? time;

  @HiveField(7)
  final String? groupName;

  @HiveField(8)
  final String? groupAuthorName;

  @HiveField(9)
  final int? likes;

  @HiveField(10)
  final String? type;

  @HiveField(11)
  final int? id;

  const FavPostData({
    this.images,
    this.text,
    this.fileUrl,
    this.title,
    this.personImageUrl,
    this.personName,
    this.time,
    this.groupName,
    this.groupAuthorName,
    this.likes,
    this.type,
    this.id,
  });
}
