import 'package:flutter/material.dart';
import 'package:mera_pariwar/models/family_model.dart';
import 'package:mera_pariwar/themes/themes.dart';

class MemberViewScreen extends StatelessWidget {
  final List<FamilyMember> members;

  const MemberViewScreen({super.key, required this.members});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Members",
          style: TextStyle(
              fontSize: 22, color: Colors.black, fontWeight: FontWeight.w700),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 16),
        child: ListView.builder(
          itemCount: members.length,
          itemBuilder: (context, index) {
            final member = members[index];
            return ListTile(
              leading: ClipOval(
                child: Image.network(
                  member.image,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                member.name,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              subtitle: Text(
                member.role,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
              trailing: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 228, 239, 248),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Icon(
                  Icons.favorite_border,
                  color: AppTheme.navClickColor,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
