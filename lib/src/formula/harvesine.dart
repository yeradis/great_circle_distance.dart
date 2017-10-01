import 'dart:math';

class Haversine {
    static double distance(double lat1, lon1, lat2, lon2) {
        var EarthRadius = 6378137.0; // WGS84 major axis
        double distance = 2 * EarthRadius * asin(
            sqrt(
                pow(sin(lat2 - lat1) / 2, 2)
                    + cos(lat1)
                    * cos(lat2)
                    * pow(sin(lon2 - lon1) / 2, 2)
            )
        );
        return distance;
    }
}