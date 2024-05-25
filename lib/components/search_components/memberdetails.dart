import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mera_pariwar/models/people_family.dart';

class MemberDetail extends StatelessWidget {
  final PeopleFamily member;
  final Function onClick;

  const MemberDetail({super.key, required this.member, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onClick();
      },
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            member.type == 'person'
                ? ClipOval(
                    child: Image.network(
                      member.image!,
                      width: 92,
                      height: 92,
                      fit: BoxFit.cover,
                    ),
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      member.image!,
                      width: 92,
                      height: 92,
                      fit: BoxFit.cover,
                    ),
                  ),
            const SizedBox(width: 16),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Align text to the left
              children: [
                Container(
                  child: Text(member.name!,
                      textAlign: TextAlign.left,
                      style:
                          const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                ),
                const SizedBox(height: 3),
                Text('${member.familyName}',
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff5d80b6))),
                const SizedBox(height: 7),
                Row(
                  children: [
                    SvgPicture.asset("assets/icons/map-pin.svg"),
                    const SizedBox(
                      width: 5,
                    ),
                    Text('${member.areaName}, ${member.subAreaName}',
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500)),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
