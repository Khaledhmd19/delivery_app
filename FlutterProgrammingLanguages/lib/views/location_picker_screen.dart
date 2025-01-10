import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';
import 'package:geocoding/geocoding.dart';

class LocationPickerScreen extends StatefulWidget {
  const LocationPickerScreen({super.key});

  @override
  State<LocationPickerScreen> createState() => _LocationPickerScreenState();
}

class _LocationPickerScreenState extends State<LocationPickerScreen> {
  LatLng? _selectedLocation;
  String _address = 'Tap on the map to select a location';

  Future<void> _onMapTap(LatLng location) async {
    setState(() {
      _selectedLocation = location;
      _address = 'Fetching address...'; // Show a loading message
    });

    try {
      // Debug: Print selected coordinates
      print(
          'Selected Coordinates: ${location.latitude}, ${location.longitude}');

      // Convert coordinates to address
      final placemarks = await placemarkFromCoordinates(
        location.latitude,
        location.longitude,
      );

      if (placemarks.isNotEmpty) {
        final placemark = placemarks.first;
        setState(() {
          _address =
              '${placemark.street ?? ''}, ${placemark.locality ?? ''}, ${placemark.country ?? ''}';
        });
      } else {
        setState(() {
          _address = 'Address not found';
        });
      }
    } catch (e) {
      setState(() {
        _address = 'Failed to fetch address';
      });
      print('Error fetching address: $e');
    }
  }

  void _printLocation() {
    if (_selectedLocation != null) {
      // Print location to console
      print('=== Selected Location ===');
      print('Latitude: ${_selectedLocation!.latitude}');
      print('Longitude: ${_selectedLocation!.longitude}');
      print('Address: $_address');
      print('=========================');

      // Update the address text
      setState(() {
        _address = 'Selected Address: $_address';
      });
    } else {
      print('No location selected.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xffCECECE),
            size: 30,
          ),
        ),
        backgroundColor: Color(0xffffffff),
        centerTitle: true,
        title: Text(
          'My Location',
          style: GoogleFonts.poppins(
            color: Color(0xff323232),
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: FlutterMap(
              options: MapOptions(
                initialCenter: LatLng(33.5138, 36.2765), // Damascus, Syria
                initialZoom: 10,
                onTap: (_, LatLng location) => _onMapTap(location),
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.velocart',
                ),
                if (_selectedLocation != null)
                  MarkerLayer(
                    markers: [
                      Marker(
                        width: 40,
                        height: 40,
                        point: _selectedLocation!,
                        child: const Icon(
                          Icons.location_pin,
                          color: Colors.red,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  _address,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Color(0xff323232),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _selectedLocation != null
                      ? () {
                          _printLocation(); // Print location to console and update address text
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffFF8D4D), // Orange color
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Print Location',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
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
