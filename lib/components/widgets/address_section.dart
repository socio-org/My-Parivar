import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import 'package:mera_pariwar/components/widgets/section_title.dart';

class AddressSection extends StatelessWidget {
  final String area;
  final String subarea;

  const AddressSection({super.key, required this.area, required this.subarea});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: 10),
          buildSectionTitle('Address'),
          const SizedBox(height: 14),
          Row(
            children: [
              Icon(
                Icons.location_on,
                color: Theme.of(context).primaryColor,
              ),
              const SizedBox(width: 12),
              Text('$area, $subarea',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600)),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            height: 200, // Set a fixed height for the map
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: FlutterMap(
                    options: const MapOptions(
                      center: LatLng(51.509364, -0.128928),
                      zoom: 9.2,
                    ),
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        userAgentPackageName: 'com.example.app',
                      ),
                      RichAttributionWidget(attributions: [
                        TextSourceAttribution('OpenStreetMap contributors',
                            onTap: () => {}),
                      ]),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 0, 0, 0)
                        .withOpacity(0.4), // Grey overlay with opacity
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Text(
                      'View on map',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
