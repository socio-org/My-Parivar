import 'package:flutter/material.dart';
import 'package:mera_pariwar/components/post_components/events_component.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 400,
        width: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SquareEventsComponent(
                date: DateTime.now(),
                title: 'Catechism Annual Day Celebration 1',
                image:
                    'https://s3-alpha-sig.figma.com/img/f3d1/8ae2/1ec0b19a88dec9815db2dc37cd55d252?Expires=1716768000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=RHIp4f02lyLhq2DN3SUzGSYtHtGapHOhx3rZouyXexTY4eZeo8PQWUKpRHWVLgyC6xpzUjhs6ogGbKCT7LpudYBCPAlGtwCxzbuCR7bNSYjfmUS8d4LPxIZMSCnDCOumCf-pJV54qzvNUDy4cwdKJgV8CvEazWe32QOtY26iUF8VBIv0VctcE-GGMUywOFRCx5yHwT803nMljuXp6y4uE-DMpXF1s86ZYl-GWSfZXrASc~FbUIZN32y-6YwjaCdOtuxihj8kAlz8DYAjCEtZ7TtZAcsMoi3lhHhVf8umv1uZ~FuGkuSVnBiuNBYjBqHep2W0DdiY86LpPJ0jjY3wkg__',
              ),
              SquareEventsComponent(
                date: DateTime.now(),
                title: 'Catechism Annual Day Celebration 2',
                image:
                    'https://s3-alpha-sig.figma.com/img/7bfe/6a8e/1c2a55eca39086b4f2cd1f23fc6591c5?Expires=1716768000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=EXOidB1CNUo2icA7Xkdn6hJYabCjfvow-0BAKwg9dwyw7BNO9itZVhNS9LstvfCyus-EBiWRSqmgsWpWB5ZuG3ulzNTBX5Hp6L54iYTj0bmB~pKfITVi3Wgy4mEKk2Jc~Oh3a9dEa8miImlcKKioNHuzu2g76olIZnpgAVQhzpWIJR~bbdVtPFF1mpz7MdtGmxulIzGK58skzUgUOqCXEvEsj~sczgyhBq7z6p6IoQinAZmivoCUzUholZRa32IcaQ6HxmUWUOkZLl8wAYx09ILRUacWOFJrXBMTKQonbXuRM0CSHE5~OcFDr6DbabmVCnPRymAZ8vNo8ZOBWfaXDQ__',
              ),
              SquareEventsComponent(
                date: DateTime.now(),
                title: 'Catechism Annual Day Celebration 3',
                image:
                    'https://s3-alpha-sig.figma.com/img/f3d1/8ae2/1ec0b19a88dec9815db2dc37cd55d252?Expires=1716768000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=RHIp4f02lyLhq2DN3SUzGSYtHtGapHOhx3rZouyXexTY4eZeo8PQWUKpRHWVLgyC6xpzUjhs6ogGbKCT7LpudYBCPAlGtwCxzbuCR7bNSYjfmUS8d4LPxIZMSCnDCOumCf-pJV54qzvNUDy4cwdKJgV8CvEazWe32QOtY26iUF8VBIv0VctcE-GGMUywOFRCx5yHwT803nMljuXp6y4uE-DMpXF1s86ZYl-GWSfZXrASc~FbUIZN32y-6YwjaCdOtuxihj8kAlz8DYAjCEtZ7TtZAcsMoi3lhHhVf8umv1uZ~FuGkuSVnBiuNBYjBqHep2W0DdiY86LpPJ0jjY3wkg__',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
