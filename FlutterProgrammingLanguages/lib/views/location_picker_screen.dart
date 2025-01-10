import 'package:delivery_app/controllers/location_picker_controller.dart';
import 'package:delivery_app/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';

class LocationPickerScreen extends StatelessWidget {
  LocationPickerScreen({Key? key}) : super(key: key);

  final LocationPickerController controller =
      Get.put(LocationPickerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xffCECECE),
            size: 30,
          ),
        ),
        backgroundColor: const Color(0xffffffff),
        centerTitle: true,
        title: Text(
          'My Location',
          style: GoogleFonts.poppins(
            color: const Color(0xff323232),
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            child: FlutterMap(
              options: MapOptions(
                initialCenter: LatLng(33.5138, 36.2765),
                initialZoom: 12,
                onTap: (_, LatLng location) => controller.onMapTap(location),
              ),
              children: [
                TileLayer(
                  urlTemplate:
                      'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                  subdomains: ['a', 'b', 'c'],
                  userAgentPackageName: 'com.example.velocart',
                ),
                Obx(() {
                  if (controller.selectedLocation.value != null) {
                    return MarkerLayer(
                      markers: [
                        Marker(
                          width: 40,
                          height: 40,
                          point: controller.selectedLocation.value!,
                          child: const Icon(
                            Icons.location_pin,
                            color: Colors.red,
                            size: 40,
                          ),
                        ),
                      ],
                    );
                  }
                  return const SizedBox.shrink();
                }),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Obx(() => Text(
                      controller.address.value,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: const Color(0xff323232),
                      ),
                    )),
                const SizedBox(height: 14),
                MainButton(
                  onPressed: () {},
                  buttonText: 'Save Location',
                  buttonSize: Size(
                    240,
                    45,
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
