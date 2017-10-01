import 'dart:math';

import 'package:great_circle_distance/src/formula/harvesine.dart';
import 'package:great_circle_distance/src/formula/spherical_lawofcosines.dart';
import 'package:great_circle_distance/src/formula/vincenty.dart';

class GreatCircleDistance {

    double latitude1;
    double longitude1;

    double latitude2;
    double longitude2;

    GreatCircleDistance.fromRadians(
        {this.latitude1, this.longitude1, this.latitude2, this.longitude2});

    GreatCircleDistance.fromDegrees(
        {this.latitude1, this.longitude1, this.latitude2, this.longitude2}) {
        this.latitude1 = _radiansFromDegrees(latitude1);
        this.longitude1 = _radiansFromDegrees(longitude1);

        this.latitude2 = _radiansFromDegrees(latitude2);
        this.longitude2 = _radiansFromDegrees(longitude2);
    }

    double _radiansFromDegrees(final double degrees) {
        return degrees * (PI / 180.0);
    }

    double haversineDistance() {
        return Haversine.distance(this.latitude1, this.longitude1, this.latitude2, this.longitude2);
    }

    double sphericalLawOfCosinesDistance() {
        return Spherical_LawOfCosines.distance(this.latitude1, this.longitude1, this.latitude2, this.longitude2);
    }

    double vincentyDistance() {
        return Vincenty.distance(this.latitude1, this.longitude1, this.latitude2, this.longitude2);
    }

}