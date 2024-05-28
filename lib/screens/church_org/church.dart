import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:mera_pariwar/screens/church_org/church_member_view.dart';
import 'package:mera_pariwar/themes/themes.dart';

import 'package:mera_pariwar/models/church_model.dart';

class Church extends StatefulWidget {
  const Church({super.key});

  @override
  _ChurchPageState createState() => _ChurchPageState();
}

class _ChurchPageState extends State<Church> {
  // Sample JSON data
  final String churchJson = '''
  {
    "church_image": "https://media.gettyimages.com/id/157610088/photo/old-white-church.jpg?s=612x612&w=gi&k=20&c=hPM6v_jxCgk8godj17HL-TuMNQY66rzN0CPt0CelNHE=",
    "desc":"jsdf sdjfs dfusd fsdfhnsdhfnuisdf sdhjbfshj df shd fhs dfhsbdfhjsd fshdvbfs dfsvbdf sjudhfvbsd fsuhjd fjhsvdf sjd fshvdf sdfsdjhfbsjhdf sdjbfsd f ",
    "phone": "+1234567890",
    "churchname": "St. Dionysius Indian Orthodox Church",
    "email": "doe@example.com",
    "area": "Downtown",
    "subarea": "Sector 1",
    "members": [
        {
            "name": "John Doe",
            "id": 1,
            "desc": "kjhgsadf sdfujkhsd fsjkdf sdjfshj dfhj shj dfhj s df  shdf  hjsdf",
            "phone": "+1234567890",
            "email": "doe@example.com",
            "role": "Main",
            "image": "https://t3.ftcdn.net/jpg/02/99/04/20/360_F_299042079_vGBD7wIlSeNl7vOevWHiL93G4koMM967.jpg"
        },
        {
            "name": "John Doe",
            "id": 1,
            "desc": "",
            "phone": "+1234567890",
            "email": "doe@example.com",
            "role": "Conveenor",
            "image": "https://t3.ftcdn.net/jpg/02/99/04/20/360_F_299042079_vGBD7wIlSeNl7vOevWHiL93G4koMM967.jpg"
        },
        {
            "name": "John Doe",
            "id": 1,
            "desc": "",
            "role": "Member",
            "image": "https://t3.ftcdn.net/jpg/02/99/04/20/360_F_299042079_vGBD7wIlSeNl7vOevWHiL93G4koMM967.jpg"
        }
    ]
}
  ''';

  late ChurchData churchData;

  @override
  void initState() {
    super.initState();
    churchData = ChurchData.fromJson(json.decode(churchJson));
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
                        churchData.churchImage,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 16,
                    left: 16,
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back_ios),
                          color: Colors.white,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        const Text("Church",
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.w600))
                      ],
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
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Text(
                            churchData.churchName,
                            style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                overflow: TextOverflow.clip),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    churchData.desc,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppTheme.dullColor),
                  )),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChurchMemberViewScreen(
                          churchMembers: churchData.members),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppTheme.PaleBlueBg,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 24),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Committee Members",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700)),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 17,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
