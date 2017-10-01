import 'package:great_circle_distance/great_circle_distance.dart';

main() {
    final lat1 = 41.139129;
    final lon1 = 1.402244;

    final lat2 = 41.139074;
    final lon2 = 1.402315;

    var gcd = new GreatCircleDistance.fromDegrees(
        latitude1: lat1, longitude1: lon1, latitude2: lat2, longitude2: lon2);

    print(
        'Distance from location 1 to 2 using the Haversine formula is: ${gcd.haversineDistance()}');
    print('Distance from location 1 to 2 using the Spherical Law of Cosines is: ${gcd
        .sphericalLawOfCosinesDistance()}');
    print(
        'Distance from location 1 to 2 using the Vicenty`s formula is: ${gcd.vincentyDistance()}');
}
