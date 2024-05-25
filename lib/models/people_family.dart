class PeopleFamily {
  String? type;
  String? name;
  String? image;
  String? familyName;
  String? areaName;
  String? subAreaName;
  String? id;

  PeopleFamily(
      {this.type,
      this.name,
      this.image,
      this.familyName,
      this.areaName,
      this.subAreaName,
      this.id});

  PeopleFamily.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    name = json['name'];
    image = json['image'];
    familyName = json['family_name'];
    areaName = json['area_name'];
    subAreaName = json['sub_area_name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['name'] = name;
    data['image'] = image;
    data['family_name'] = familyName;
    data['area_name'] = areaName;
    data['sub_area_name'] = subAreaName;
    data['id'] = id;
    return data;
  }
}
