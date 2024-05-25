import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mera_pariwar/components/interactive_elements/custom_button.dart';
import 'package:mera_pariwar/components/widgets/address_section.dart';
import 'package:mera_pariwar/components/widgets/contact_details.dart';
import 'package:mera_pariwar/components/widgets/gallery_row.dart';
import 'package:mera_pariwar/models/member.dart';
import 'package:mera_pariwar/screens/member/image_view.dart';
import 'package:mera_pariwar/themes/themes.dart';
import 'package:multi_image_layout/multi_image_layout.dart';

import 'package:mera_pariwar/components/widgets/info_row.dart';
import 'package:mera_pariwar/components/widgets/section_title.dart';

// Sample JSON data
String jsonData = '''
{
  "id": 1254211,
  "name": "Stella Varghese",
  "role": "Daughter",
  "image": "https://t3.ftcdn.net/jpg/02/99/04/20/360_F_299042079_vGBD7wIlSeNl7vOevWHiL93G4koMM967.jpg",
  "familyimage": "https://t3.ftcdn.net/jpg/05/54/16/34/360_F_554163402_HQoSz6uK3a6O4NgLzHKIFkxJztbOunlf.jpg",
  "desc": "Gamer. Infuriatingly humble organizer. Internetaholic. Passionate explorer. Avid beer aficionado.",
  "familyid": 125421,
  "nickName": "Stella",
  "familyName": "Varghese Family",
  "baptismName": "Stella Mary Varghese",
  "gender": "Female",
  "dateOfBirth": "Aug 27, 2000",
  "relation": "Daughter",
  "phone": "9569856980",
  "email": "stella0123@gmail.com",
  "address": "Palamattam, Kothamangalam",
  "area": "Downtown",
  "subarea": "Sector 1",
  "images": [
      "https://i.imgur.com/CzXTtJV.jpeg",
      "https://i.imgur.com/CzXTtJV.jpeg",
      "https://i.imgur.com/CzXTtJV.jpeg",
      "https://i.imgur.com/CzXTtJV.jpeg",
      "https://i.imgur.com/CzXTtJV.jpeg"
  ]
}
''';

class MemberPage extends StatefulWidget {
  final String? memberId;

  const MemberPage({super.key, this.memberId});

  @override
  _MemberPageState createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {
  late Member memberData;

  @override
  void initState() {
    super.initState();
    // Decode JSON data
    Map<String, dynamic> memberMap = jsonDecode(jsonData);
    memberData = Member.fromJson(memberMap);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(scrollDirection: Axis.vertical, children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Stack(children: [
                  Container(
                    height: 190,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(memberData.familyimage ?? ''),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.5),
                          BlendMode.darken,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      top: 30,
                      left: 16,
                      child: GestureDetector(
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      )),
                ]),
                Padding(
                  padding: const EdgeInsets.only(top: 130.0, left: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(memberData.image ?? ''),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              memberData.name ?? '',
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 8),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 4),
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(93, 128, 182, 0.08),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Container(
                                child: Text(
                                  'ID 74234234',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppTheme.navClickColor,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "Gamer. Infuriatingly humble organizer. Internetaholic. Passionate explorer. Avid beer aficionado.",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 16, color: AppTheme.dullColor),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 121,
                              child: MyButton(
                                onClick: () {
                                  // Message functionality here
                                },
                                text: 'Message',
                                fillColor: AppTheme.navColor,
                                textColor: Colors.white,
                                padding: 12,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: SvgPicture.asset(
                                      "assets/icons/nolike.svg")),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Divider(
                    color: Color.fromRGBO(0, 0, 0, 0.08),
                    thickness: 1,
                  ),
                  const SizedBox(height: 10),
                  buildSectionTitle("Personal Information"),
                  buildInfoRow("Nick Name", memberData.nickName),
                  buildInfoRow("Baptism Name", memberData.baptismName),
                  buildInfoRow("Gender", memberData.gender),
                  buildInfoRow("Date of Birth", memberData.dateOfBirth),
                  buildInfoRow("Relation", memberData.relation),
                  const SizedBox(height: 16),
                  ContactInfo(memberData.phone ?? '', memberData.email ?? ''),
                  const SizedBox(
                    height: 16,
                  ),
                  buildSectionTitle("Family"),
                  SizedBox(
                    height: 121,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            image: DecorationImage(
                              image: NetworkImage(
                                memberData.familyimage ?? '',
                              ),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.7),
                                BlendMode.darken,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                            bottom: 20,
                            left: 16,
                            child: Text(
                              memberData.familyName ?? "",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  AddressSection(
                      area: memberData.area ?? '',
                      subarea: memberData.subarea ?? ''),
                  const SizedBox(height: 16),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Gallery',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w700),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FullImageGalleryPage(
                                    imageUrls: memberData.images ?? [],
                                  ),
                                ));
                          },
                          child: Text(
                            "View all",
                            style: TextStyle(
                                fontSize: 16,
                                color: AppTheme.navClickColor,
                                fontWeight: FontWeight.w600),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 16),
                    child: GalleryRow(
                      imageUrls: memberData.images ?? [],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  buildSectionTitle("Organization"),
                  buildInfoRow("Area", memberData.area),
                  buildInfoRow("Subarea", memberData.subarea),
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
