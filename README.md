# Great-circle distance [![Pub][pub_version]](../../) ![Travis status][travis_status] [![Coverage Status][coverage_status]][coverage_page]

Calculate the great-circle distance between two points (having Latitude,Longitude) on the surface of Earth 
You can get the distance using the Spherical law of cosines, Haversine formula or Vincenty`s formula  

The [great-circle distance][3] is the shortest distance between two points on the surface of a sphere

![Great-circle distance (drawn in red) between two points on a sphere][great_circle_distance]
> A diagram illustrating great-circle distance (drawn in red) between two points on a sphere, P and Q. Two antipodal points, u and v, are also depicted. <br><br> By CheCheDaWaff (Own work) [CC BY-SA 4.0 (https://creativecommons.org/licenses/by-sa/4.0)], via Wikimedia Commons

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
[great_circle_distance]: https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/Illustration_of_great-circle_distance.svg/500px-Illustration_of_great-circle_distance.svg.png
[travis_status]: https://travis-ci.org/yeradis/great_circle_distance.dart.svg?branch=master
[coverage_page]: https://coveralls.io/github/yeradis/great_circle_distance.dart?branch=master
[coverage_status]: https://coveralls.io/repos/github/yeradis/great_circle_distance.dart/badge.svg?branch=master
[pub_version]: https://img.shields.io/pub/v/great_circle_distance.svg