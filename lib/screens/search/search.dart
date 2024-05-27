import 'package:flutter/material.dart';
import 'package:mera_pariwar/components/interactive_elements/pill_button_group.dart';
import 'package:mera_pariwar/components/interactive_elements/text_input.dart';
import 'package:mera_pariwar/components/search_components/filtermodal.dart';
import 'package:mera_pariwar/components/search_components/memberdetails.dart';
import 'package:mera_pariwar/models/people_family.dart';
import 'package:mera_pariwar/screens/family/family.dart';
import 'package:mera_pariwar/screens/member/member.dart';
import 'package:mera_pariwar/themes/themes.dart';

// Sample data
List<PeopleFamily> sampleData = [
  PeopleFamily(
    id: "1",
    type: 'person',
    name: 'John Doe',
    image:
        'https://t3.ftcdn.net/jpg/02/99/04/20/360_F_299042079_vGBD7wIlSeNl7vOevWHiL93G4koMM967.jpg',
    familyName: 'Doe Minican Family',
    areaName: 'Downtown',
    subAreaName: 'East Block',
  ),
  PeopleFamily(
    id: "2",
    type: 'family',
    name: 'Smith Family',
    image:
        'https://t3.ftcdn.net/jpg/05/01/89/28/360_F_501892866_14YM3juhXzaSkqEUmSRshyKUlcFqtotR.jpg',
    familyName: 'Smith Family',
    areaName: 'Uptown',
    subAreaName: 'West Block',
  ),
  PeopleFamily(
    id: "3",
    type: 'person',
    name: 'Jane Smith',
    image:
        'https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg',
    familyName: 'Smith Family',
    areaName: 'Uptown',
    subAreaName: 'West Block',
  ),
  PeopleFamily(
    id: "4",
    type: 'family',
    name: 'Johnson Family',
    image:
        'https://t3.ftcdn.net/jpg/05/54/16/34/360_F_554163402_HQoSz6uK3a6O4NgLzHKIFkxJztbOunlf.jpg',
    familyName: 'Johnson Family',
    areaName: 'Suburbia',
    subAreaName: 'North Block',
  ),
  PeopleFamily(
    id: "5",
    type: 'person',
    name: 'Emily Johnson',
    image:
        'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fHww',
    familyName: 'Johnson Family',
    areaName: 'Suburbia',
    subAreaName: 'North Block',
  ),
];

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool isModalOpen = false;
  String selectedOption = 'List All';
  List<PeopleFamily> currentData = List.from(sampleData);

  void updateSelected(String option) {
    setState(() {
      selectedOption = option;
      if (option == 'List All') {
        currentData = List.from(
            sampleData); // Reset currentData to the original sampleData
      } else if (option == 'Members Only') {
        currentData =
            sampleData.where((element) => element.type == 'person').toList();
      } else if (option == 'Family Only') {
        currentData =
            sampleData.where((element) => element.type == 'family').toList();
      }
    });
  }

  void _showModal(BuildContext context) {
    setState(() {
      isModalOpen = true;
    });

    showModalBottomSheet(
      useSafeArea: true,
      context: context,
      isScrollControlled: true,
      enableDrag: false,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: FilterModal(
            onClose: () {
              setState(() {
                isModalOpen = false;
              });
            },
          ),
        );
      },
    ).whenComplete(() {
      setState(() {
        isModalOpen = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double iconSize = screenWidth * 0.05;
    final double fontSize = screenWidth * 0.045;
    final double padding = screenWidth * 0.04;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: padding * 0.5),
                width: double.infinity,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        size: iconSize,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "Search",
                      style: TextStyle(
                        fontSize: fontSize * 1.3,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: padding * 0.55),
                padding: EdgeInsets.symmetric(
                    horizontal: padding, vertical: padding / 2),
                child: Row(
                  children: [
                    Expanded(
                      child: MyTextInput(
                        placeholder: 'Search',
                        controller: TextEditingController(),
                        onChanged: (value) {
                          print('Search text changed: $value');
                        },
                        icon: Icons.search_outlined,
                        obscureText: false,
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: const Color.fromARGB(255, 228, 228, 228),
                        ),
                        borderRadius: BorderRadius.circular(12),
                        color: isModalOpen
                            ? AppTheme.blueColor
                            : Colors.transparent,
                      ),
                      child: IconButton(
                        onPressed: () {
                          _showModal(context);
                        },
                        icon: Icon(
                          Icons.filter_list,
                          color: isModalOpen ? Colors.white : Colors.black,
                          size: iconSize,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(left: padding, top: padding * 0.25),
                child: Text(
                  "Search ‘Family name’ or ‘A member’",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromARGB(199, 145, 140, 140),
                  ),
                ),
              ),
              SizedBox(height: padding),
              SizedBox(
                width: double.infinity,
                child: PillButtonGroup(
                  options: const ['List All', 'Members Only', 'Family Only'],
                  onSelected: (selectedOption) {
                    updateSelected(selectedOption);
                  },
                ),
              ),
              SizedBox(height: padding),
              Expanded(
                child: ListView.builder(
                  itemCount: currentData.length,
                  itemBuilder: (context, index) {
                    return MemberDetail(
                      member: currentData[index],
                      onClick: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                currentData[index].type == 'person'
                                    ? const MemberPage()
                                    : const FamilyPage(),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
