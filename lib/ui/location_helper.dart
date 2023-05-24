import 'package:location/location.dart' as location;
import 'package:geocoding/geocoding.dart';

class LocationHelper {
  static Future<String?> getCurrentAddress() async {
    location.Location locationInstance = location.Location();

    bool serviceEnabled;
    location.PermissionStatus permissionStatus;

    serviceEnabled = await locationInstance.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await locationInstance.requestService();
      if (!serviceEnabled) {
        return null;
      }
    }

    permissionStatus = await locationInstance.hasPermission();
    if (permissionStatus == location.PermissionStatus.denied) {
      permissionStatus = await locationInstance.requestPermission();
      if (permissionStatus != location.PermissionStatus.granted) {
        return null;
      }
    }

    location.LocationData? currentLocation = await locationInstance.getLocation();
    double latitude = currentLocation.latitude!;
    double longitude = currentLocation.longitude!;

    List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);
    if (placemarks.isNotEmpty) {
      Placemark placemark = placemarks.first;
      String? address = placemark.locality ?? placemark.subAdministrativeArea ?? placemark.administrativeArea;
      String? city = placemark.administrativeArea ?? placemark.subAdministrativeArea ?? placemark.locality;
      return "$address, $city";
    }

    return null;
  }
}
//import 'package:location/location.dart';
//
// class LocationHelper {
//   static Future<String?> getCurrentAddress() async {
//     Location location = Location();
//
//     bool serviceEnabled;
//     PermissionStatus permissionStatus;
//
//     serviceEnabled = await location.serviceEnabled();
//     if (!serviceEnabled) {
//       serviceEnabled = await location.requestService();
//       if (!serviceEnabled) {
//         return null;
//       }
//     }
//
//     permissionStatus = await location.hasPermission();
//     if (permissionStatus == PermissionStatus.denied) {
//       permissionStatus = await location.requestPermission();
//       if (permissionStatus != PermissionStatus.granted) {
//         return null;
//       }
//     }
//
//     LocationData? currentLocation = await location.getLocation();
//     double latitude = currentLocation.latitude!;
//     double longitude = currentLocation.longitude!;
//
//     // TODO: Implement code to convert latitude and longitude to address using Geocoding
//
//     // Placeholder code to return a sample address
//     return "Ha Noi";
//   }
// }