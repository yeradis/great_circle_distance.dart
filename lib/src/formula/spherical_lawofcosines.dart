import 'dart:math';

class Spherical_LawOfCosines {
    static double distance(double lat1, lon1, lat2, lon2) {
        double distance = acos(
            sin(lat1) * sin(lat2) +
            cos(lat1) * cos(lat2) *
            cos(lon2 - lon1)
        );
        if (distance < 0) distance = distance + pi;

        var EarthRadius = 6378137.0; // WGS84 major axis
        return EarthRadius * distance;
    }
}