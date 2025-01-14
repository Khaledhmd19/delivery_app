import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LocationPickerController extends GetxController {
  Rx<LatLng?> selectedLocation = Rx<LatLng?>(null);
  RxString address = 'Tap on the map to select a location'.obs;

  Future<void> onMapTap(LatLng location) async {
    selectedLocation.value = location;
    address.value = 'Fetching address...';
    try {
      final fetchedAddress = await _getAddressFromCoordinates(location);
      address.value = fetchedAddress ?? 'Address not found';
    } catch (e) {
      address.value = 'Failed to fetch address';
    }
  }

  Future<String?> _getAddressFromCoordinates(LatLng location) async {
    final url =
        'https://nominatim.openstreetmap.org/reverse?format=json&lat=${location.latitude}&lon=${location.longitude}&accept-language=en';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        final address = data['address'];
        if (address != null) {
          String street = address['road'] ?? 'Unnamed Road';
          String city = address['city'] ??
              address['town'] ??
              address['village'] ??
              'Unknown City';

          return '$street, $city';
        } else {
          return 'Address not found';
        }
      } else {
        return 'Failed to fetch address';
      }
    } catch (e) {
      return 'Error fetching address: $e';
    }
  }
}
