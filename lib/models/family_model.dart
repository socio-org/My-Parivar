class FamilyMember {
  final String name;
  final String role;
  final int id;
  final String image;

  FamilyMember({
    required this.name,
    required this.role,
    required this.id,
    required this.image,
  });

  factory FamilyMember.fromJson(Map<String, dynamic> json) {
    return FamilyMember(
      name: json['name'] ?? '',
      role: json['role'] ?? '',
      id: json['id'] ?? 0,
      image: json['image'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'role': role,
      'id': id,
    };
  }

  toMap() {}
}

class Family {
  final String familyImage;
  final String phone;
  final String name;
  final String email;
  final String area;
  final String subarea;
  final List<FamilyMember> members;

  Family({
    required this.familyImage,
    required this.phone,
    required this.name,
    required this.email,
    required this.area,
    required this.subarea,
    required this.members,
  });

  factory Family.fromJson(Map<String, dynamic> json) {
    var membersJson = json['members'] as List? ?? [];
    List<FamilyMember> membersList =
        membersJson.map((i) => FamilyMember.fromJson(i)).toList();

    return Family(
      familyImage: json['family_image'] ?? '',
      phone: json['phone'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      area: json['area'] ?? '',
      subarea: json['subarea'] ?? '',
      members: membersList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'family_image': familyImage,
      'phone': phone,
      'name': name,
      'email': email,
      'area': area,
      'subarea': subarea,
      'members': members.map((member) => member.toJson()).toList(),
    };
  }
}
