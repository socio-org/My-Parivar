class FavPost {
  final List<String>? images;
  final String? text;
  final String? fileUrl;
  final String? title;
  final String? personImageUrl;
  final String? personName;
  final DateTime? time;
  final String? groupName;
  final String? groupAuthorName;
  final int? likes;
  final String? type;
  final int? id;

  const FavPost({
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
