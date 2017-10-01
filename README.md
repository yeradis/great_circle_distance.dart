# Great-circle distance

Calculate the great-circle distance on the Earth having a pair of Latitude/Longitude points

The *great-circle distance* is the shortest distance between two points on the surface of a sphere, measured along the surface of the sphere (as opposed to a straight line through the sphere's interior)

Included in this library:

- Spherical law of cosines 
- Haversine formula 
- Vincenty` formula (por from the Android implementation)

`Disclaimer`: The earth is not quite a sphere. This means that errors([0.3%][1],[0.5%][2] errors) from assuming spherical geometry might be considerable depending on the points; so: `don't trust your life on this value`

Usage example:

```dart
final lat1 = 41.139129;
final lon1 = 1.402244;

final lat2 = 41.139074;
final lon2 = 1.402315;

var gcd = new GreatCircleDistance.fromDegrees(latitude1: lat1, longitude1: lon1, latitude2: lat2, longitude2: lon2);

print('Distance from location 1 to 2 using the Haversine formula is: ${gcd.haversineDistance()}');
print('Distance from location 1 to 2 using the Spherical Law of Cosines is: ${gcd.sphericalLawOfCosinesDistance()}');
print('Distance from location 1 to 2 using the Vicenty`s formula is: ${gcd.vincentyDistance()}');
```

Check Wikipedia for detailed description on [Great-circle distance][3]

[1]: https://gis.stackexchange.com/questions/25494/how-accurate-is-approximating-the-earth-as-a-sphere#25580
[2]: https://en.wikipedia.org/wiki/Great-circle_distance#cite_note-1
[3]: https://en.wikipedia.org/wiki/Great-circle_distance