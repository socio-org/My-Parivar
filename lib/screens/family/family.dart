import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mera_pariwar/components/widgets/address_section.dart';
import 'dart:convert';
import 'package:mera_pariwar/models/family_model.dart';
import 'package:mera_pariwar/screens/family/membersview.dart';
import 'package:mera_pariwar/themes/themes.dart';

import 'package:mera_pariwar/components/widgets/info_row.dart';
import 'package:mera_pariwar/components/widgets/section_title.dart';
import 'package:mera_pariwar/components/widgets/contact_details.dart';

class FamilyPage extends StatefulWidget {
  const FamilyPage({super.key});

  @override
  _FamilyPageState createState() => _FamilyPageState();
}

class _FamilyPageState extends State<FamilyPage> {
  // Sample JSON data
  final String familyJson = '''
  {
    "family_image": "https://t3.ftcdn.net/jpg/05/54/16/34/360_F_554163402_HQoSz6uK3a6O4NgLzHKIFkxJztbOunlf.jpg",
    "phone": "+1234567890",
    "name": "Doe Family",
    "email": "doe@example.com",
    "area": "Downtown",
    "subarea": "Sector 1",
    "members": [
      {
        "name": "John Doe",
        "id": 1,
        "role": "Father",
        "image":"https://t3.ftcdn.net/jpg/02/99/04/20/360_F_299042079_vGBD7wIlSeNl7vOevWHiL93G4koMM967.jpg"
      },
      {
        "name": "Jane Doe",
        "id": 2,
        "role": "Mother",
        "image":"https://t3.ftcdn.net/jpg/02/99/04/20/360_F_299042079_vGBD7wIlSeNl7vOevWHiL93G4koMM967.jpg"
      },
      {
        "name": "Jimmy Doe",
        "id": 3,
        "role": "Son",
        "image":"https://t3.ftcdn.net/jpg/02/99/04/20/360_F_299042079_vGBD7wIlSeNl7vOevWHiL93G4koMM967.jpg"
      }
    ]
  }
  ''';

  late Family familyData;

  @override
  void initState() {
    super.initState();
    familyData = Family.fromJson(json.decode(familyJson));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(scrollDirection: Axis.vertical, children: [
        Container(
          width: double.infinity,
          alignment: Alignment.centerLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                      child: Image.network(
                        familyData.familyImage,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 16,
                    left: 16,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          familyData.name,
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w600),
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
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset("assets/icons/nolike.svg")),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Container(
                  padding: const EdgeInsets.all(16),
                  child: ContactInfo(familyData.phone, familyData.email)),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildSectionTitle("Members"),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MemberViewScreen(
                              members: familyData.members,
                            ),
                          ),
                        );
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
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: familyData.members.map<Widget>((member) {
                      return Container(
                        alignment: Alignment.center,
                        width: 154,
                        height: 173,
                        margin: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ClipOval(
                                child: Image.network(
                                  member.image,
                                  width: 92,
                                  height: 92,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                member.name,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                member.role,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 110, 110, 110)),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.all(16),
                child: AddressSection(
                    area: familyData.area, subarea: familyData.subarea),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildSectionTitle('Organization'),
                    buildInfoRow("Area", familyData.area),
                    buildInfoRow("Sub Area", familyData.subarea),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ]),
    );
  }
}
