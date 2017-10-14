import 'package:test/test.dart';

import 'coordinate_validation_test.dart' as coordinate;
import 'great_circle_distance_harvesine_test.dart' as haversine;
import 'great_circle_distance_spherical_lawofcosines_test.dart' as lawofcosines;
import 'great_circle_distance_vicenty_test.dart' as vicenty;

void main() {
    group('coordinate', coordinate.main);
    group('haversine', haversine.main);
    group('lawofcosines', lawofcosines.main);
    group('vicenty', vicenty.main);
}