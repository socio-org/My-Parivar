
class ChurchData {
  final String churchImage;
  final String phone;
  final String churchName;
  final String email;
  final String desc;
  final String area;
  final String subArea;
  final List<ChurchMember> members;

  ChurchData({
    required this.churchImage,
    required this.phone,
    required this.desc,
    required this.churchName,
    required this.email,
    required this.area,
    required this.subArea,
    required this.members,
  });

  factory ChurchData.fromJson(Map<String, dynamic> json) {
    return ChurchData(
      churchImage: json['church_image'],
      desc: json['desc'],
      phone: json['phone'],
      churchName: json['churchname'],
      email: json['email'],
      area: json['area'],
      subArea: json['subarea'],
      members: List<ChurchMember>.from(
          json['members'].map((x) => ChurchMember.fromJson(x))),
    );
  }
}

class ChurchMember {
  final String name;
  final int id;
  final String desc;
  final String phone;
  final String email;
  final String role;
  final String image;

  ChurchMember({
    required this.name,
    required this.id,
    required this.desc,
    required this.phone,
    required this.email,
    required this.role,
    required this.image,
  });

  factory ChurchMember.fromJson(Map<String, dynamic> json) {
    return ChurchMember(
      name: json['name'],
      id: json['id'],
      desc: json['desc'] ?? '',
      phone: json['phone'] ?? '',
      email: json['email'] ?? '',
      role: json['role'],
      image: json['image'],
    );
  }
}
