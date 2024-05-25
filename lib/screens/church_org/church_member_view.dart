import 'package:flutter/material.dart';
import 'package:mera_pariwar/models/church_model.dart';
import 'package:mera_pariwar/themes/themes.dart';

class ChurchMemberViewScreen extends StatelessWidget {
  final List<ChurchMember> churchMembers;

  const ChurchMemberViewScreen({super.key, required this.churchMembers});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "Committee",
            style: TextStyle(
                fontSize: 22, color: Colors.black, fontWeight: FontWeight.w600),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body: Container(
        margin: const EdgeInsets.only(top: 16),
        child: ListView.builder(
          itemCount: churchMembers.length,
          itemBuilder: (context, index) {
            final member = churchMembers[index];
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 24),
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: AppTheme.PaleBlueBg,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: ClipOval(
                      child: Image.network(
                        member.image ?? '',
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.person,
                              size: 60); // Default icon if image fails
                        },
                      ),
                    ),
                    title: Text(
                      member.name ?? "",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                    subtitle: Text(
                      member.role ?? " ",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppTheme.dullColor),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        if (member.desc.isNotEmpty) ...[
                          Text(
                            member.desc,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 10),
                        ],
                        if (member.phone.isNotEmpty) ...[
                          Row(
                            children: [
                              const Icon(
                                Icons.phone,
                                color: Colors.black,
                              ),
                              const SizedBox(width: 12),
                              Text(member.phone,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                          const SizedBox(height: 10),
                        ],
                        if (member.email.isNotEmpty)
                          Row(
                            children: [
                              const Icon(Icons.email, color: Colors.black),
                              const SizedBox(width: 12),
                              Text(member.email,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
