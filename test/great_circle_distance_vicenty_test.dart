import 'package:great_circle_distance/great_circle_distance.dart';
import 'package:test/test.dart';

void main() {
    group('Simple Vicenty`s formula distance tests', () {

        GreatCircleDistance gcd;

        final lat1 = 41.139129;
        final lon1 = 1.402244;

        final lat2 = 41.139074;
        final lon2 = 1.402315;

        setUp(() {
            gcd = new GreatCircleDistance.fromDegrees(
                latitude1: lat1, longitude1: lon1, latitude2: lat2, longitude2: lon2);
        });

        test('Distance from location 1 to location 2 - Should return non zero', () {
            expect(gcd.vincentyDistance(), isNonZero);
        });

        test('Distance from location 1 to location 2 - Should return non negative', () {
            expect(gcd.vincentyDistance(), isNonNegative);
        });

        test('Distance from location1 to same location should be Zero', () {
            final gcd = new GreatCircleDistance.fromDegrees(
                latitude1: lat1, longitude1: lon1, latitude2: lat1, longitude2: lon1);
            expect(gcd.vincentyDistance(), isZero);
        });

        test('Distance having ceros values as coordinates should be Zero', () {
            final gcd = new GreatCircleDistance.fromDegrees(
                latitude1: 0.0, longitude1: 0.0, latitude2: 0.0, longitude2: 0.0);
            expect(gcd.vincentyDistance(), isZero);
        });

        test('Distance from location1 to location2 should be around 8.53', () {
            expect(gcd.vincentyDistance(), inInclusiveRange(8.53, 8.54));
        });

        test('Distance from location1 to location2 should greather than 8', () {
            expect(gcd.vincentyDistance(), greaterThan(8));
        });

        test('Distance from location1 to location2 should less than 1', () {
            final gcd = new GreatCircleDistance.fromDegrees(
                latitude1: 41.140773, longitude1: 1.402221, latitude2: 41.140774, longitude2: 1.402222);
            expect(gcd.vincentyDistance(), lessThan(1.0));
        });

        test('Distance from location1 to location2 should closer to 8', () {
            final gcd = new GreatCircleDistance.fromDegrees(
                latitude1: 41.140773, longitude1: 1.402221, latitude2: 41.140716, longitude2: 1.402279);
            final distance = gcd.vincentyDistance();

            expect(distance, greaterThan(7.98));
            expect(distance, lessThan(8));
        });

    });
}
