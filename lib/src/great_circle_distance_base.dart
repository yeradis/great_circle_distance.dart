import 'dart:math';

import 'package:great_circle_distance/src/formula/harvesine.dart';
import 'package:great_circle_distance/src/formula/spherical_lawofcosines.dart';
import 'package:great_circle_distance/src/formula/vincenty.dart';

/// The great-circle is shortest distance between two points on the surface of a sphere
/// See [Great-circle distance](https://en.wikipedia.org/wiki/Great-circle_distance)
class GreatCircleDistance {

    double latitude1;
    double longitude1;

    double latitude2;
    double longitude2;

    GreatCircleDistance.fromRadians(
        {this.latitude1, this.longitude1, this.latitude2, this.longitude2}) {
        this.latitude1 = latitude1;
        this.longitude1 = longitude1;

        this.latitude2 = latitude2;
        this.longitude2 = longitude2;

        _throwExceptionOnInvalidCoordinates();
    }

    GreatCircleDistance.fromDegrees(
        {this.latitude1, this.longitude1, this.latitude2, this.longitude2}) {
        this.latitude1 = _radiansFromDegrees(latitude1);
        this.longitude1 = _radiansFromDegrees(longitude1);

        this.latitude2 = _radiansFromDegrees(latitude2);
        this.longitude2 = _radiansFromDegrees(longitude2);

        _throwExceptionOnInvalidCoordinates();
    }

    /// Calculate distance using the Haversine formula
    /// The haversine formula determines the great-circle distance between two points on a sphere given their longitudes and latitudes
    /// See [Haversine formula](https://en.wikipedia.org/wiki/Haversine_formula)
    double haversineDistance() {
        return Haversine.distance(this.latitude1, this.longitude1, this.latitude2, this.longitude2);
    }

    /// Calculate distance using Spherical law of cosines
    /// See [Spherical law of cosines](https://en.wikipedia.org/wiki/Spherical_law_of_cosines)
    double sphericalLawOfCosinesDistance() {
        return Spherical_LawOfCosines.distance(
            this.latitude1, this.longitude1, this.latitude2, this.longitude2);
    }

    /// Calculate distance using Vincenty formula
    /// Vincenty's formulae are two related iterative methods used in geodesy to calculate the distance between two points on the surface of a spheroid
    /// They are based on the assumption that the figure of the Earth is an oblate spheroid, and hence are more accurate than methods that assume a spherical Earth, such as great-circle distance
    /// See [Vincenty's formulae](https://en.wikipedia.org/wiki/Vincenty%27s_formulae)
    double vincentyDistance() {
        return Vincenty.distance(this.latitude1, this.longitude1, this.latitude2, this.longitude2);
    }

    double _radiansFromDegrees(final double degrees) => degrees * (pi / 180.0);

    /// A coordinate is considered invalid if it meets at least one of the following criteria:
    ///
    /// - Its latitude is greater than 90 degrees or less than -90 degrees.
    ///- Its longitude is greater than 180 degrees or less than -180 degrees.
    bool _isValidCoordinate(double latitude, longitude) =>
        _isValidLatitude(latitude) && _isValidLongitude(longitude);

    /// A latitude is considered invalid if its is greater than 90 degrees or less than -90 degrees.
    bool _isValidLatitude(double latitudeInRadians) =>
        !(latitudeInRadians < _radiansFromDegrees(-90.0) ||
            latitudeInRadians > _radiansFromDegrees(90.0));

    /// A longitude is considered invalid if its is greater than 180 degrees or less than -180 degrees.
    bool _isValidLongitude(double longitudeInRadians) =>
        !(longitudeInRadians < _radiansFromDegrees(-180.0) ||
            longitudeInRadians > _radiansFromDegrees(180.0));

    void _throwExceptionOnInvalidCoordinates() {
        String invalidDescription = """
            A coordinate is considered invalid if it meets at least one of the following criteria:
            - Its latitude is greater than 90 degrees or less than -90 degrees.
            - Its longitude is greater than 180 degrees or less than -180 degrees.
            
            see https://en.wikipedia.org/wiki/Decimal_degrees
        """;

        if (!_isValidCoordinate(this.latitude1, this.longitude1))
            throw new FormatException(
                "Invalid coordinates at latitude1|longitude1\n$invalidDescription");

        if (!_isValidCoordinate(this.latitude2, this.longitude2))
            throw new FormatException(
                "Invalid coordinates at latitude2|longitude2\n$invalidDescription");
    }
}