import 'package:great_circle_distance/great_circle_distance.dart';
import 'package:test/test.dart';

void main() {
    group('Simple coordinate validation tests', () {
        setUp(() {
        });

        test('Having valid coordinates fromDegrees should no throw', () {
            final lat1 = 41.139129;
            final lon1 = 1.402244;

            final lat2 = 41.139074;
            final lon2 = 1.402315;

            expect(() => new GreatCircleDistance.fromDegrees(
                latitude1: lat1, longitude1: lon1, latitude2: lat2, longitude2: lon2),
                returnsNormally);
        });

        test('Having valid coordinates fromRadians should no throw', () {
            final lat1 = 0.718013252451;
            final lon1 = 0.024473774716;

            final lat2 = 0.71801229252;
            final lon2 = 0.0244750139;

            expect(() => new GreatCircleDistance.fromRadians(
                latitude1: lat1, longitude1: lon1, latitude2: lat2, longitude2: lon2),
                returnsNormally);
        });

        test(
            'Constructor fromDegrees Having invalid latitude at coordinates 1 should throw FormatException', () {
            final lat1 = -122.4612387012154;
            final lon1 = 1.402244;

            final lat2 = 41.139074;
            final lon2 = 1.402315;

            expect(() =>
            new GreatCircleDistance.fromDegrees(
                latitude1: lat1, longitude1: lon1, latitude2: lat2, longitude2: lon2),
                throwsA(predicate((e) => e is FormatException &&
                    e.message.contains("latitude1|longitude1"))));
        });

        test(
            'Constructor fromDegrees Having invalid latitude at coordinates 2 should throw FormatException', () {
            final lat1 = 41.139074;
            final lon1 = 1.402244;

            final lat2 = -122.4612387012154;
            final lon2 = 1.402315;

            expect(() =>
            new GreatCircleDistance.fromDegrees(
                latitude1: lat1, longitude1: lon1, latitude2: lat2, longitude2: lon2),
                throwsA(predicate((e) => e is FormatException &&
                    e.message.contains("latitude2|longitude2"))));
        });

        test(
            'Constructor fromDegrees Having invalid lontigute at coordinates 2 should throw FormatException', () {
            final lat1 = 41.139129;
            final lon1 = 1.402244;

            final lat2 = 41.139074;
            final lon2 = 270.0;

            expect(() =>
            new GreatCircleDistance.fromDegrees(
                latitude1: lat1, longitude1: lon1, latitude2: lat2, longitude2: lon2),
                throwsA(predicate((e) => e is FormatException &&
                    e.message.contains("latitude2|longitude2"))));
        });

        test(
            'Constructor fromRadians Having invalid lontigute at coordinates 2 should throw FormatException', () {
            final lat1 = 0.718013252451;
            final lon1 = 0.024473774716;

            final lat2 = 0.71801229252;
            final lon2 = 4.71239;

            expect(() =>
            new GreatCircleDistance.fromRadians(
                latitude1: lat1, longitude1: lon1, latitude2: lat2, longitude2: lon2),
                throwsA(predicate((e) => e is FormatException &&
                    e.message.contains("latitude2|longitude2"))));
        });
    });
}