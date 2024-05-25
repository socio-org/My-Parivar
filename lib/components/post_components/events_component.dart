import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SquareEventsComponent extends StatelessWidget {
  final DateTime? date;
  final String? title;
  final String? image;

  const SquareEventsComponent({super.key, this.date, this.title, this.image});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: 232,
          height: 307,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.blue,
            image: image != null
                ? DecorationImage(
                    image: NetworkImage(image!),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.6), BlendMode.darken))
                : null,
          ),
          child: Stack(
            children: [
              if (title != null)
                Positioned(
                  bottom: 15,
                  left: 15,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      title!,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          overflow: TextOverflow.clip,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              if (date != null)
                Positioned(
                  top: 20,
                  left: 20,
                  child: Container(
                      width: 46,
                      height: 58,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white),
                      child: Column(
                        children: [
                          Text(
                            DateFormat('MMM').format(date!),
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            date!.day.toString(),
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      )),
                ),
            ],
          ),
        );
      },
    );
  }
}
