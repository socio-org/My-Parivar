class Posts {
  int? id;
  String? title;
  String? content;
  List<String>? contentUrls;
  String? type;
  String? visibility;
  Null pinned;
  Metadata? metadata;
  Permissions? permissions;
  int? orgId;
  String? expireOn;
  Null deletedOn;
  String? createdAt;
  String? updatedAt;
  Null createdBy;
  Null updatedBy;

  Posts(
      {this.id,
      this.title,
      this.content,
      this.contentUrls,
      this.type,
      this.visibility,
      this.pinned,
      this.metadata,
      this.permissions,
      this.orgId,
      this.expireOn,
      this.deletedOn,
      this.createdAt,
      this.updatedAt,
      this.createdBy,
      this.updatedBy});

  Posts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    contentUrls = json['contentUrls'].cast<String>();
    type = json['type'];
    visibility = json['visibility'];
    pinned = json['pinned'];
    metadata = json['metadata'] != null
        ? Metadata.fromJson(json['metadata'])
        : null;
    permissions = json['permissions'] != null
        ? Permissions.fromJson(json['permissions'])
        : null;
    orgId = json['orgId'];
    expireOn = json['expireOn'];
    deletedOn = json['deletedOn'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['content'] = content;
    data['contentUrls'] = contentUrls;
    data['type'] = type;
    data['visibility'] = visibility;
    data['pinned'] = pinned;
    if (metadata != null) {
      data['metadata'] = metadata!.toJson();
    }
    if (permissions != null) {
      data['permissions'] = permissions!.toJson();
    }
    data['orgId'] = orgId;
    data['expireOn'] = expireOn;
    data['deletedOn'] = deletedOn;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['createdBy'] = createdBy;
    data['updatedBy'] = updatedBy;
    return data;
  }
}

class Metadata {
  List<String>? tags;
  List<Null>? userMentions;
  String? location;
  Null blurHash;

  Metadata({this.tags, this.userMentions, this.location, this.blurHash});

  Metadata.fromJson(Map<String, dynamic> json) {
    tags = json['tags'].cast<String>();
    if (json['userMentions'] != null) {
      userMentions = <Null>[];
      json['userMentions'].forEach((v) {
        userMentions!.add(v);
      });
    }
    location = json['location'];
    blurHash = json['blurHash'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tags'] = tags;
    if (userMentions != null) {
      data['userMentions'] = userMentions!.map((v) => v).toList();
    }
    data['location'] = location;
    data['blurHash'] = blurHash;
    return data;
  }
}

class Permissions {
  bool? moderator;
  bool? editable;
  bool? deletable;
  bool? hidden;
  bool? userDeleted;
  bool? editHistoryVisible;

  Permissions(
      {this.moderator,
      this.editable,
      this.deletable,
      this.hidden,
      this.userDeleted,
      this.editHistoryVisible});

  Permissions.fromJson(Map<String, dynamic> json) {
    moderator = json['moderator'];
    editable = json['editable'];
    deletable = json['deletable'];
    hidden = json['hidden'];
    userDeleted = json['userDeleted'];
    editHistoryVisible = json['editHistoryVisible'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['moderator'] = moderator;
    data['editable'] = editable;
    data['deletable'] = deletable;
    data['hidden'] = hidden;
    data['userDeleted'] = userDeleted;
    data['editHistoryVisible'] = editHistoryVisible;
    return data;
  }
}
