class Member {
  int? id;
  String? name;
  String? role;
  String? image;
  String? familyimage;
  String? nickName;
  String? baptismName;
  String? desc;
  String? familyId;
  String? familyName;
  String? gender;
  String? dateOfBirth;
  String? relation;
  String? phone;
  String? email;
  String? address;
  String? area;
  String? subarea;
  List<String>? images;

  Member(
      {this.id,
      this.name,
      this.role,
      this.image,
      this.familyimage,
      this.nickName,
      this.baptismName,
      this.desc,
      this.familyId,
      this.familyName,
      this.gender,
      this.dateOfBirth,
      this.relation,
      this.phone,
      this.email,
      this.address,
      this.images,
      this.area,
      this.subarea});

  Member.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    role = json['role'];
    image = json['image'];
    familyimage = json['familyimage'];
    desc = json['desc'];
    familyId = json['familyId'];
    familyName = json['familyName'];
    nickName = json['nickName'];
    baptismName = json['baptismName'];
    gender = json['gender'];
    dateOfBirth = json['dateOfBirth'];
    relation = json['relation'];
    phone = json['phone'];
    email = json['email'];
    address = json['address'];
    area = json['area'];
    subarea = json['subarea'];
    images = json['images'] != null ? List<String>.from(json['images']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['role'] = role;
    data['image'] = image;
    data['familyId'] = familyId;
    data['familyName'] = familyName;
    data['desc'] = desc;
    data['familyimage'] = familyimage;
    data['nickName'] = nickName;
    data['baptismName'] = baptismName;
    data['gender'] = gender;
    data['dateOfBirth'] = dateOfBirth;
    data['relation'] = relation;
    data['phone'] = phone;
    data['email'] = email;
    data['address'] = address;
    data['area'] = area;
    data['subarea'] = subarea;
    data['images'] = images;
    return data;
  }
}
