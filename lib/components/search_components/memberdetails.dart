import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mera_pariwar/models/people_family.dart';

class MemberDetail extends StatelessWidget {
  final PeopleFamily member;
  final Function onClick;

  const MemberDetail({super.key, required this.member, required this.onClick});

  @override
  Widget build(BuildContext context) {
    // Get screen width
    final double screenWidth = MediaQuery.of(context).size.width;

    // Calculate sizes and padding based on screen width
    final double padding = screenWidth * 0.04;
    final double imageSize = screenWidth * 0.23;
    final double fontSizeName = screenWidth * 0.045;
    final double fontSizeFamilyName = screenWidth * 0.035;
    final double fontSizeLocation = screenWidth * 0.035;

    return GestureDetector(
      onTap: () {
        onClick();
      },
      child: Container(
        padding: EdgeInsets.all(padding),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            member.type == 'person'
                ? ClipOval(
                    child: Image.network(
                      member.image!,
                      width: imageSize,
                      height: imageSize,
                      fit: BoxFit.cover,
                    ),
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      member.image!,
                      width: imageSize,
                      height: imageSize,
                      fit: BoxFit.cover,
                    ),
                  ),
            SizedBox(width: padding),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    member.name!,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: fontSizeName,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: padding * 0.2),
                Text(
                  '${member.familyName}',
                  style: TextStyle(
                    fontSize: fontSizeFamilyName,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff5d80b6),
                  ),
                ),
                SizedBox(height: padding * 0.4),
                Row(
                  children: [
                    SvgPicture.asset("assets/icons/map-pin.svg"),
                    SizedBox(width: padding * 0.3),
                    Text(
                      '${member.areaName}, ${member.subAreaName}',
                      style: TextStyle(
                        fontSize: fontSizeLocation,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
